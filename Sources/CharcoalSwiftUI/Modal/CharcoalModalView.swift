import SwiftUI

struct CharcoalModalView<ModalContent: View, ActionContent: View>: View {
    /// The title of the modal view.
    var title: String?
    /// The style of the modal view.
    var style: CharcoalModalStyle
    /// Whether to show the close button on the modal view.
    var showCloseButton: Bool
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
    @State private var indicatorInset: CGFloat = .zero
    // Animation states
    @State private var modalOpacity: Double = 0.0
    @State private var modalScale: CGSize
    @State private var modalOffset: CGSize = .zero
    @State private var modalInitailOffset: CGSize = .zero
    @State private var backgroundOpacity: Double = 0.0
    @State private var modalOffsetAnimation: Animation?

    init(
        title: String?,
        style: CharcoalModalStyle = .center,
        showCloseButton: Bool,
        tapBackgroundToDismiss: Bool,
        duration: Double,
        maxWidth: CGFloat,
        isPresented: Binding<Bool>,
        @ViewBuilder actions: () -> ActionContent?,
        @ViewBuilder modalContent: () -> ModalContent
    ) {
        self.title = title
        self.style = style
        self.showCloseButton = showCloseButton
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
        // Shedule the animation to the next runloop
        DispatchQueue.main.async {
            modalOffsetAnimation = .easeInOut(duration: duration)

            if style == .center {
                self.modalOffset = CGSize.zero
            } else {
                self.modalOffset = isPresented ? CGSize.zero : modalInitailOffset
            }

            modalOpacity = isPresented ? 1.0 : 0.0

            if style == .center {
                modalScale = isPresented ? CGSize(width: 1.0, height: 1.0) : (UIAccessibility.isReduceMotionEnabled ? CGSize(width: 1.0, height: 1.0) : style.modalScale)
            }

            backgroundOpacity = isPresented ? 1.0 : 0.0
        }
    }

    var body: some View {
        return GeometryReader { proxy in
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
                contentView(proxy: proxy)
                    .frame(minWidth: 280, maxWidth: maxWidth)
                    .background(Rectangle().cornerRadius(32, corners: style.roundedCorners).foregroundStyle(charcoalColor: .surface1))
                    .opacity(modalOpacity)
                    .padding(style.padding)
                    .offset(modalOffset)
                    .animation(modalOffsetAnimation, value: modalOffset)
                    .animation(.easeInOut(duration: duration), value: modalOpacity)
                    .scaleEffect(modalScale)
                    .animation(UIAccessibility.isReduceMotionEnabled ? .none : .easeInOut(duration: duration * 0.5), value: modalScale)
                    .overlay(GeometryReader { modalGeomtry in
                        Color.clear.preference(key: ModalViewHeightKey.self, value: modalGeomtry.size.height)
                    })
            })
            .onPreferenceChange(ModalViewHeightKey.self, perform: { value in
                let offset = CGSize(width: 0, height: value)
                if style == .bottomSheet {
                    // Set the initial offset to the modal size
                    // To made an animation that modal slides up from bottom
                    if self.modalInitailOffset == .zero, !UIAccessibility.isReduceMotionEnabled {
                        self.modalOffset = offset
                    }

                    if !UIAccessibility.isReduceMotionEnabled {
                        self.modalInitailOffset = offset
                    }
                }
            })
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .onChange(of: isPresented, perform: { newValue in
            if !newValue {
                prepareAnimation()
            }
        })
        .onAppear {
            // Shedule the prepare function to the next runloop
            DispatchQueue.main.async {
                prepareAnimation()
            }
        }
    }

    private func contentView(proxy: GeometryProxy) -> some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                if let title = title {
                    Text(title).charcoalTypography20Bold(isSingleLine: true)
                        .padding(EdgeInsets(top: 20, leading: 48, bottom: 20, trailing: 48))
                }

                modalContent

                if let actions = actions {
                    VStack {
                        actions
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: style == .center ? 20 : indicatorInset, trailing: 20))
                    .onAppear {
                        indicatorInset = max(proxy.safeAreaInsets.bottom, 30)
                    }
                }
            }

            if showCloseButton {
                Button {
                    isPresented = false
                } label: {
                    Image(charcoalIcon: .close24)
                }
                .padding(.all, 12)
            }
        }
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
    /**
     A view modifier that presents a modal view.

     - Parameters:
        - title: The title of the modal view.
        - style: The style of the modal view.
        - showCloseButton: Whether to show the close button on the modal view.
        - tapBackgroundToDismiss: Tap on background to dismiss.
        - duration: The duration of the animation
        - maxWidth: The max width of the modal view.
        - isPresented: A binding to whether the modal view is presented.
        - actions: The content of the action view
        - modalContent: The content of the modal view

     # Example #
     ```swift
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
        Text("Hello This is a center dialog from Charcoal")
     }
     ```
     */
    func charcoalModal(
        title: String? = nil,
        style: CharcoalModalStyle = .center,
        showCloseButton: Bool = true,
        tapBackgroundToDismiss: Bool = true,
        duration: Double = 0.25,
        maxWidth: CGFloat = 440,
        isPresented: Binding<Bool>,
        @ViewBuilder actions: @escaping () -> some View,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        charcoalFullScreenCover(isPresented: isPresented, duration: duration, content: {
            CharcoalModalView(title: title, style: style, showCloseButton: showCloseButton, tapBackgroundToDismiss: tapBackgroundToDismiss, duration: duration, maxWidth: maxWidth, isPresented: isPresented, actions: actions, modalContent: content)
        })
    }
}

#if compiler(>=6.0)
    @available(iOS 17, *)
    #Preview {
        @Previewable @State var isPresented = false
        @Previewable @State var text1 = ""

        ZStack {
            Button(action: {
                isPresented = true
            }, label: {
                Text("Show")
                    .padding()
            })
            .charcoalModal(
                title: "Title",
                style: .center,
                showCloseButton: true,
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
                VStack(spacing: 10) {
                    Text("Hello This is a center dialog from Charcoal")
                        .charcoalTypography16Regular()
                        .frame(maxWidth: .infinity)

                    TextField("Simple text field", text: $text1).charcoalTextField()
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
    }
#endif
