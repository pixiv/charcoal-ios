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
        var arrowBaseY = rect.minY + 1

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
            arrowBaseY = rect.maxY - 1
            arrowMaxX = arrowMidX - arrowWidth
            arrowMinX = arrowMidX + arrowWidth
        }

        var bubblePath = RoundedRectangle(cornerRadius: cornerRadius).path(in: rect)
        let arrowPath = Path { path in
            path.move(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
            path.addLine(to: CGPoint(x: arrowMidX, y: arrowY))
            path.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
//            path.closeSubpath()
        }
        
        var combinedPath = bubblePath.cgPath
        
        if #available(iOS 16.0, *) {
            combinedPath = bubblePath.cgPath.union(arrowPath.cgPath)
        } else {
            // Fallback on earlier versions
        }

        return Path(combinedPath)
    }
}

extension Shape {
    /// fills and strokes a shape
    public func fill<S:ShapeStyle>(
        _ fillContent: S,
        strokeColor: Color,
        lineWidth: CGFloat
    ) -> some View {
        ZStack {
            self.fill(fillContent)
            self.stroke(strokeColor, lineWidth: 2)
        }
    }
}

private struct BubbleShapePreview: View {
    var body: some View {
        ZStack {
            Color.gray
            TooltipBubbleShape(
                targetPoint:
                CGPoint(
                    x: 0,
                    y: 0
                ),
                arrowHeight: 4,
                cornerRadius: 16,
                arrowWidth: 8
            )
            .fill(Color(CharcoalAsset.ColorPaletteGenerated.brand.color), strokeColor: Color.white, lineWidth: 2)
            .frame(width: 240, height: 100)
        }.ignoresSafeArea()
    }
}


#Preview {
    BubbleShapePreview()
}
