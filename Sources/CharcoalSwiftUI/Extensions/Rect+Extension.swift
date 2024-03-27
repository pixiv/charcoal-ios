import Foundation

extension CGRect {
    // Calculate the intersection area of two rectangles
    func intersectionArea(_ rect: CGRect) -> CGFloat {
        let rect = intersection(rect)

        return rect.width * rect.height
    }
}
