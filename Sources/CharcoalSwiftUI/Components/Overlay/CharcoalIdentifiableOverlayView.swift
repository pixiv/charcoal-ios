import SwiftUI

struct CharcoalIdentifiableOverlayView: View {
    typealias IDValue = UUID
    
    /// The unique ID of the overlay.
    let id: IDValue
    
    /// The content to display in the overlay.
    let contentView: AnyView
    
    /// If true, the overlay will be dismissed when the user taps outside of the overlay.
    let dismissOnTouchOutside: Bool
    
    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool
    
    /// If true, the overlay will be dismissed when the user taps outside of the overlay.
    let dismissAfter: TimeInterval?

    var body: some View {
        ZStack {
            if dismissOnTouchOutside && isPresenting {
                Color.clear
                    .contentShape(Rectangle())
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                isPresenting = false
                            }
                    )
                    .simultaneousGesture(
                        DragGesture()
                            .onChanged { _ in
                                isPresenting = false
                            }
                    )
            }
            if isPresenting {
                contentView.onAppear {
                    if let dismissAfter = dismissAfter {
                        DispatchQueue.main.asyncAfter(deadline: .now() + dismissAfter) {
                            isPresenting = false
                        }
                    }
                }
            }
        }.animation(.easeInOut(duration: 0.2), value: isPresenting)
            
    }
}
