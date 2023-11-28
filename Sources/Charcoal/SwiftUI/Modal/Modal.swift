import SwiftUI

public enum CharcoalModalStyle {
case center
case bottom
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
    @State private var modalOffset: CGSize = CGSize(width: 0, height: 15.0)
    @State private var backgroundOpacity: Double = 0.0
    
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
    }
    
    func prepareAnimation() {
        withAnimation(.easeInOut(duration: duration)) {
            self.modalOpacity = isPresented ? 1.0 : 0.0
            self.modalOffset = isPresented ? CGSize(width: 0, height: 0.0) : CGSize(width: 0, height: 15.0)
        }
        
        withAnimation(.easeInOut(duration: duration * 0.5)) {
            self.backgroundOpacity = isPresented ? 1.0 : 0.0
        }
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
                ZStack(alignment: style == .center ? .center : .bottom, content: {
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.6))
                        .opacity(backgroundOpacity)
                        .ignoresSafeArea(.all)
                        .onTapGesture {
                            isPresented = false
                        }
                   
                    VStack(spacing: 0) {
                        Text(title).charcoalTypography20Bold(isSingleLine: true)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                        modalContent
                        VStack {
                            actions
                        }
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                    }
                    .frame(minWidth: 280)
                    .background(Rectangle().cornerRadius(32, corners: [.topLeft, .topRight]).foregroundColor(.white))
                    .opacity(modalOpacity)
                    .offset(modalOffset)
                    .padding(style == .center ? 24 : 0)
                })
                .ignoresSafeArea(.container)
                .background(BackgroundTransparentView())
                .onAppear {
                    if !UIView.areAnimationsEnabled {
                        UIView.setAnimationsEnabled(true)
                    }
                    
                    prepareAnimation()
                }
                .onDisappear {
                    if !UIView.areAnimationsEnabled {
                        UIView.setAnimationsEnabled(true)
                    }
                }
            })
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
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
                       style: .bottom,
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
            VStack {
                Text("Hello This is a dialog about Charcoal")
                    .charcoalTypography16Regular()
               
                if #available(iOS 15, *) {
                    TextField("Simple text field", text: $text1).charcoalTextField()
                } else {
                    // Fallback on earlier versions
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
    }
}
