import SwiftUI

struct TooltipBubbleShape: Shape {
    /// The target point which
    let targetPoint: CGPoint
    /// The height of the arrow
    let arrowHeight: CGFloat
    /// The corner radius of the tooltip
    let cornerRadius: CGFloat
    /// The width of the arrow
    let arrowWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        var arrowY = rect.minY - arrowHeight
        var arrowBaseY = rect.minY

        // The minimum and maximum x position of the arrow
        let minX = rect.minX + cornerRadius + arrowWidth
        let maxX = rect.maxX - cornerRadius - arrowWidth

        // The x position of the arrow
        let arrowMidX = min(max(minX, targetPoint.x), maxX)

        var arrowMaxX = arrowMidX + arrowWidth

        var arrowMinX = arrowMidX - arrowWidth

        // Check if the arrow should be on top of the tooltip
        if targetPoint.y > rect.minY {
            arrowY = rect.maxY + arrowHeight
            arrowBaseY = rect.maxY
            arrowMaxX = arrowMidX - arrowWidth
            arrowMinX = arrowMidX + arrowWidth
        }

        var bubblePath = RoundedRectangle(cornerRadius: cornerRadius).path(in: rect)
        let arrowPath = Path { path in
            path.move(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
            path.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
            path.addLine(to: CGPoint(x: arrowMidX, y: arrowY))
            path.closeSubpath()
        }

        bubblePath.addPath(arrowPath)
        return bubblePath
    }
}

extension Shape {
    /// fills and strokes a shape
    public func fill<S:ShapeStyle>(
        _ fillContent: S,
        stroke       : StrokeStyle
    ) -> some View {
        ZStack {
            self.fill(fillContent)
            self.stroke(Color.white, lineWidth: 2)
        }
    }
}
