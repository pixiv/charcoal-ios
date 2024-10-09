@testable import CharcoalUIKit
import XCTest

final class CharcoalTooltipTests: XCTestCase {
    // The canvas is a rectangle where the tooltip can be placed
    let canvasGeometryRect = CGRect(x: 0, y: 0, width: 320, height: 640)
    // The size of the tooltip
    let tooltipSize = CGSize(width: 100, height: 100)
    // The spacing of the tooltip to the screen
    let spacingToScreen: CGFloat = 16
    // The height of the arrow
    let arrowHeight: CGFloat = 4
    // The spacing of the tooltip to the target
    let spacingToTarget: CGFloat = 2
    // The size of the anchor view
    let anchorViewSize = CGSize(width: 100, height: 100)

    func testLayoutTopLeft() throws {
        // Here we put the anchor frame at top left corner
        let anchorFrame = CGRect(x: 0, y: 0, width: anchorViewSize.width, height: anchorViewSize.height)
        let x = CharcoalTooltip.tooltipX(anchorFrame: anchorFrame, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometryRect.size, spacingToScreen: spacingToScreen)
        let y = CharcoalTooltip.tooltipY(anchorFrame: anchorFrame, arrowHeight: arrowHeight, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometryRect.size, spacingToTarget: spacingToTarget)

        // The tooltip should be at the top left corner and respect the spacing
        XCTAssertEqual(x, spacingToScreen)
        XCTAssertEqual(y, anchorFrame.maxY + spacingToTarget + arrowHeight)
    }

    func testLayoutCenter() throws {
        // Here we put the anchor frame at the center of the canvas
        let canvasCenter = CGPoint(x: canvasGeometryRect.midX, y: canvasGeometryRect.midY)
        let anchorFrame = CGRect(x: canvasCenter.x - anchorViewSize.width / 2.0, y: canvasCenter.y - anchorViewSize.height / 2.0, width: anchorViewSize.width, height: anchorViewSize.height)

        let x = CharcoalTooltip.tooltipX(anchorFrame: anchorFrame, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometryRect.size, spacingToScreen: spacingToScreen)
        let y = CharcoalTooltip.tooltipY(anchorFrame: anchorFrame, arrowHeight: arrowHeight, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometryRect.size, spacingToTarget: spacingToTarget)

        // The tooltip should be at the center of the canvas
        XCTAssertEqual(x, canvasCenter.x - tooltipSize.width / 2.0)
        XCTAssertEqual(y, anchorFrame.maxY + spacingToTarget + arrowHeight)
    }

    func testLayoutBottomRight() throws {
        // Here we put the anchor frame at the bottom right corner
        let anchorFrame = CGRect(x: canvasGeometryRect.maxX - anchorViewSize.width, y: canvasGeometryRect.maxY - anchorViewSize.height, width: anchorViewSize.width, height: anchorViewSize.height)
        let x = CharcoalTooltip.tooltipX(anchorFrame: anchorFrame, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometryRect.size, spacingToScreen: spacingToScreen)
        let y = CharcoalTooltip.tooltipY(anchorFrame: anchorFrame, arrowHeight: arrowHeight, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometryRect.size, spacingToTarget: spacingToTarget)

        // The tooltip should be at the bottom right corner and respect the spacing
        XCTAssertEqual(x, canvasGeometryRect.maxX - tooltipSize.width - spacingToScreen)
        XCTAssertEqual(y, anchorFrame.minY - spacingToTarget - arrowHeight - tooltipSize.height)
    }
}
