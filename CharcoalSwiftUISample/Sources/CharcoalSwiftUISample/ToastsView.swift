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
                    text: "ブックマークしました"
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
                    Text("without Auto Dismiss")
                }
                .charcoalSnackBar(
                    isPresenting: $isPresenting4,
                    text: "ブックマークしました",
                    thumbnailImage: Image("SnackbarDemo", bundle: Bundle.module),
                    dismissAfter: nil,
                    action: {
                        Button {
                            isPresenting4 = false
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
                    text: "テキストメッセージ"
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
                    action: {
                        Button {
                            isPresentingToast2 = false
                        } label: {
                            Image(charcoalIcon: .remove16)
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
                    appearance: .error,
                    animationConfiguration: CharcoalToastAnimationConfiguration(enablePositionAnimation: false, animation: .easeInOut),
                    action: {
                        Button {
                            isPresentingToast3 = false
                        } label: {
                            Image(charcoalIcon: .remove16)
                                .renderingMode(.template)
                        }
                    }
                )

                VStack(alignment: .leading) {
                    Button {
                        isPresentingToast4.toggle()
                    } label: {
                        Text("Toast")
                    }
                    Text("without Auto Dismiss")
                }
                .charcoalToast(
                    isPresenting: $isPresentingToast4,
                    text: "テキストメッセージ",
                    dismissAfter: nil,
                    action: {
                        Button {
                            isPresentingToast4 = false
                        } label: {
                            Image(charcoalIcon: .remove16)
                                .renderingMode(.template)
                        }
                    }
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
