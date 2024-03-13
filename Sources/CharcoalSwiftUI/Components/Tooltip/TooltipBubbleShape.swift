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
        
        var pointPosition: CharcoalTooltipLayoutPriority
        
        if targetPoint.x < rect.minX && targetPoint.y > rect.minY {
            pointPosition = .left
        } else if targetPoint.x > rect.maxX && targetPoint.y > rect.minY {
            pointPosition = .right
        } else if targetPoint.y < rect.minY {
            pointPosition = .top
        } else {
            pointPosition = .bottom
        }
        
        let path = Path { p in
            p.move(to: .init(x: rect.minX + cornerRadius, y: rect.minY))
            if pointPosition == .top {
                let arrowY = rect.minY - arrowHeight
                let arrowBaseY = rect.minY
                
                // The minimum and maximum x position of the arrow
                let minX = rect.minX + cornerRadius + arrowWidth
                let maxX = rect.maxX - cornerRadius - arrowWidth

                // The x position of the arrow
                let arrowMidX = min(max(minX, targetPoint.x), maxX)

                let arrowMaxX = arrowMidX + arrowWidth

                let arrowMinX = arrowMidX - arrowWidth

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
            if pointPosition == .right {
                let arrowX = rect.maxX + arrowHeight
                let arrowBaseX = rect.maxX
                
                // The minimum and maximum x position of the arrow
                let minY = rect.minY + cornerRadius + arrowWidth
                let maxY = rect.maxY - cornerRadius - arrowWidth

                // The x position of the arrow
                let arrowMidY = min(max(minY, targetPoint.y), maxY)

                let arrowMaxY = arrowMidY + arrowWidth

                let arrowMinY = arrowMidY - arrowWidth

                p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMinY))
                p.addLine(to: CGPoint(x: arrowX, y: arrowMidY))
                p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMaxY))
            }
            p.addLine(to: .init(x: rect.maxX, y: rect.maxY - cornerRadius))
            p.addArc(
                tangent1End: .init(x: rect.maxX, y: rect.maxY),
                tangent2End: .init(x: rect.maxX - cornerRadius, y: rect.maxY),
                radius: cornerRadius
            )
            if pointPosition == .bottom {
                let arrowY = rect.maxY + arrowHeight
                let arrowBaseY = rect.maxY
                
                // The minimum and maximum x position of the arrow
                let minX = rect.minX + cornerRadius + arrowWidth
                let maxX = rect.maxX - cornerRadius - arrowWidth

                // The x position of the arrow
                let arrowMidX = min(max(minX, targetPoint.x), maxX)
                
                
                let arrowMaxX = arrowMidX - arrowWidth
                let arrowMinX = arrowMidX + arrowWidth
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
            if pointPosition == .left {
                let arrowX = rect.minX - arrowHeight
                let arrowBaseX = rect.minX
                
                // The minimum and maximum x position of the arrow
                let minY = rect.minY + cornerRadius + arrowWidth
                let maxY = rect.maxY - cornerRadius - arrowWidth

                // The x position of the arrow
                let arrowMidY = min(max(minY, targetPoint.y), maxY)

                let arrowMaxY = arrowMidY + arrowWidth

                let arrowMinY = arrowMidY - arrowWidth

                p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMaxY))
                p.addLine(to: CGPoint(x: arrowX, y: arrowMidY))
                p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMinY))
            }
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
                        y: -10
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
                
                
                TooltipBubbleShape(
                    targetPoint:
                    CGPoint(
                        x: 300,
                        y: 50
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
                        x: -10,
                        y: 50
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
