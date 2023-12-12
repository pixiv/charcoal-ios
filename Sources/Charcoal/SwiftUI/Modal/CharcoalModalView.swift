import SwiftUI

/**
    A view modifier that presents a modal view.
    - Parameters:
        - title: The title of the modal view.
        - style: The style of the modal view.
        - tapBackgroundToDismiss: Tap on background to dismiss.
        - duration: The duration of the animation
        - maxWidth: The max width of the modal view.
        - isPresented: A binding to whether the modal view is presented.
        - actions: The content of the action view
        - modalContent: The content of the modal view

    # Example #
    ```swift
    CharcoalModalView(title: "Title", style: .center, isPresented: $isPresented, actions: {
        Button(action: {
            isPresented = false
        }, label: {
            Text("OK")
        })
    }, modalContent: {
        Text("Content")
    })
    ```
 */
struct CharcoalModalView<ModalContent: View, ActionContent: View>: ViewModifier {
    /// The title of the modal view.
    var title: String?
    /// The style of the modal view.
    var style: CharcoalModalStyle
    /// Tap on background to dismiss.
    var tapBackgroundToDismiss: Bool
    /// The duration of the animation
    let duration: Double
    /// The max width of the modal view.
    let maxWidth: CGFloat
    /// A binding to whether the modal view is presented.
    @Binding var isPresented: Bool
    /// The content of the action view
    private let actions: ActionContent?
    /// The content of the modal view
    private let modalContent: ModalContent
    /// The actual state of the modal view
    @State private var isActualPresented: Bool
    /// The bottom inset of the safe area.
    @State private var indicatorInset: CGFloat?
    // Animation states
    @State private var modalOpacity: Double = 0.0
    @State private var modalScale: CGSize
    @State private var modalOffset: CGSize = .zero
    @State private var modalInitailOffset: CGSize?
    @State private var backgroundOpacity: Double = 0.0

    init(
        title: String?,
        style: CharcoalModalStyle = .center,
        tapBackgroundToDismiss: Bool = true,
        duration: Double = 0.25,
        maxWidth: CGFloat = 440,
        isPresented: Binding<Bool>,
        @ViewBuilder actions: () -> ActionContent?,
        @ViewBuilder modalContent: () -> ModalContent
    ) {
        self.title = title
        self.style = style
        self.tapBackgroundToDismiss = tapBackgroundToDismiss
        self.duration = duration
        self.maxWidth = maxWidth
        _isPresented = isPresented
        _isActualPresented = State(initialValue: isPresented.wrappedValue)
        self.modalContent = modalContent()
        self.actions = actions()
        _modalScale = style == .center ? State(initialValue: style.modalScale) : State(initialValue: CGSize(width: 1.0, height: 1.0))
    }

    func prepareAnimation() {
        var transaction = Transaction(animation: .easeInOut(duration: duration))
        transaction.disablesAnimations = true

        withTransaction(transaction) {
            if style == .center {
                self.modalOffset = CGSize.zero
            } else {
                self.modalOffset = isPresented ? CGSize.zero : (UIAccessibility.isReduceMotionEnabled ? .zero : modalInitailOffset ?? .zero)
            }
        }

        modalOpacity = isPresented ? 1.0 : 0.0

        if style == .center {
            modalScale = isPresented ? CGSize(width: 1.0, height: 1.0) : (UIAccessibility.isReduceMotionEnabled ? CGSize(width: 1.0, height: 1.0) : style.modalScale)
        }

        backgroundOpacity = isPresented ? 1.0 : 0.0
    }

