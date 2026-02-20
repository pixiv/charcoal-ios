import UIKit

enum CharcoalTooltipLayoutPriority: Codable {
    case bottom
    case top
    case right
    case left
}

class CharcoalBubbleShape: CAShapeLayer {
    var targetPoint: CGPoint
    var arrowHeight: CGFloat
    var bubbleRadius: CGFloat
    var arrowWidth: CGFloat

    init(targetPoint: CGPoint, arrowHeight: CGFloat, bubbleRadius: CGFloat, arrowWidth: CGFloat, fillColor: UIColor = CharcoalAsset.ColorPaletteGenerated.surface8.color, strokeColor: UIColor? = nil, lineWidth: CGFloat? = nil) {
        self.targetPoint = targetPoint
        self.arrowHeight = arrowHeight
        self.bubbleRadius = bubbleRadius
        self.arrowWidth = arrowWidth
        super.init()
        self.fillColor = fillColor.cgColor
        if let strokeColor = strokeColor {
            self.strokeColor = strokeColor.cgColor
        }
        if let lineWidth = lineWidth {
            self.lineWidth = lineWidth
        }
        updatePath()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updatePath() {
        let rect = bounds

        var pointPosition: CharcoalTooltipLayoutPriority

        if targetPoint.x < rect.minX, targetPoint.y > rect.minY {
            pointPosition = .left
        } else if targetPoint.x > rect.maxX, targetPoint.y > rect.minY {
            pointPosition = .right
        } else if targetPoint.y < rect.minY {
            pointPosition = .top
        } else {
            pointPosition = .bottom
        }

        let p = UIBezierPath()
        p.move(to: .init(x: rect.minX + bubbleRadius, y: rect.minY))
        if pointPosition == .top {
            let arrowY = rect.minY - arrowHeight
            let arrowBaseY = rect.minY

            // The minimum and maximum x position of the arrow
            let minX = rect.minX + bubbleRadius + arrowWidth
            let maxX = rect.maxX - bubbleRadius - arrowWidth

            // The x position of the arrow
            let arrowMidX = min(max(minX, targetPoint.x), maxX)

            let arrowMaxX = arrowMidX + arrowWidth

            let arrowMinX = arrowMidX - arrowWidth

            p.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
            p.addLine(to: CGPoint(x: arrowMidX, y: arrowY))
            p.addLine(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
        }

        p.addLine(to: .init(x: rect.maxX - bubbleRadius, y: rect.minY))
        p.addArc(withCenter: .init(x: rect.maxX - bubbleRadius, y: rect.minY + bubbleRadius), radius: bubbleRadius, startAngle: CGFloat.pi * 3 / 2, endAngle: 0, clockwise: true)

        if pointPosition == .right {
            let arrowX = rect.maxX + arrowHeight
            let arrowBaseX = rect.maxX

            // The minimum and maximum x position of the arrow
            let minY = rect.minY + bubbleRadius + arrowWidth
            let maxY = rect.maxY - bubbleRadius - arrowWidth

            // The x position of the arrow
            let arrowMidY = min(max(minY, targetPoint.y), maxY)

            let arrowMaxY = arrowMidY + arrowWidth

            let arrowMinY = arrowMidY - arrowWidth

            p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMinY))
            p.addLine(to: CGPoint(x: arrowX, y: arrowMidY))
            p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMaxY))
        }

        p.addLine(to: .init(x: rect.maxX, y: rect.maxY - bubbleRadius))
        p.addArc(withCenter: .init(x: rect.maxX - bubbleRadius, y: rect.maxY - bubbleRadius), radius: bubbleRadius, startAngle: 0, endAngle: CGFloat.pi / 2, clockwise: true)

        if pointPosition == .bottom {
            let arrowY = rect.maxY + arrowHeight
            let arrowBaseY = rect.maxY

            // The minimum and maximum x position of the arrow
            let minX = rect.minX + bubbleRadius + arrowWidth
            let maxX = rect.maxX - bubbleRadius - arrowWidth

            // The x position of the arrow
            let arrowMidX = min(max(minX, targetPoint.x), maxX)

            let arrowMaxX = arrowMidX - arrowWidth
            let arrowMinX = arrowMidX + arrowWidth
            p.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
            p.addLine(to: CGPoint(x: arrowMidX, y: arrowY))
            p.addLine(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
        }
        p.addLine(to: .init(x: rect.minX + bubbleRadius, y: rect.maxY))
        p.addArc(withCenter: .init(x: rect.minX + bubbleRadius, y: rect.maxY - bubbleRadius), radius: bubbleRadius, startAngle: CGFloat.pi / 2, endAngle: CGFloat.pi, clockwise: true)
        if pointPosition == .left {
            let arrowX = rect.minX - arrowHeight
            let arrowBaseX = rect.minX

            // The minimum and maximum x position of the arrow
            let minY = rect.minY + bubbleRadius + arrowWidth
            let maxY = rect.maxY - bubbleRadius - arrowWidth

            // The x position of the arrow
            let arrowMidY = min(max(minY, targetPoint.y), maxY)

            let arrowMaxY = arrowMidY + arrowWidth

            let arrowMinY = arrowMidY - arrowWidth

            p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMaxY))
            p.addLine(to: CGPoint(x: arrowX, y: arrowMidY))
            p.addLine(to: CGPoint(x: arrowBaseX, y: arrowMinY))
        }
        p.addLine(to: .init(x: rect.minX, y: rect.minY + bubbleRadius))
        p.addArc(withCenter: .init(x: rect.minX + bubbleRadius, y: rect.minX + bubbleRadius), radius: bubbleRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 3 / 2, clockwise: true)
        p.close()

        path = p.cgPath
    }

    override func layoutSublayers() {
        super.layoutSublayers()
        updatePath() // Update the path when the layer is resized
    }
}
