import SwiftUI

public enum CharcoalModalStyle {
    case center
    case bottom
    
    var modalScale: CGSize {
        switch self {
        case .center:
            return CGSize(width: 1.05, height: 1.05)
        case .bottom:
            return CGSize(width: 1.0, height: 1.0)
        }
    }
}

struct CharcoalModalView<ModalContent: View, ActionContent: View>: ViewModifier {
    var title: String
    var style: CharcoalModalStyle
    @Binding var isPresented: Bool
    @State private var isActualPresented: Bool
    private let actions: ActionContent
    private let modalContent: ModalContent
    private let duration: Double = 0.25
    @State private var modalOpacity: Double = 0.0
    @State private var modalScale: CGSize
    @State private var modalOffset: CGSize = CGSize.zero
    @State private var modalInitailOffset: CGSize?
    @State private var backgroundOpacity: Double = 0.0
    @State private var indicatorInset: CGFloat?
    
    init(title: String,
         style: CharcoalModalStyle = .center,
         isPresented: Binding<Bool>,
         @ViewBuilder actions: () -> ActionContent,
         @ViewBuilder modalContent: () -> ModalContent) {
        self.title = title
        self.style = style
        self._isPresented = isPresented
        self._isActualPresented = State(initialValue: isPresented.wrappedValue)
        self.modalContent = modalContent()
        self.actions = actions()
        self._modalScale = style == .center ? State(initialValue: style.modalScale) : State(initialValue: CGSize(width: 1.0, height: 1.0))
    }
    
    func prepareAnimation() {
        var transaction = Transaction(animation: .easeInOut(duration: duration))
        transaction.disablesAnimations = true

        withTransaction(transaction) {
            if style == .center {
                self.modalOffset = CGSize.zero
            } else {
                self.modalOffset = isPresented ? CGSize.zero : (UIAccessibility.isReduceMotionEnabled ? .zero : modalInitailOffset ?? .zero )
            }
        }
        
        self.modalOpacity = isPresented ? 1.0 : 0.0
        
        if style == .center {
            self.modalScale = isPresented ? CGSize(width: 1.0, height: 1.0) : (UIAccessibility.isReduceMotionEnabled ? CGSize(width: 1.0, height: 1.0) : style.modalScale)
        }
        
        self.backgroundOpacity = isPresented ? 1.0 : 0.0
    }
    
    func getIndicatorInset(geometry: GeometryProxy) -> CGFloat {
        indicatorInset = indicatorInset ?? geometry.safeAreaInsets.bottom
        return indicatorInset ?? 0
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented, perform: { newValue in
                UIView.setAnimationsEnabled(false)
                if newValue {
                    isActualPresented = newValue
                } else {
                    Task { @MainActor in
                        prepareAnimation()
                    }
                    Task {
                        try await Task.sleep(nanoseconds: UInt64(self.duration*1000)*1000000)
                        self.isActualPresented = newValue
                    }
                }
            })
            .fullScreenCover(isPresented: $isActualPresented, content: {
                GeometryReader(content: { geometry in
                    ZStack(alignment: style == .center ? .center : .bottom, content: {
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.6))
                            .opacity(backgroundOpacity)
                            .animation(.easeInOut(duration: duration), value: backgroundOpacity)
                            .ignoresSafeArea(.all)
                            .onTapGesture {
                                isPresented = false
                            }
                       
                        // Modal Content
                        VStack(spacing: 0) {
                            Text(title).charcoalTypography20Bold(isSingleLine: true)
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                            modalContent
                            VStack {
                                actions
                            }
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: style == .center ? 20 : getIndicatorInset(geometry: geometry), trailing: 20))
                            .ignoresSafeArea(.container, edges: .top)
                        }
                        .frame(minWidth: 280)
                        .background(Rectangle().cornerRadius(32, corners:  style == .center ? [.allCorners] : [.topLeft, .topRight]).foregroundColor(.white))
                        .opacity(modalOpacity)
                        .padding(style == .center ? 24 : 0)
                        .offset(modalOffset)
                        .animation(.easeInOut(duration: duration), value: modalOpacity)
                        .scaleEffect(modalScale)
                        .animation(UIAccessibility.isReduceMotionEnabled ? .none : .easeInOut(duration: duration * 0.5), value: modalScale)
                        .overlay(GeometryReader { modalGeomtry in
                            Color.clear.preference(key: ViewHeightKey.self, value: modalGeomtry.size.height)
                        })
                    })
                    .onPreferenceChange(ViewHeightKey.self, perform: { value in
                        let modalSize = CGSize(width: 0, height: value)
                        if style == .bottom {
                            if self.modalInitailOffset == nil && !UIAccessibility.isReduceMotionEnabled {
                                self.modalOffset = modalSize
                            }
                            self.modalInitailOffset = modalSize
                        }
                    })
                    .ignoresSafeArea(.container)
                    .background(BackgroundTransparentView())
                    .onAppear {
                        if !UIView.areAnimationsEnabled {
                            UIView.setAnimationsEnabled(true)
                        }
                        
                        // Add some delay to wait for modalOffset from onPreferenceChange of ViewHeightKey
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
                            prepareAnimation()
                        })
                    }
                    .onDisappear {
                        if !UIView.areAnimationsEnabled {
                            UIView.setAnimationsEnabled(true)
                        }
                    }
                })
            })
    }
}

private struct ModalTransactionKey: TransactionKey {
    static let defaultValue = false
}

struct ViewHeightKey: PreferenceKey {
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    static var defaultValue: CGFloat = .zero
}

extension View {
    public func charcoalModal(title: String, style: CharcoalModalStyle = .center, isPresented: Binding<Bool>, @ViewBuilder actions: @escaping () -> some View, @ViewBuilder content: @escaping () -> some View) -> some View {
        self.modifier(CharcoalModalView(title: title, style: style, isPresented: isPresented, actions: actions, modalContent: content))
    }
}

#Preview {
    @State var isPresented = true
    @State var text1: String = ""
    
    return ZStack {
        VStack {
            Color.orange.padding(100)
        }
        
        Button(action: {
            isPresented = true
        }, label: {
            Text("Show")
                .padding()
        })
        .charcoalModal(title: "Title",
                       style: .center,
                       isPresented: $isPresented,
                       actions: {
            Button(action: {
                isPresented = false
            }, label: {
                Text("OK") .frame(maxWidth: .infinity)
            }).charcoalPrimaryButton(size: .medium)
              
            
            Button(action: {
                isPresented = false
            }, label: {
                Text("Dismiss") .frame(maxWidth: .infinity)
            }).charcoalDefaultButton(size: .medium)
        }) {
            VStack(spacing: 10) {
                Text("Hello This is a center dialog from Charcoal")
                    .charcoalTypography16Regular()
                    .frame(maxWidth: .infinity)
               
                if #available(iOS 15, *) {
                    TextField("Simple text field", text: $text1).charcoalTextField()
                } else {
                    // Fallback on earlier versions
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
    }
}