    /// Get the bottom inset of the safe area.
    /// - Parameter geometry: The geometry proxy.
    /// - Returns: The bottom inset of the safe area.
    func getBottomIndicatorInset(geometry: GeometryProxy) -> CGFloat {
        indicatorInset = indicatorInset ?? geometry.safeAreaInsets.bottom
        return indicatorInset ?? 0
    }

    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented, perform: { newValue in
                if style == .fullScreen {
                    isActualPresented = newValue
                } else {
                    UIView.setAnimationsEnabled(false)
                    if newValue {
                        isActualPresented = newValue
                    } else {
                        Task {
                            prepareAnimation()
                            // Wait for the dismiss animation to finish
                            try await Task.sleep(nanoseconds: UInt64(self.duration * 1000) * 1000000)
                            self.isActualPresented = newValue
                        }
                    }
                }
            })
            // use fullScreenCover to make sure modal always shows on top
            .fullScreenCover(isPresented: $isActualPresented, content: {
                if style == .fullScreen {
                    VStack {
                        modalContent

                        if let actions = actions {
                            VStack {
                                actions
                            }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        }
                    }
                } else {
                    GeometryReader(content: { geometry in
                        ZStack(alignment: style.alignment, content: {
                            Rectangle()
                                .foregroundColor(Color.black.opacity(0.6))
                                .opacity(backgroundOpacity)
                                .animation(.easeInOut(duration: duration), value: backgroundOpacity)
                                .ignoresSafeArea(.all)
                                .onTapGesture {
                                    if tapBackgroundToDismiss {
                                        isPresented = false
                                    }
                                }

                            // Modal Content
                            VStack(spacing: 0) {
                                if let title = title {
                                    Text(title).charcoalTypography20Bold(isSingleLine: true)
                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                                }

                                modalContent

                                if let actions = actions {
                                    VStack {
                                        actions
                                    }
                                    .padding(EdgeInsets(top: 20, leading: 20, bottom: style == .center ? 20 : getBottomIndicatorInset(geometry: geometry), trailing: 20))
                                }
                            }
                            .frame(minWidth: 280, maxWidth: maxWidth)
                            .background(Rectangle().cornerRadius(32, corners: style.roundedCorners).foregroundStyle(charcoalColor: .surface1))
                            .opacity(modalOpacity)
                            .padding(style.padding)
                            .offset(modalOffset)
                            .animation(.easeInOut(duration: duration), value: modalOpacity)
                            .scaleEffect(modalScale)
                            .animation(UIAccessibility.isReduceMotionEnabled ? .none : .easeInOut(duration: duration * 0.5), value: modalScale)
                            .overlay(GeometryReader { modalGeomtry in
                                Color.clear.preference(key: ModalViewHeightKey.self, value: modalGeomtry.size.height)
                            })
                        })
                        .onPreferenceChange(ModalViewHeightKey.self, perform: { value in
                            let modalSize = CGSize(width: 0, height: value)
                            if style == .bottomSheet {
                                // Set the initial offset to the modal size
                                if self.modalInitailOffset == nil, !UIAccessibility.isReduceMotionEnabled {
                                    self.modalOffset = modalSize
                                }
                                self.modalInitailOffset = modalSize
                            }
                        })
                        .ignoresSafeArea(.container, edges: .bottom)
                        .background(BackgroundTransparentView())
                        .onAppear {
                            if !UIView.areAnimationsEnabled {
                                UIView.setAnimationsEnabled(true)
                            }

                            // Magic: Add some delay to wait for initial modalOffset
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                prepareAnimation()
                            }
                        }
                        .onDisappear {
                            if !UIView.areAnimationsEnabled {
                                UIView.setAnimationsEnabled(true)
                            }
                        }
                    })
                }
            })
    }
}

private struct ModalTransactionKey: TransactionKey {
    static let defaultValue = false
}

struct ModalViewHeightKey: PreferenceKey {
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

    static var defaultValue: CGFloat = .zero
}

public extension View {
    func charcoalModal(title: String? = nil, style: CharcoalModalStyle = .center, isPresented: Binding<Bool>, @ViewBuilder actions: @escaping () -> some View, @ViewBuilder content: @escaping () -> some View) -> some View {
        modifier(CharcoalModalView(title: title, style: style, isPresented: isPresented, actions: actions, modalContent: content))
    }
}

@available(iOS 17, *)
#Preview {
    @State var isPresented = true
    @State var text1: String = ""

    return ZStack {
        Button(action: {
            isPresented = true
        }, label: {
            Text("Show")
                .padding()
        })
        .charcoalModal(
            title: "Title",
            style: .center,
            isPresented: $isPresented,
            actions: {
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("OK").frame(maxWidth: .infinity)
                }).charcoalPrimaryButton(size: .medium)

                Button(action: {
                    isPresented = false
                }, label: {
                    Text("Dismiss").frame(maxWidth: .infinity)
                }).charcoalDefaultButton(size: .medium)
            }
        ) {
            NavigationView {
                VStack(spacing: 10) {
                    Text("Hello This is a center dialog from Charcoal")
                        .charcoalTypography16Regular()
                        .frame(maxWidth: .infinity)

                    TextField("Simple text field", text: $text1).charcoalTextField()
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .navigationTitle("SwiftUI")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
