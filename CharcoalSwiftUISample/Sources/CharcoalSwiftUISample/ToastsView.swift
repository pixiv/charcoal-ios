import Charcoal
import SwiftUI

public struct ToastsView: View {
    @State var isPresenting = false
    @State var isPresenting2 = false
    @State var isPresenting3 = false
    @State var isPresenting4 = false

    @State var isPresentingToast = false
    @State var isPresentingToast2 = false
    @State var isPresentingToast3 = false
    @State var isPresentingToast4 = false

    public var body: some View {
        List {
            Section(header: Text("SnackBar")) {
                Button {
                    isPresenting.toggle()
                } label: {
                    Text("SnackBar")
                }
                .charcoalSnackBar(
                    isPresenting: $isPresenting,
                    text: "ブックマークしました",
                    dismissAfter: 4
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresenting2.toggle()
                    } label: {
                        Text("SnackBar")
                    }
                    Text("with Action")
                }
                .charcoalSnackBar(
                    isPresenting: $isPresenting2,
                    screenEdge: .top,
                    text: "ブックマークしました",
                    dismissAfter: 4,
                    action: {
                        Button {
                            print("Tapped")
                        } label: {
                            Text("編集")
                        }
                    }
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresenting3.toggle()
                    } label: {
                        Text("SnackBar")
                    }
                    Text("with Action and Thumbnail")
                }
                .charcoalSnackBar(
                    isPresenting: $isPresenting3,
                    text: "ブックマークしました",
                    thumbnailImage: Image("SnackbarDemo", bundle: Bundle.module),
                    dismissAfter: 4,
                    action: {
                        Button {
                            print("Tapped")
                        } label: {
                            Text("編集")
                        }
                    }
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresenting4.toggle()
                    } label: {
                        Text("SnackBar")
                    }
                    Text("Auto dismiss after 4 seconds")
                }
                .charcoalSnackBar(
                    isPresenting: $isPresenting4,
                    text: "ブックマークしました",
                    thumbnailImage: Image("SnackbarDemo", bundle: Bundle.module),
                    dismissAfter: 4,
                    action: {
                        Button {
                            print("Tapped")
                        } label: {
                            Text("編集")
                        }
                    }
                )
            }

            Section(header: Text("Toasts")) {
                Button {
                    isPresentingToast.toggle()
                } label: {
                    Text("Toast")
                }
                .charcoalToast(
                    isPresenting: $isPresentingToast,
                    text: "テキストメッセージ",
                    dismissAfter: 4
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresentingToast2.toggle()
                    } label: {
                        Text("Toast")
                    }
                    Text("with Action")
                }
                .charcoalToast(
                    isPresenting: $isPresentingToast2,
                    screenEdge: .top,
                    text: "テキストメッセージ",
                    dismissAfter: 4,
                    action: {
                        Button {
                            isPresentingToast2 = false
                        } label: {
                            Image(charocalIcon: .remove16)
                                .renderingMode(.template)
                        }
                    }
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresentingToast3.toggle()
                    } label: {
                        Text("Toast(Error Appearance)")
                    }
                    Text("with Custom Animation")
                }
                .charcoalToast(
                    isPresenting: $isPresentingToast3,
                    text: "ブックマークしました",
                    dismissAfter: 4,
                    appearance: .error,
                    animationConfiguration: CharcoalToastAnimationConfiguration(enablePositionAnimation: false, animation: .easeInOut),
                    action: {
                        Button {
                            isPresentingToast3 = false
                        } label: {
                            Image(charocalIcon: .remove16)
                                .renderingMode(.template)
                        }
                    }
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresentingToast4.toggle()
                    } label: {
                        Text("Toast(Error Appearance)")
                    }
                    Text("Auto dismiss after 4 seconds")
                }
                .charcoalToast(
                    isPresenting: $isPresentingToast4,
                    text: "ブックマークしました",
                    dismissAfter: 4,
                    appearance: .error
                )
            }
        }.navigationBarTitle("Toasts")
    }
}

#Preview {
    NavigationView {
        ToastsView()
    }.charcoalOverlayContainer()
}
