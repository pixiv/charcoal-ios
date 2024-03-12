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
        var mordenAPI = false
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
        
        // Fallback on earlier versions
        // Draw the bubble with the arrow
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: .init(x: rect.minX + cornerRadius, y: rect.minY))
            if arrowBaseY == rect.minY {
                p.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
                p.addLine(to: CGPoint(x: arrowMidX, y: arrowY))
                p.addLine(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
            }
            p.addLine(to: .init(x: rect.maxX - cornerRadius, y: rect.minY))
            p.addArc(
                tangent1End: .init(x: rect.maxX, y: rect.minY),
                tangent2End: .init(x: rect.maxX, y: rect.minY + cornerRadius),
                radius: cornerRadius
            )
            p.addLine(to: .init(x: rect.maxX, y: rect.maxY - cornerRadius))
            p.addArc(
                tangent1End: .init(x: rect.maxX, y: rect.maxY),
                tangent2End: .init(x: rect.maxX - cornerRadius, y: rect.maxY),
                radius: cornerRadius
            )
            if arrowBaseY == rect.maxY {
                p.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
                p.addLine(to: CGPoint(x: arrowMidX, y: arrowY))
                p.addLine(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
            }
            p.addLine(to: .init(x: rect.minX + cornerRadius, y: rect.maxY))
            p.addArc(
                tangent1End: .init(x: rect.minX, y: rect.maxY),
                tangent2End: .init(x: rect.minX, y: rect.maxY - cornerRadius),
                radius: cornerRadius
            )
            p.addLine(to: .init(x: rect.minX, y: rect.minY + cornerRadius))
            p.addArc(
                tangent1End: .init(x: rect.minX, y: rect.minY),
                tangent2End: .init(x: rect.minX + cornerRadius, y: rect.minY),
                radius: cornerRadius
            )
            p.closeSubpath()
        }

        return path
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
            VStack {
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
                
                TooltipBubbleShape(
                    targetPoint:
                    CGPoint(
                        x: 200,
                        y: 200
                    ),
                    arrowHeight: 4,
                    cornerRadius: 16,
                    arrowWidth: 8
                )
                .fill(Color(CharcoalAsset.ColorPaletteGenerated.brand.color), strokeColor: Color.white, lineWidth: 2)
                .frame(width: 240, height: 100)
            }
        }.ignoresSafeArea()
    }
}


#Preview {
    BubbleShapePreview()
}
