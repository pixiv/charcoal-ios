// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum CharcoalAsset {
  public enum ColorPaletteGenerated : CaseIterable {
    static let assertiveAsset = ColorAsset(name: "assertive")
    static let background1Asset = ColorAsset(name: "background1")
    static let background2Asset = ColorAsset(name: "background2")
    static let borderAsset = ColorAsset(name: "border")
    static let brandAsset = ColorAsset(name: "brand")
    static let callToAction0Asset = ColorAsset(name: "callToAction_0")
    static let callToAction100Asset = ColorAsset(name: "callToAction_100")
    static let icon6Asset = ColorAsset(name: "icon6")
    static let link1Asset = ColorAsset(name: "link1")
    static let link2Asset = ColorAsset(name: "link2")
    static let successAsset = ColorAsset(name: "success")
    static let surface1Asset = ColorAsset(name: "surface1")
    static let surface10Asset = ColorAsset(name: "surface10")
    static let surface2Asset = ColorAsset(name: "surface2")
    static let surface3Asset = ColorAsset(name: "surface3")
    static let surface4Asset = ColorAsset(name: "surface4")
    static let surface50Asset = ColorAsset(name: "surface5_0")
    static let surface5100Asset = ColorAsset(name: "surface5_100")
    static let surface6Asset = ColorAsset(name: "surface6")
    static let surface7Asset = ColorAsset(name: "surface7")
    static let surface8Asset = ColorAsset(name: "surface8")
    static let surface9Asset = ColorAsset(name: "surface9")
    static let text1Asset = ColorAsset(name: "text1")
    static let text2Asset = ColorAsset(name: "text2")
    static let text3Asset = ColorAsset(name: "text3")
    static let text4Asset = ColorAsset(name: "text4")
    static let text5Asset = ColorAsset(name: "text5")
    static let transparentAsset = ColorAsset(name: "transparent")
    static let updatedItemAsset = ColorAsset(name: "updatedItem")
    static let warningAsset = ColorAsset(name: "warning")
    case assertive
    case background1
    case background2
    case border
    case brand
    case callToAction0
    case callToAction100
    case icon6
    case link1
    case link2
    case success
    case surface1
    case surface10
    case surface2
    case surface3
    case surface4
    case surface50
    case surface5100
    case surface6
    case surface7
    case surface8
    case surface9
    case text1
    case text2
    case text3
    case text4
    case text5
    case transparent
    case updatedItem
    case warning
    public var colorAsset: ColorAsset {
      switch (self) {
        case .assertive:
          return Self.assertiveAsset
        case .background1:
          return Self.background1Asset
        case .background2:
          return Self.background2Asset
        case .border:
          return Self.borderAsset
        case .brand:
          return Self.brandAsset
        case .callToAction0:
          return Self.callToAction0Asset
        case .callToAction100:
          return Self.callToAction100Asset
        case .icon6:
          return Self.icon6Asset
        case .link1:
          return Self.link1Asset
        case .link2:
          return Self.link2Asset
        case .success:
          return Self.successAsset
        case .surface1:
          return Self.surface1Asset
        case .surface10:
          return Self.surface10Asset
        case .surface2:
          return Self.surface2Asset
        case .surface3:
          return Self.surface3Asset
        case .surface4:
          return Self.surface4Asset
        case .surface50:
          return Self.surface50Asset
        case .surface5100:
          return Self.surface5100Asset
        case .surface6:
          return Self.surface6Asset
        case .surface7:
          return Self.surface7Asset
        case .surface8:
          return Self.surface8Asset
        case .surface9:
          return Self.surface9Asset
        case .text1:
          return Self.text1Asset
        case .text2:
          return Self.text2Asset
        case .text3:
          return Self.text3Asset
        case .text4:
          return Self.text4Asset
        case .text5:
          return Self.text5Asset
        case .transparent:
          return Self.transparentAsset
        case .updatedItem:
          return Self.updatedItemAsset
        case .warning:
          return Self.warningAsset
      }
    }
    public var color: ColorAsset.Color {
      return colorAsset.color
    }
    public static let allColorAssets: [ColorAsset] = [
      assertive.colorAsset,
      background1.colorAsset,
      background2.colorAsset,
      border.colorAsset,
      brand.colorAsset,
      callToAction0.colorAsset,
      callToAction100.colorAsset,
      icon6.colorAsset,
      link1.colorAsset,
      link2.colorAsset,
      success.colorAsset,
      surface1.colorAsset,
      surface10.colorAsset,
      surface2.colorAsset,
      surface3.colorAsset,
      surface4.colorAsset,
      surface50.colorAsset,
      surface5100.colorAsset,
      surface6.colorAsset,
      surface7.colorAsset,
      surface8.colorAsset,
      surface9.colorAsset,
      text1.colorAsset,
      text2.colorAsset,
      text3.colorAsset,
      text4.colorAsset,
      text5.colorAsset,
      transparent.colorAsset,
      updatedItem.colorAsset,
      warning.colorAsset,
    ]
  }
  public enum ColorPaletteV2Generated : CaseIterable {
    public enum Background : CaseIterable {
      static let defaultAsset = ColorAsset(name: "background/default")
      static let overlayAsset = ColorAsset(name: "background/overlay")
      static let secondaryAsset = ColorAsset(name: "background/secondary")
      static let tertiaryAsset = ColorAsset(name: "background/tertiary")
      case `default`
      case overlay
      case secondary
      case tertiary
      public var colorAsset: ColorAsset {
        switch (self) {
          case .`default`:
            return Self.defaultAsset
          case .overlay:
            return Self.overlayAsset
          case .secondary:
            return Self.secondaryAsset
          case .tertiary:
            return Self.tertiaryAsset
        }
      }
      public var color: ColorAsset.Color {
        return colorAsset.color
      }
    }
    public enum Border : CaseIterable {
      static let defaultText3Asset = ColorAsset(name: "border/default-text3")
      static let defaultAsset = ColorAsset(name: "border/default")
      static let disableAsset = ColorAsset(name: "border/disable")
      public enum Focus : CaseIterable {
        static let _1Asset = ColorAsset(name: "border/focus/1")
        static let _2Asset = ColorAsset(name: "border/focus/2")
        static let legacyAsset = ColorAsset(name: "border/focus/legacy")
        case _1
        case _2
        case legacy
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._1:
              return Self._1Asset
            case ._2:
              return Self._2Asset
            case .legacy:
              return Self.legacyAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      static let hoverText3Asset = ColorAsset(name: "border/hover-text3")
      static let hoverAsset = ColorAsset(name: "border/hover")
      static let hudAsset = ColorAsset(name: "border/hud")
      static let negativeAsset = ColorAsset(name: "border/negative")
      static let pressText3Asset = ColorAsset(name: "border/press-text3")
      static let pressAsset = ColorAsset(name: "border/press")
      static let secondaryAsset = ColorAsset(name: "border/secondary")
      static let selectedAsset = ColorAsset(name: "border/selected")
      case defaultText3
      case `default`
      case disable
      case hoverText3
      case hover
      case hud
      case negative
      case pressText3
      case press
      case secondary
      case selected
      public var colorAsset: ColorAsset {
        switch (self) {
          case .defaultText3:
            return Self.defaultText3Asset
          case .`default`:
            return Self.defaultAsset
          case .disable:
            return Self.disableAsset
          case .hoverText3:
            return Self.hoverText3Asset
          case .hover:
            return Self.hoverAsset
          case .hud:
            return Self.hudAsset
          case .negative:
            return Self.negativeAsset
          case .pressText3:
            return Self.pressText3Asset
          case .press:
            return Self.pressAsset
          case .secondary:
            return Self.secondaryAsset
          case .selected:
            return Self.selectedAsset
        }
      }
      public var color: ColorAsset.Color {
        return colorAsset.color
      }
    }
    public enum Container : CaseIterable {
      static let defaultAAsset = ColorAsset(name: "container/default-a")
      static let defaultAsset = ColorAsset(name: "container/default")
      static let disableAsset = ColorAsset(name: "container/disable")
      public enum Discovery : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/discovery/default")
        static let hoverAsset = ColorAsset(name: "container/discovery/hover")
        static let pressAsset = ColorAsset(name: "container/discovery/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      static let hoverAAsset = ColorAsset(name: "container/hover-a")
      static let hoverAsset = ColorAsset(name: "container/hover")
      public enum Hud : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/hud/default")
        static let hoverAsset = ColorAsset(name: "container/hud/hover")
        static let pressAsset = ColorAsset(name: "container/hud/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Negative : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/negative/default")
        static let hoverAsset = ColorAsset(name: "container/negative/hover")
        static let pressAsset = ColorAsset(name: "container/negative/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Neutral : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/neutral/default")
        static let hoverAsset = ColorAsset(name: "container/neutral/hover")
        static let pressAsset = ColorAsset(name: "container/neutral/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Notice : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/notice/default")
        static let hoverAsset = ColorAsset(name: "container/notice/hover")
        static let pressAsset = ColorAsset(name: "container/notice/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnImg : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/on-img/default")
        static let hoverAsset = ColorAsset(name: "container/on-img/hover")
        static let pressAsset = ColorAsset(name: "container/on-img/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Positive : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/positive/default")
        static let hoverAsset = ColorAsset(name: "container/positive/hover")
        static let pressAsset = ColorAsset(name: "container/positive/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      static let pressAAsset = ColorAsset(name: "container/press-a")
      static let pressAsset = ColorAsset(name: "container/press")
      public enum Primary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "container/primary/default")
        static let hoverAsset = ColorAsset(name: "container/primary/hover")
        static let pressAsset = ColorAsset(name: "container/primary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Secondary : CaseIterable {
        static let defaultAAsset = ColorAsset(name: "container/secondary/default-a")
        static let defaultAsset = ColorAsset(name: "container/secondary/default")
        static let hoverAAsset = ColorAsset(name: "container/secondary/hover-a")
        static let hoverAsset = ColorAsset(name: "container/secondary/hover")
        static let pressAAsset = ColorAsset(name: "container/secondary/press-a")
        static let pressAsset = ColorAsset(name: "container/secondary/press")
        case defaultA
        case `default`
        case hoverA
        case hover
        case pressA
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .defaultA:
              return Self.defaultAAsset
            case .`default`:
              return Self.defaultAsset
            case .hoverA:
              return Self.hoverAAsset
            case .hover:
              return Self.hoverAsset
            case .pressA:
              return Self.pressAAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      static let skeletonAsset = ColorAsset(name: "container/skeleton")
      static let subtleAsset = ColorAsset(name: "container/subtle")
      public enum Tertiary : CaseIterable {
        static let defaultAAsset = ColorAsset(name: "container/tertiary/default-a")
        static let defaultAsset = ColorAsset(name: "container/tertiary/default")
        static let hoverAAsset = ColorAsset(name: "container/tertiary/hover-a")
        static let hoverAsset = ColorAsset(name: "container/tertiary/hover")
        static let pressAAsset = ColorAsset(name: "container/tertiary/press-a")
        static let pressAsset = ColorAsset(name: "container/tertiary/press")
        case defaultA
        case `default`
        case hoverA
        case hover
        case pressA
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .defaultA:
              return Self.defaultAAsset
            case .`default`:
              return Self.defaultAsset
            case .hoverA:
              return Self.hoverAAsset
            case .hover:
              return Self.hoverAsset
            case .pressA:
              return Self.pressAAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      case defaultA
      case `default`
      case disable
      case hoverA
      case hover
      case pressA
      case press
      case skeleton
      case subtle
      public var colorAsset: ColorAsset {
        switch (self) {
          case .defaultA:
            return Self.defaultAAsset
          case .`default`:
            return Self.defaultAsset
          case .disable:
            return Self.disableAsset
          case .hoverA:
            return Self.hoverAAsset
          case .hover:
            return Self.hoverAsset
          case .pressA:
            return Self.pressAAsset
          case .press:
            return Self.pressAsset
          case .skeleton:
            return Self.skeletonAsset
          case .subtle:
            return Self.subtleAsset
        }
      }
      public var color: ColorAsset.Color {
        return colorAsset.color
      }
    }
    public enum Dark : CaseIterable {
      public enum Blue : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/blue/0")
        static let _10Asset = ColorAsset(name: "dark/blue/10")
        static let _20Asset = ColorAsset(name: "dark/blue/20")
        static let _30Asset = ColorAsset(name: "dark/blue/30")
        static let _40Asset = ColorAsset(name: "dark/blue/40")
        static let _5Asset = ColorAsset(name: "dark/blue/5")
        static let _50Asset = ColorAsset(name: "dark/blue/50")
        static let _60Asset = ColorAsset(name: "dark/blue/60")
        static let _70Asset = ColorAsset(name: "dark/blue/70")
        static let _80Asset = ColorAsset(name: "dark/blue/80")
        static let _90Asset = ColorAsset(name: "dark/blue/90")
        static let minus10Asset = ColorAsset(name: "dark/blue/minus10")
        static let minus5Asset = ColorAsset(name: "dark/blue/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Green : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/green/0")
        static let _10Asset = ColorAsset(name: "dark/green/10")
        static let _20Asset = ColorAsset(name: "dark/green/20")
        static let _30Asset = ColorAsset(name: "dark/green/30")
        static let _40Asset = ColorAsset(name: "dark/green/40")
        static let _5Asset = ColorAsset(name: "dark/green/5")
        static let _50Asset = ColorAsset(name: "dark/green/50")
        static let _60Asset = ColorAsset(name: "dark/green/60")
        static let _70Asset = ColorAsset(name: "dark/green/70")
        static let _80Asset = ColorAsset(name: "dark/green/80")
        static let _90Asset = ColorAsset(name: "dark/green/90")
        static let minus10Asset = ColorAsset(name: "dark/green/minus10")
        static let minus5Asset = ColorAsset(name: "dark/green/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Indigo : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/indigo/0")
        static let _10Asset = ColorAsset(name: "dark/indigo/10")
        static let _20Asset = ColorAsset(name: "dark/indigo/20")
        static let _30Asset = ColorAsset(name: "dark/indigo/30")
        static let _40Asset = ColorAsset(name: "dark/indigo/40")
        static let _5Asset = ColorAsset(name: "dark/indigo/5")
        static let _50Asset = ColorAsset(name: "dark/indigo/50")
        static let _60Asset = ColorAsset(name: "dark/indigo/60")
        static let _70Asset = ColorAsset(name: "dark/indigo/70")
        static let _80Asset = ColorAsset(name: "dark/indigo/80")
        static let _90Asset = ColorAsset(name: "dark/indigo/90")
        static let minus10Asset = ColorAsset(name: "dark/indigo/minus10")
        static let minus5Asset = ColorAsset(name: "dark/indigo/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Magenta : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/magenta/0")
        static let _10Asset = ColorAsset(name: "dark/magenta/10")
        static let _20Asset = ColorAsset(name: "dark/magenta/20")
        static let _30Asset = ColorAsset(name: "dark/magenta/30")
        static let _40Asset = ColorAsset(name: "dark/magenta/40")
        static let _5Asset = ColorAsset(name: "dark/magenta/5")
        static let _50Asset = ColorAsset(name: "dark/magenta/50")
        static let _60Asset = ColorAsset(name: "dark/magenta/60")
        static let _70Asset = ColorAsset(name: "dark/magenta/70")
        static let _80Asset = ColorAsset(name: "dark/magenta/80")
        static let _90Asset = ColorAsset(name: "dark/magenta/90")
        static let minus10Asset = ColorAsset(name: "dark/magenta/minus10")
        static let minus5Asset = ColorAsset(name: "dark/magenta/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Neutral : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/neutral/0")
        static let _10Asset = ColorAsset(name: "dark/neutral/10")
        static let _20Asset = ColorAsset(name: "dark/neutral/20")
        static let _30Asset = ColorAsset(name: "dark/neutral/30")
        static let _40Asset = ColorAsset(name: "dark/neutral/40")
        static let _5Asset = ColorAsset(name: "dark/neutral/5")
        static let _50Asset = ColorAsset(name: "dark/neutral/50")
        static let _60Asset = ColorAsset(name: "dark/neutral/60")
        static let _70Asset = ColorAsset(name: "dark/neutral/70")
        static let _80Asset = ColorAsset(name: "dark/neutral/80")
        static let _90Asset = ColorAsset(name: "dark/neutral/90")
        static let minus10Asset = ColorAsset(name: "dark/neutral/minus10")
        static let minus5Asset = ColorAsset(name: "dark/neutral/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum NeutralA : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/neutral-a/0")
        static let _10Asset = ColorAsset(name: "dark/neutral-a/10")
        static let _20Asset = ColorAsset(name: "dark/neutral-a/20")
        static let _30Asset = ColorAsset(name: "dark/neutral-a/30")
        static let _40Asset = ColorAsset(name: "dark/neutral-a/40")
        static let _5Asset = ColorAsset(name: "dark/neutral-a/5")
        static let _50Asset = ColorAsset(name: "dark/neutral-a/50")
        static let _60Asset = ColorAsset(name: "dark/neutral-a/60")
        static let _70Asset = ColorAsset(name: "dark/neutral-a/70")
        static let _80Asset = ColorAsset(name: "dark/neutral-a/80")
        static let _90Asset = ColorAsset(name: "dark/neutral-a/90")
        static let minus10Asset = ColorAsset(name: "dark/neutral-a/minus10")
        static let minus5Asset = ColorAsset(name: "dark/neutral-a/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Orange : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/orange/0")
        static let _10Asset = ColorAsset(name: "dark/orange/10")
        static let _20Asset = ColorAsset(name: "dark/orange/20")
        static let _30Asset = ColorAsset(name: "dark/orange/30")
        static let _40Asset = ColorAsset(name: "dark/orange/40")
        static let _5Asset = ColorAsset(name: "dark/orange/5")
        static let _50Asset = ColorAsset(name: "dark/orange/50")
        static let _60Asset = ColorAsset(name: "dark/orange/60")
        static let _70Asset = ColorAsset(name: "dark/orange/70")
        static let _80Asset = ColorAsset(name: "dark/orange/80")
        static let _90Asset = ColorAsset(name: "dark/orange/90")
        static let minus10Asset = ColorAsset(name: "dark/orange/minus10")
        static let minus5Asset = ColorAsset(name: "dark/orange/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Purple : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/purple/0")
        static let _10Asset = ColorAsset(name: "dark/purple/10")
        static let _20Asset = ColorAsset(name: "dark/purple/20")
        static let _30Asset = ColorAsset(name: "dark/purple/30")
        static let _40Asset = ColorAsset(name: "dark/purple/40")
        static let _5Asset = ColorAsset(name: "dark/purple/5")
        static let _50Asset = ColorAsset(name: "dark/purple/50")
        static let _60Asset = ColorAsset(name: "dark/purple/60")
        static let _70Asset = ColorAsset(name: "dark/purple/70")
        static let _80Asset = ColorAsset(name: "dark/purple/80")
        static let _90Asset = ColorAsset(name: "dark/purple/90")
        static let minus10Asset = ColorAsset(name: "dark/purple/minus10")
        static let minus5Asset = ColorAsset(name: "dark/purple/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Red : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/red/0")
        static let _10Asset = ColorAsset(name: "dark/red/10")
        static let _20Asset = ColorAsset(name: "dark/red/20")
        static let _30Asset = ColorAsset(name: "dark/red/30")
        static let _40Asset = ColorAsset(name: "dark/red/40")
        static let _5Asset = ColorAsset(name: "dark/red/5")
        static let _50Asset = ColorAsset(name: "dark/red/50")
        static let _60Asset = ColorAsset(name: "dark/red/60")
        static let _70Asset = ColorAsset(name: "dark/red/70")
        static let _80Asset = ColorAsset(name: "dark/red/80")
        static let _90Asset = ColorAsset(name: "dark/red/90")
        static let minus10Asset = ColorAsset(name: "dark/red/minus10")
        static let minus5Asset = ColorAsset(name: "dark/red/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Turquoise : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/turquoise/0")
        static let _10Asset = ColorAsset(name: "dark/turquoise/10")
        static let _20Asset = ColorAsset(name: "dark/turquoise/20")
        static let _30Asset = ColorAsset(name: "dark/turquoise/30")
        static let _40Asset = ColorAsset(name: "dark/turquoise/40")
        static let _5Asset = ColorAsset(name: "dark/turquoise/5")
        static let _50Asset = ColorAsset(name: "dark/turquoise/50")
        static let _60Asset = ColorAsset(name: "dark/turquoise/60")
        static let _70Asset = ColorAsset(name: "dark/turquoise/70")
        static let _80Asset = ColorAsset(name: "dark/turquoise/80")
        static let _90Asset = ColorAsset(name: "dark/turquoise/90")
        static let minus10Asset = ColorAsset(name: "dark/turquoise/minus10")
        static let minus5Asset = ColorAsset(name: "dark/turquoise/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Yellow : CaseIterable {
        static let _0Asset = ColorAsset(name: "dark/yellow/0")
        static let _10Asset = ColorAsset(name: "dark/yellow/10")
        static let _20Asset = ColorAsset(name: "dark/yellow/20")
        static let _30Asset = ColorAsset(name: "dark/yellow/30")
        static let _40Asset = ColorAsset(name: "dark/yellow/40")
        static let _5Asset = ColorAsset(name: "dark/yellow/5")
        static let _50Asset = ColorAsset(name: "dark/yellow/50")
        static let _60Asset = ColorAsset(name: "dark/yellow/60")
        static let _70Asset = ColorAsset(name: "dark/yellow/70")
        static let _80Asset = ColorAsset(name: "dark/yellow/80")
        static let _90Asset = ColorAsset(name: "dark/yellow/90")
        static let minus10Asset = ColorAsset(name: "dark/yellow/minus10")
        static let minus5Asset = ColorAsset(name: "dark/yellow/minus5")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        case minus10
        case minus5
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
            case .minus10:
              return Self.minus10Asset
            case .minus5:
              return Self.minus5Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
    }
    public enum Icon : CaseIterable {
      static let defaultAsset = ColorAsset(name: "icon/default")
      static let disableAsset = ColorAsset(name: "icon/disable")
      static let hoverAsset = ColorAsset(name: "icon/hover")
      public enum Negative : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/negative/default")
        static let hoverAsset = ColorAsset(name: "icon/negative/hover")
        static let pressAsset = ColorAsset(name: "icon/negative/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Notice : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/notice/default")
        static let hoverAsset = ColorAsset(name: "icon/notice/hover")
        static let pressAsset = ColorAsset(name: "icon/notice/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnNegative : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/on-negative/default")
        static let hoverAsset = ColorAsset(name: "icon/on-negative/hover")
        static let pressAsset = ColorAsset(name: "icon/on-negative/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnNeutral : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/on-neutral/default")
        static let hoverAsset = ColorAsset(name: "icon/on-neutral/hover")
        static let pressAsset = ColorAsset(name: "icon/on-neutral/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnNotice : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/on-notice/default")
        static let hoverAsset = ColorAsset(name: "icon/on-notice/hover")
        static let pressAsset = ColorAsset(name: "icon/on-notice/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnOnImg : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/on-on-img/default")
        static let hoverAsset = ColorAsset(name: "icon/on-on-img/hover")
        static let pressAsset = ColorAsset(name: "icon/on-on-img/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnPositive : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/on-positive/default")
        static let hoverAsset = ColorAsset(name: "icon/on-positive/hover")
        static let pressAsset = ColorAsset(name: "icon/on-positive/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnPrimary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/on-primary/default")
        static let hoverAsset = ColorAsset(name: "icon/on-primary/hover")
        static let pressAsset = ColorAsset(name: "icon/on-primary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Positive : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/positive/default")
        static let hoverAsset = ColorAsset(name: "icon/positive/hover")
        static let pressAsset = ColorAsset(name: "icon/positive/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      static let pressAsset = ColorAsset(name: "icon/press")
      public enum Secondary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/secondary/default")
        static let hoverAsset = ColorAsset(name: "icon/secondary/hover")
        static let pressAsset = ColorAsset(name: "icon/secondary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Tertiary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "icon/tertiary/default")
        static let hoverAsset = ColorAsset(name: "icon/tertiary/hover")
        static let pressAsset = ColorAsset(name: "icon/tertiary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      case `default`
      case disable
      case hover
      case press
      public var colorAsset: ColorAsset {
        switch (self) {
          case .`default`:
            return Self.defaultAsset
          case .disable:
            return Self.disableAsset
          case .hover:
            return Self.hoverAsset
          case .press:
            return Self.pressAsset
        }
      }
      public var color: ColorAsset.Color {
        return colorAsset.color
      }
    }
    public enum Light : CaseIterable {
      public enum Cyan : CaseIterable {
        static let _50Asset = ColorAsset(name: "light/Cyan/50")
        case _50
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._50:
              return Self._50Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Emerald : CaseIterable {
        static let _10Asset = ColorAsset(name: "light/Emerald/10")
        static let _20Asset = ColorAsset(name: "light/Emerald/20")
        static let _30Asset = ColorAsset(name: "light/Emerald/30")
        static let _40Asset = ColorAsset(name: "light/Emerald/40")
        static let _5Asset = ColorAsset(name: "light/Emerald/5")
        static let _50Asset = ColorAsset(name: "light/Emerald/50")
        static let _60Asset = ColorAsset(name: "light/Emerald/60")
        static let _70Asset = ColorAsset(name: "light/Emerald/70")
        static let _80Asset = ColorAsset(name: "light/Emerald/80")
        static let _90Asset = ColorAsset(name: "light/Emerald/90")
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Blue : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/blue/0")
        static let _10Asset = ColorAsset(name: "light/blue/10")
        static let _20Asset = ColorAsset(name: "light/blue/20")
        static let _30Asset = ColorAsset(name: "light/blue/30")
        static let _40Asset = ColorAsset(name: "light/blue/40")
        static let _5Asset = ColorAsset(name: "light/blue/5")
        static let _50Asset = ColorAsset(name: "light/blue/50")
        static let _60Asset = ColorAsset(name: "light/blue/60")
        static let _70Asset = ColorAsset(name: "light/blue/70")
        static let _80Asset = ColorAsset(name: "light/blue/80")
        static let _90Asset = ColorAsset(name: "light/blue/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Green : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/green/0")
        static let _10Asset = ColorAsset(name: "light/green/10")
        static let _20Asset = ColorAsset(name: "light/green/20")
        static let _30Asset = ColorAsset(name: "light/green/30")
        static let _40Asset = ColorAsset(name: "light/green/40")
        static let _5Asset = ColorAsset(name: "light/green/5")
        static let _50Asset = ColorAsset(name: "light/green/50")
        static let _60Asset = ColorAsset(name: "light/green/60")
        static let _70Asset = ColorAsset(name: "light/green/70")
        static let _80Asset = ColorAsset(name: "light/green/80")
        static let _90Asset = ColorAsset(name: "light/green/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Indigo : CaseIterable {
        static let _10Asset = ColorAsset(name: "light/indigo/10")
        static let _20Asset = ColorAsset(name: "light/indigo/20")
        static let _30Asset = ColorAsset(name: "light/indigo/30")
        static let _40Asset = ColorAsset(name: "light/indigo/40")
        static let _5Asset = ColorAsset(name: "light/indigo/5")
        static let _50Asset = ColorAsset(name: "light/indigo/50")
        static let _60Asset = ColorAsset(name: "light/indigo/60")
        static let _70Asset = ColorAsset(name: "light/indigo/70")
        static let _80Asset = ColorAsset(name: "light/indigo/80")
        static let _90Asset = ColorAsset(name: "light/indigo/90")
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Magenta : CaseIterable {
        static let _10Asset = ColorAsset(name: "light/magenta/10")
        static let _20Asset = ColorAsset(name: "light/magenta/20")
        static let _30Asset = ColorAsset(name: "light/magenta/30")
        static let _40Asset = ColorAsset(name: "light/magenta/40")
        static let _5Asset = ColorAsset(name: "light/magenta/5")
        static let _50Asset = ColorAsset(name: "light/magenta/50")
        static let _60Asset = ColorAsset(name: "light/magenta/60")
        static let _70Asset = ColorAsset(name: "light/magenta/70")
        static let _80Asset = ColorAsset(name: "light/magenta/80")
        static let _90Asset = ColorAsset(name: "light/magenta/90")
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Neutral : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/neutral/0")
        static let _10Asset = ColorAsset(name: "light/neutral/10")
        static let _20Asset = ColorAsset(name: "light/neutral/20")
        static let _30Asset = ColorAsset(name: "light/neutral/30")
        static let _40Asset = ColorAsset(name: "light/neutral/40")
        static let _5Asset = ColorAsset(name: "light/neutral/5")
        static let _50Asset = ColorAsset(name: "light/neutral/50")
        static let _60Asset = ColorAsset(name: "light/neutral/60")
        static let _70Asset = ColorAsset(name: "light/neutral/70")
        static let _80Asset = ColorAsset(name: "light/neutral/80")
        static let _90Asset = ColorAsset(name: "light/neutral/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum NeutralA : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/neutral-a/0")
        static let _10Asset = ColorAsset(name: "light/neutral-a/10")
        static let _20Asset = ColorAsset(name: "light/neutral-a/20")
        static let _30Asset = ColorAsset(name: "light/neutral-a/30")
        static let _40Asset = ColorAsset(name: "light/neutral-a/40")
        static let _5Asset = ColorAsset(name: "light/neutral-a/5")
        static let _50Asset = ColorAsset(name: "light/neutral-a/50")
        static let _60Asset = ColorAsset(name: "light/neutral-a/60")
        static let _70Asset = ColorAsset(name: "light/neutral-a/70")
        static let _80Asset = ColorAsset(name: "light/neutral-a/80")
        static let _90Asset = ColorAsset(name: "light/neutral-a/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Orange : CaseIterable {
        static let _10Asset = ColorAsset(name: "light/orange/10")
        static let _20Asset = ColorAsset(name: "light/orange/20")
        static let _30Asset = ColorAsset(name: "light/orange/30")
        static let _40Asset = ColorAsset(name: "light/orange/40")
        static let _5Asset = ColorAsset(name: "light/orange/5")
        static let _50Asset = ColorAsset(name: "light/orange/50")
        static let _60Asset = ColorAsset(name: "light/orange/60")
        static let _70Asset = ColorAsset(name: "light/orange/70")
        static let _80Asset = ColorAsset(name: "light/orange/80")
        static let _90Asset = ColorAsset(name: "light/orange/90")
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Purple : CaseIterable {
        static let _10Asset = ColorAsset(name: "light/purple/10")
        static let _20Asset = ColorAsset(name: "light/purple/20")
        static let _30Asset = ColorAsset(name: "light/purple/30")
        static let _40Asset = ColorAsset(name: "light/purple/40")
        static let _5Asset = ColorAsset(name: "light/purple/5")
        static let _50Asset = ColorAsset(name: "light/purple/50")
        static let _60Asset = ColorAsset(name: "light/purple/60")
        static let _70Asset = ColorAsset(name: "light/purple/70")
        static let _80Asset = ColorAsset(name: "light/purple/80")
        static let _90Asset = ColorAsset(name: "light/purple/90")
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Red : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/red/0")
        static let _10Asset = ColorAsset(name: "light/red/10")
        static let _20Asset = ColorAsset(name: "light/red/20")
        static let _30Asset = ColorAsset(name: "light/red/30")
        static let _40Asset = ColorAsset(name: "light/red/40")
        static let _5Asset = ColorAsset(name: "light/red/5")
        static let _50Asset = ColorAsset(name: "light/red/50")
        static let _60Asset = ColorAsset(name: "light/red/60")
        static let _70Asset = ColorAsset(name: "light/red/70")
        static let _80Asset = ColorAsset(name: "light/red/80")
        static let _90Asset = ColorAsset(name: "light/red/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Turquoise : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/turquoise/0")
        static let _10Asset = ColorAsset(name: "light/turquoise/10")
        static let _20Asset = ColorAsset(name: "light/turquoise/20")
        static let _30Asset = ColorAsset(name: "light/turquoise/30")
        static let _40Asset = ColorAsset(name: "light/turquoise/40")
        static let _5Asset = ColorAsset(name: "light/turquoise/5")
        static let _50Asset = ColorAsset(name: "light/turquoise/50")
        static let _60Asset = ColorAsset(name: "light/turquoise/60")
        static let _70Asset = ColorAsset(name: "light/turquoise/70")
        static let _80Asset = ColorAsset(name: "light/turquoise/80")
        static let _90Asset = ColorAsset(name: "light/turquoise/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Yellow : CaseIterable {
        static let _0Asset = ColorAsset(name: "light/yellow/0")
        static let _10Asset = ColorAsset(name: "light/yellow/10")
        static let _20Asset = ColorAsset(name: "light/yellow/20")
        static let _30Asset = ColorAsset(name: "light/yellow/30")
        static let _40Asset = ColorAsset(name: "light/yellow/40")
        static let _5Asset = ColorAsset(name: "light/yellow/5")
        static let _50Asset = ColorAsset(name: "light/yellow/50")
        static let _60Asset = ColorAsset(name: "light/yellow/60")
        static let _70Asset = ColorAsset(name: "light/yellow/70")
        static let _80Asset = ColorAsset(name: "light/yellow/80")
        static let _90Asset = ColorAsset(name: "light/yellow/90")
        case _0
        case _10
        case _20
        case _30
        case _40
        case _5
        case _50
        case _60
        case _70
        case _80
        case _90
        public var colorAsset: ColorAsset {
          switch (self) {
            case ._0:
              return Self._0Asset
            case ._10:
              return Self._10Asset
            case ._20:
              return Self._20Asset
            case ._30:
              return Self._30Asset
            case ._40:
              return Self._40Asset
            case ._5:
              return Self._5Asset
            case ._50:
              return Self._50Asset
            case ._60:
              return Self._60Asset
            case ._70:
              return Self._70Asset
            case ._80:
              return Self._80Asset
            case ._90:
              return Self._90Asset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
    }
    public enum Text : CaseIterable {
      static let defaultText1Asset = ColorAsset(name: "text/default-text1")
      static let defaultAsset = ColorAsset(name: "text/default")
      static let disableAsset = ColorAsset(name: "text/disable")
      static let hoverText1Asset = ColorAsset(name: "text/hover-text1")
      static let hoverAsset = ColorAsset(name: "text/hover")
      public enum Info : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/info/default")
        static let hoverAsset = ColorAsset(name: "text/info/hover")
        static let pressAsset = ColorAsset(name: "text/info/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Negative : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/negative/default")
        static let hoverAsset = ColorAsset(name: "text/negative/hover")
        static let pressAsset = ColorAsset(name: "text/negative/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Notice : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/notice/default")
        static let hoverAsset = ColorAsset(name: "text/notice/hover")
        static let pressAsset = ColorAsset(name: "text/notice/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnDiscovery : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-discovery/default")
        static let hoverAsset = ColorAsset(name: "text/on-discovery/hover")
        static let pressAsset = ColorAsset(name: "text/on-discovery/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnHud : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-hud/default")
        static let hoverAsset = ColorAsset(name: "text/on-hud/hover")
        static let pressAsset = ColorAsset(name: "text/on-hud/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnNegative : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-negative/default")
        static let hoverAsset = ColorAsset(name: "text/on-negative/hover")
        static let pressAsset = ColorAsset(name: "text/on-negative/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnNotice : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-notice/default")
        static let hoverAsset = ColorAsset(name: "text/on-notice/hover")
        static let pressAsset = ColorAsset(name: "text/on-notice/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnOnImg : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-on-img/default")
        static let hoverAsset = ColorAsset(name: "text/on-on-img/hover")
        static let pressAsset = ColorAsset(name: "text/on-on-img/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnPositive : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-positive/default")
        static let hoverAsset = ColorAsset(name: "text/on-positive/hover")
        static let pressAsset = ColorAsset(name: "text/on-positive/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum OnPrimary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/on-primary/default")
        static let hoverAsset = ColorAsset(name: "text/on-primary/hover")
        static let pressAsset = ColorAsset(name: "text/on-primary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Placeholder : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/placeholder/default")
        static let hoverAsset = ColorAsset(name: "text/placeholder/hover")
        static let pressAsset = ColorAsset(name: "text/placeholder/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Positive : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/positive/default")
        static let hoverAsset = ColorAsset(name: "text/positive/hover")
        static let pressAsset = ColorAsset(name: "text/positive/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      static let pressText1Asset = ColorAsset(name: "text/press-text1")
      static let pressAsset = ColorAsset(name: "text/press")
      public enum Secondary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/secondary/default")
        static let hoverAsset = ColorAsset(name: "text/secondary/hover")
        static let pressAsset = ColorAsset(name: "text/secondary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Tertiary : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/tertiary/default")
        static let hoverAsset = ColorAsset(name: "text/tertiary/hover")
        static let pressAsset = ColorAsset(name: "text/tertiary/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      public enum Visited : CaseIterable {
        static let defaultAsset = ColorAsset(name: "text/visited/default")
        static let hoverAsset = ColorAsset(name: "text/visited/hover")
        static let pressAsset = ColorAsset(name: "text/visited/press")
        case `default`
        case hover
        case press
        public var colorAsset: ColorAsset {
          switch (self) {
            case .`default`:
              return Self.defaultAsset
            case .hover:
              return Self.hoverAsset
            case .press:
              return Self.pressAsset
          }
        }
        public var color: ColorAsset.Color {
          return colorAsset.color
        }
      }
      case defaultText1
      case `default`
      case disable
      case hoverText1
      case hover
      case pressText1
      case press
      public var colorAsset: ColorAsset {
        switch (self) {
          case .defaultText1:
            return Self.defaultText1Asset
          case .`default`:
            return Self.defaultAsset
          case .disable:
            return Self.disableAsset
          case .hoverText1:
            return Self.hoverText1Asset
          case .hover:
            return Self.hoverAsset
          case .pressText1:
            return Self.pressText1Asset
          case .press:
            return Self.pressAsset
        }
      }
      public var color: ColorAsset.Color {
        return colorAsset.color
      }
    }
    public static let allColorAssets: [ColorAsset] = [
      Background.`default`.colorAsset,
      Background.overlay.colorAsset,
      Background.secondary.colorAsset,
      Background.tertiary.colorAsset,
      Border.defaultText3.colorAsset,
      Border.`default`.colorAsset,
      Border.disable.colorAsset,
      Border.Focus._1.colorAsset,
      Border.Focus._2.colorAsset,
      Border.Focus.legacy.colorAsset,
      Border.hoverText3.colorAsset,
      Border.hover.colorAsset,
      Border.hud.colorAsset,
      Border.negative.colorAsset,
      Border.pressText3.colorAsset,
      Border.press.colorAsset,
      Border.secondary.colorAsset,
      Border.selected.colorAsset,
      Container.defaultA.colorAsset,
      Container.`default`.colorAsset,
      Container.disable.colorAsset,
      Container.Discovery.`default`.colorAsset,
      Container.Discovery.hover.colorAsset,
      Container.Discovery.press.colorAsset,
      Container.hoverA.colorAsset,
      Container.hover.colorAsset,
      Container.Hud.`default`.colorAsset,
      Container.Hud.hover.colorAsset,
      Container.Hud.press.colorAsset,
      Container.Negative.`default`.colorAsset,
      Container.Negative.hover.colorAsset,
      Container.Negative.press.colorAsset,
      Container.Neutral.`default`.colorAsset,
      Container.Neutral.hover.colorAsset,
      Container.Neutral.press.colorAsset,
      Container.Notice.`default`.colorAsset,
      Container.Notice.hover.colorAsset,
      Container.Notice.press.colorAsset,
      Container.OnImg.`default`.colorAsset,
      Container.OnImg.hover.colorAsset,
      Container.OnImg.press.colorAsset,
      Container.Positive.`default`.colorAsset,
      Container.Positive.hover.colorAsset,
      Container.Positive.press.colorAsset,
      Container.pressA.colorAsset,
      Container.press.colorAsset,
      Container.Primary.`default`.colorAsset,
      Container.Primary.hover.colorAsset,
      Container.Primary.press.colorAsset,
      Container.Secondary.defaultA.colorAsset,
      Container.Secondary.`default`.colorAsset,
      Container.Secondary.hoverA.colorAsset,
      Container.Secondary.hover.colorAsset,
      Container.Secondary.pressA.colorAsset,
      Container.Secondary.press.colorAsset,
      Container.skeleton.colorAsset,
      Container.subtle.colorAsset,
      Container.Tertiary.defaultA.colorAsset,
      Container.Tertiary.`default`.colorAsset,
      Container.Tertiary.hoverA.colorAsset,
      Container.Tertiary.hover.colorAsset,
      Container.Tertiary.pressA.colorAsset,
      Container.Tertiary.press.colorAsset,
      Dark.Blue._0.colorAsset,
      Dark.Blue._10.colorAsset,
      Dark.Blue._20.colorAsset,
      Dark.Blue._30.colorAsset,
      Dark.Blue._40.colorAsset,
      Dark.Blue._5.colorAsset,
      Dark.Blue._50.colorAsset,
      Dark.Blue._60.colorAsset,
      Dark.Blue._70.colorAsset,
      Dark.Blue._80.colorAsset,
      Dark.Blue._90.colorAsset,
      Dark.Blue.minus10.colorAsset,
      Dark.Blue.minus5.colorAsset,
      Dark.Green._0.colorAsset,
      Dark.Green._10.colorAsset,
      Dark.Green._20.colorAsset,
      Dark.Green._30.colorAsset,
      Dark.Green._40.colorAsset,
      Dark.Green._5.colorAsset,
      Dark.Green._50.colorAsset,
      Dark.Green._60.colorAsset,
      Dark.Green._70.colorAsset,
      Dark.Green._80.colorAsset,
      Dark.Green._90.colorAsset,
      Dark.Green.minus10.colorAsset,
      Dark.Green.minus5.colorAsset,
      Dark.Indigo._0.colorAsset,
      Dark.Indigo._10.colorAsset,
      Dark.Indigo._20.colorAsset,
      Dark.Indigo._30.colorAsset,
      Dark.Indigo._40.colorAsset,
      Dark.Indigo._5.colorAsset,
      Dark.Indigo._50.colorAsset,
      Dark.Indigo._60.colorAsset,
      Dark.Indigo._70.colorAsset,
      Dark.Indigo._80.colorAsset,
      Dark.Indigo._90.colorAsset,
      Dark.Indigo.minus10.colorAsset,
      Dark.Indigo.minus5.colorAsset,
      Dark.Magenta._0.colorAsset,
      Dark.Magenta._10.colorAsset,
      Dark.Magenta._20.colorAsset,
      Dark.Magenta._30.colorAsset,
      Dark.Magenta._40.colorAsset,
      Dark.Magenta._5.colorAsset,
      Dark.Magenta._50.colorAsset,
      Dark.Magenta._60.colorAsset,
      Dark.Magenta._70.colorAsset,
      Dark.Magenta._80.colorAsset,
      Dark.Magenta._90.colorAsset,
      Dark.Magenta.minus10.colorAsset,
      Dark.Magenta.minus5.colorAsset,
      Dark.Neutral._0.colorAsset,
      Dark.Neutral._10.colorAsset,
      Dark.Neutral._20.colorAsset,
      Dark.Neutral._30.colorAsset,
      Dark.Neutral._40.colorAsset,
      Dark.Neutral._5.colorAsset,
      Dark.Neutral._50.colorAsset,
      Dark.Neutral._60.colorAsset,
      Dark.Neutral._70.colorAsset,
      Dark.Neutral._80.colorAsset,
      Dark.Neutral._90.colorAsset,
      Dark.Neutral.minus10.colorAsset,
      Dark.Neutral.minus5.colorAsset,
      Dark.NeutralA._0.colorAsset,
      Dark.NeutralA._10.colorAsset,
      Dark.NeutralA._20.colorAsset,
      Dark.NeutralA._30.colorAsset,
      Dark.NeutralA._40.colorAsset,
      Dark.NeutralA._5.colorAsset,
      Dark.NeutralA._50.colorAsset,
      Dark.NeutralA._60.colorAsset,
      Dark.NeutralA._70.colorAsset,
      Dark.NeutralA._80.colorAsset,
      Dark.NeutralA._90.colorAsset,
      Dark.NeutralA.minus10.colorAsset,
      Dark.NeutralA.minus5.colorAsset,
      Dark.Orange._0.colorAsset,
      Dark.Orange._10.colorAsset,
      Dark.Orange._20.colorAsset,
      Dark.Orange._30.colorAsset,
      Dark.Orange._40.colorAsset,
      Dark.Orange._5.colorAsset,
      Dark.Orange._50.colorAsset,
      Dark.Orange._60.colorAsset,
      Dark.Orange._70.colorAsset,
      Dark.Orange._80.colorAsset,
      Dark.Orange._90.colorAsset,
      Dark.Orange.minus10.colorAsset,
      Dark.Orange.minus5.colorAsset,
      Dark.Purple._0.colorAsset,
      Dark.Purple._10.colorAsset,
      Dark.Purple._20.colorAsset,
      Dark.Purple._30.colorAsset,
      Dark.Purple._40.colorAsset,
      Dark.Purple._5.colorAsset,
      Dark.Purple._50.colorAsset,
      Dark.Purple._60.colorAsset,
      Dark.Purple._70.colorAsset,
      Dark.Purple._80.colorAsset,
      Dark.Purple._90.colorAsset,
      Dark.Purple.minus10.colorAsset,
      Dark.Purple.minus5.colorAsset,
      Dark.Red._0.colorAsset,
      Dark.Red._10.colorAsset,
      Dark.Red._20.colorAsset,
      Dark.Red._30.colorAsset,
      Dark.Red._40.colorAsset,
      Dark.Red._5.colorAsset,
      Dark.Red._50.colorAsset,
      Dark.Red._60.colorAsset,
      Dark.Red._70.colorAsset,
      Dark.Red._80.colorAsset,
      Dark.Red._90.colorAsset,
      Dark.Red.minus10.colorAsset,
      Dark.Red.minus5.colorAsset,
      Dark.Turquoise._0.colorAsset,
      Dark.Turquoise._10.colorAsset,
      Dark.Turquoise._20.colorAsset,
      Dark.Turquoise._30.colorAsset,
      Dark.Turquoise._40.colorAsset,
      Dark.Turquoise._5.colorAsset,
      Dark.Turquoise._50.colorAsset,
      Dark.Turquoise._60.colorAsset,
      Dark.Turquoise._70.colorAsset,
      Dark.Turquoise._80.colorAsset,
      Dark.Turquoise._90.colorAsset,
      Dark.Turquoise.minus10.colorAsset,
      Dark.Turquoise.minus5.colorAsset,
      Dark.Yellow._0.colorAsset,
      Dark.Yellow._10.colorAsset,
      Dark.Yellow._20.colorAsset,
      Dark.Yellow._30.colorAsset,
      Dark.Yellow._40.colorAsset,
      Dark.Yellow._5.colorAsset,
      Dark.Yellow._50.colorAsset,
      Dark.Yellow._60.colorAsset,
      Dark.Yellow._70.colorAsset,
      Dark.Yellow._80.colorAsset,
      Dark.Yellow._90.colorAsset,
      Dark.Yellow.minus10.colorAsset,
      Dark.Yellow.minus5.colorAsset,
      Icon.`default`.colorAsset,
      Icon.disable.colorAsset,
      Icon.hover.colorAsset,
      Icon.Negative.`default`.colorAsset,
      Icon.Negative.hover.colorAsset,
      Icon.Negative.press.colorAsset,
      Icon.Notice.`default`.colorAsset,
      Icon.Notice.hover.colorAsset,
      Icon.Notice.press.colorAsset,
      Icon.OnNegative.`default`.colorAsset,
      Icon.OnNegative.hover.colorAsset,
      Icon.OnNegative.press.colorAsset,
      Icon.OnNeutral.`default`.colorAsset,
      Icon.OnNeutral.hover.colorAsset,
      Icon.OnNeutral.press.colorAsset,
      Icon.OnNotice.`default`.colorAsset,
      Icon.OnNotice.hover.colorAsset,
      Icon.OnNotice.press.colorAsset,
      Icon.OnOnImg.`default`.colorAsset,
      Icon.OnOnImg.hover.colorAsset,
      Icon.OnOnImg.press.colorAsset,
      Icon.OnPositive.`default`.colorAsset,
      Icon.OnPositive.hover.colorAsset,
      Icon.OnPositive.press.colorAsset,
      Icon.OnPrimary.`default`.colorAsset,
      Icon.OnPrimary.hover.colorAsset,
      Icon.OnPrimary.press.colorAsset,
      Icon.Positive.`default`.colorAsset,
      Icon.Positive.hover.colorAsset,
      Icon.Positive.press.colorAsset,
      Icon.press.colorAsset,
      Icon.Secondary.`default`.colorAsset,
      Icon.Secondary.hover.colorAsset,
      Icon.Secondary.press.colorAsset,
      Icon.Tertiary.`default`.colorAsset,
      Icon.Tertiary.hover.colorAsset,
      Icon.Tertiary.press.colorAsset,
      Light.Cyan._50.colorAsset,
      Light.Emerald._10.colorAsset,
      Light.Emerald._20.colorAsset,
      Light.Emerald._30.colorAsset,
      Light.Emerald._40.colorAsset,
      Light.Emerald._5.colorAsset,
      Light.Emerald._50.colorAsset,
      Light.Emerald._60.colorAsset,
      Light.Emerald._70.colorAsset,
      Light.Emerald._80.colorAsset,
      Light.Emerald._90.colorAsset,
      Light.Blue._0.colorAsset,
      Light.Blue._10.colorAsset,
      Light.Blue._20.colorAsset,
      Light.Blue._30.colorAsset,
      Light.Blue._40.colorAsset,
      Light.Blue._5.colorAsset,
      Light.Blue._50.colorAsset,
      Light.Blue._60.colorAsset,
      Light.Blue._70.colorAsset,
      Light.Blue._80.colorAsset,
      Light.Blue._90.colorAsset,
      Light.Green._0.colorAsset,
      Light.Green._10.colorAsset,
      Light.Green._20.colorAsset,
      Light.Green._30.colorAsset,
      Light.Green._40.colorAsset,
      Light.Green._5.colorAsset,
      Light.Green._50.colorAsset,
      Light.Green._60.colorAsset,
      Light.Green._70.colorAsset,
      Light.Green._80.colorAsset,
      Light.Green._90.colorAsset,
      Light.Indigo._10.colorAsset,
      Light.Indigo._20.colorAsset,
      Light.Indigo._30.colorAsset,
      Light.Indigo._40.colorAsset,
      Light.Indigo._5.colorAsset,
      Light.Indigo._50.colorAsset,
      Light.Indigo._60.colorAsset,
      Light.Indigo._70.colorAsset,
      Light.Indigo._80.colorAsset,
      Light.Indigo._90.colorAsset,
      Light.Magenta._10.colorAsset,
      Light.Magenta._20.colorAsset,
      Light.Magenta._30.colorAsset,
      Light.Magenta._40.colorAsset,
      Light.Magenta._5.colorAsset,
      Light.Magenta._50.colorAsset,
      Light.Magenta._60.colorAsset,
      Light.Magenta._70.colorAsset,
      Light.Magenta._80.colorAsset,
      Light.Magenta._90.colorAsset,
      Light.Neutral._0.colorAsset,
      Light.Neutral._10.colorAsset,
      Light.Neutral._20.colorAsset,
      Light.Neutral._30.colorAsset,
      Light.Neutral._40.colorAsset,
      Light.Neutral._5.colorAsset,
      Light.Neutral._50.colorAsset,
      Light.Neutral._60.colorAsset,
      Light.Neutral._70.colorAsset,
      Light.Neutral._80.colorAsset,
      Light.Neutral._90.colorAsset,
      Light.NeutralA._0.colorAsset,
      Light.NeutralA._10.colorAsset,
      Light.NeutralA._20.colorAsset,
      Light.NeutralA._30.colorAsset,
      Light.NeutralA._40.colorAsset,
      Light.NeutralA._5.colorAsset,
      Light.NeutralA._50.colorAsset,
      Light.NeutralA._60.colorAsset,
      Light.NeutralA._70.colorAsset,
      Light.NeutralA._80.colorAsset,
      Light.NeutralA._90.colorAsset,
      Light.Orange._10.colorAsset,
      Light.Orange._20.colorAsset,
      Light.Orange._30.colorAsset,
      Light.Orange._40.colorAsset,
      Light.Orange._5.colorAsset,
      Light.Orange._50.colorAsset,
      Light.Orange._60.colorAsset,
      Light.Orange._70.colorAsset,
      Light.Orange._80.colorAsset,
      Light.Orange._90.colorAsset,
      Light.Purple._10.colorAsset,
      Light.Purple._20.colorAsset,
      Light.Purple._30.colorAsset,
      Light.Purple._40.colorAsset,
      Light.Purple._5.colorAsset,
      Light.Purple._50.colorAsset,
      Light.Purple._60.colorAsset,
      Light.Purple._70.colorAsset,
      Light.Purple._80.colorAsset,
      Light.Purple._90.colorAsset,
      Light.Red._0.colorAsset,
      Light.Red._10.colorAsset,
      Light.Red._20.colorAsset,
      Light.Red._30.colorAsset,
      Light.Red._40.colorAsset,
      Light.Red._5.colorAsset,
      Light.Red._50.colorAsset,
      Light.Red._60.colorAsset,
      Light.Red._70.colorAsset,
      Light.Red._80.colorAsset,
      Light.Red._90.colorAsset,
      Light.Turquoise._0.colorAsset,
      Light.Turquoise._10.colorAsset,
      Light.Turquoise._20.colorAsset,
      Light.Turquoise._30.colorAsset,
      Light.Turquoise._40.colorAsset,
      Light.Turquoise._5.colorAsset,
      Light.Turquoise._50.colorAsset,
      Light.Turquoise._60.colorAsset,
      Light.Turquoise._70.colorAsset,
      Light.Turquoise._80.colorAsset,
      Light.Turquoise._90.colorAsset,
      Light.Yellow._0.colorAsset,
      Light.Yellow._10.colorAsset,
      Light.Yellow._20.colorAsset,
      Light.Yellow._30.colorAsset,
      Light.Yellow._40.colorAsset,
      Light.Yellow._5.colorAsset,
      Light.Yellow._50.colorAsset,
      Light.Yellow._60.colorAsset,
      Light.Yellow._70.colorAsset,
      Light.Yellow._80.colorAsset,
      Light.Yellow._90.colorAsset,
      Text.defaultText1.colorAsset,
      Text.`default`.colorAsset,
      Text.disable.colorAsset,
      Text.hoverText1.colorAsset,
      Text.hover.colorAsset,
      Text.Info.`default`.colorAsset,
      Text.Info.hover.colorAsset,
      Text.Info.press.colorAsset,
      Text.Negative.`default`.colorAsset,
      Text.Negative.hover.colorAsset,
      Text.Negative.press.colorAsset,
      Text.Notice.`default`.colorAsset,
      Text.Notice.hover.colorAsset,
      Text.Notice.press.colorAsset,
      Text.OnDiscovery.`default`.colorAsset,
      Text.OnDiscovery.hover.colorAsset,
      Text.OnDiscovery.press.colorAsset,
      Text.OnHud.`default`.colorAsset,
      Text.OnHud.hover.colorAsset,
      Text.OnHud.press.colorAsset,
      Text.OnNegative.`default`.colorAsset,
      Text.OnNegative.hover.colorAsset,
      Text.OnNegative.press.colorAsset,
      Text.OnNotice.`default`.colorAsset,
      Text.OnNotice.hover.colorAsset,
      Text.OnNotice.press.colorAsset,
      Text.OnOnImg.`default`.colorAsset,
      Text.OnOnImg.hover.colorAsset,
      Text.OnOnImg.press.colorAsset,
      Text.OnPositive.`default`.colorAsset,
      Text.OnPositive.hover.colorAsset,
      Text.OnPositive.press.colorAsset,
      Text.OnPrimary.`default`.colorAsset,
      Text.OnPrimary.hover.colorAsset,
      Text.OnPrimary.press.colorAsset,
      Text.Placeholder.`default`.colorAsset,
      Text.Placeholder.hover.colorAsset,
      Text.Placeholder.press.colorAsset,
      Text.Positive.`default`.colorAsset,
      Text.Positive.hover.colorAsset,
      Text.Positive.press.colorAsset,
      Text.pressText1.colorAsset,
      Text.press.colorAsset,
      Text.Secondary.`default`.colorAsset,
      Text.Secondary.hover.colorAsset,
      Text.Secondary.press.colorAsset,
      Text.Tertiary.`default`.colorAsset,
      Text.Tertiary.hover.colorAsset,
      Text.Tertiary.press.colorAsset,
      Text.Visited.`default`.colorAsset,
      Text.Visited.hover.colorAsset,
      Text.Visited.press.colorAsset,
    ]
  }
  public enum Images : CaseIterable {
    public enum _16 : CaseIterable {
      public static let addAsset = ImageAsset(name: "16/Add")
      public static let archiveAsset = ImageAsset(name: "16/Archive")
      public static let arrowDownAsset = ImageAsset(name: "16/ArrowDown")
      public static let artworkAsset = ImageAsset(name: "16/Artwork")
      public static let backAsset = ImageAsset(name: "16/Back")
      public static let bookAsset = ImageAsset(name: "16/Book")
      public static let bookmarkOffAsset = ImageAsset(name: "16/BookmarkOff")
      public static let bookmarkOnAsset = ImageAsset(name: "16/BookmarkOn")
      public static let checkAsset = ImageAsset(name: "16/Check")
      public static let commentAsset = ImageAsset(name: "16/Comment")
      public static let dotAsset = ImageAsset(name: "16/Dot")
      public static let downAsset = ImageAsset(name: "16/Down")
      public static let errorAsset = ImageAsset(name: "16/Error")
      public static let filterAsset = ImageAsset(name: "16/Filter")
      public static let imageResponseAsset = ImageAsset(name: "16/ImageResponse")
      public static let infoAsset = ImageAsset(name: "16/Info")
      public static let likeAsset = ImageAsset(name: "16/Like")
      public static let menuAsset = ImageAsset(name: "16/Menu")
      public static let moreAsset = ImageAsset(name: "16/More")
      public static let nextworksAsset = ImageAsset(name: "16/Nextworks")
      public static let pencilAsset = ImageAsset(name: "16/Pencil")
      public static let questionAsset = ImageAsset(name: "16/Question")
      public static let rankingAsset = ImageAsset(name: "16/Ranking")
      public static let removeAsset = ImageAsset(name: "16/Remove")
      public static let searchAsset = ImageAsset(name: "16/Search")
      public static let smileAsset = ImageAsset(name: "16/Smile")
      public static let speakerAsset = ImageAsset(name: "16/Speaker")
      public static let trashAsset = ImageAsset(name: "16/Trash")
      public static let upAsset = ImageAsset(name: "16/Up")
      public static let viewAsset = ImageAsset(name: "16/View")
      public static let warningAsset = ImageAsset(name: "16/Warning")
    }
    public enum _24 : CaseIterable {
      public static let addAsset = ImageAsset(name: "24/Add")
      public static let addImageAsset = ImageAsset(name: "24/AddImage")
      public static let addModelAsset = ImageAsset(name: "24/AddModel")
      public static let addPeopleAsset = ImageAsset(name: "24/AddPeople")
      public static let addRubiAsset = ImageAsset(name: "24/AddRubi")
      public static let addTextAsset = ImageAsset(name: "24/AddText")
      public static let alartAsset = ImageAsset(name: "24/Alart")
      public static let announcementAsset = ImageAsset(name: "24/Announcement")
      public static let arAsset = ImageAsset(name: "24/Ar")
      public static let archiveAsset = ImageAsset(name: "24/Archive")
      public static let arrowDownAsset = ImageAsset(name: "24/ArrowDown")
      public static let arrowUpAsset = ImageAsset(name: "24/ArrowUp")
      public static let binetAsset = ImageAsset(name: "24/Binet")
      public static let bodyAsset = ImageAsset(name: "24/Body")
      public static let bodyEditAsset = ImageAsset(name: "24/BodyEdit")
      public static let bookAsset = ImageAsset(name: "24/Book")
      public static let bringBackwardAsset = ImageAsset(name: "24/BringBackward")
      public static let bringForwardAsset = ImageAsset(name: "24/BringForward")
      public static let calendarAsset = ImageAsset(name: "24/Calendar")
      public static let cameraAsset = ImageAsset(name: "24/Camera")
      public static let cameraVideoAsset = ImageAsset(name: "24/CameraVideo")
      public static let cartAsset = ImageAsset(name: "24/Cart")
      public static let changeCharacterAsset = ImageAsset(name: "24/ChangeCharacter")
      public static let chatBotAsset = ImageAsset(name: "24/ChatBot")
      public static let checkAsset = ImageAsset(name: "24/Check")
      public static let chromaticAberrationAsset = ImageAsset(name: "24/ChromaticAberration")
      public static let clickAsset = ImageAsset(name: "24/Click")
      public static let closeAsset = ImageAsset(name: "24/Close")
      public static let codesAsset = ImageAsset(name: "24/Codes")
      public static let collapseAsset = ImageAsset(name: "24/Collapse")
      public static let collectionAsset = ImageAsset(name: "24/Collection")
      public static let commentFillAsset = ImageAsset(name: "24/CommentFill")
      public static let commentOutlineAsset = ImageAsset(name: "24/CommentOutline")
      public static let contestAsset = ImageAsset(name: "24/Contest")
      public static let contrastAsset = ImageAsset(name: "24/Contrast")
      public static let copyAsset = ImageAsset(name: "24/Copy")
      public static let descriptionAsset = ImageAsset(name: "24/Description")
      public static let deviceRotationAsset = ImageAsset(name: "24/DeviceRotation")
      public static let discoveryAsset = ImageAsset(name: "24/Discovery")
      public static let dotAsset = ImageAsset(name: "24/Dot")
      public static let dotAltAsset = ImageAsset(name: "24/DotAlt")
      public static let downAsset = ImageAsset(name: "24/Down")
      public static let downloadAltAsset = ImageAsset(name: "24/DownloadAlt")
      public static let duplicateAsset = ImageAsset(name: "24/Duplicate")
      public static let dustAsset = ImageAsset(name: "24/Dust")
      public static let emojiAsset = ImageAsset(name: "24/Emoji")
      public static let errorAsset = ImageAsset(name: "24/Error")
      public static let errorOctagonAsset = ImageAsset(name: "24/ErrorOctagon")
      public static let eventsAsset = ImageAsset(name: "24/Events")
      public static let expandAsset = ImageAsset(name: "24/Expand")
      public static let faceEditAsset = ImageAsset(name: "24/FaceEdit")
      public static let fashionAsset = ImageAsset(name: "24/Fashion")
      public static let feedAsset = ImageAsset(name: "24/Feed")
      public static let fileAsset = ImageAsset(name: "24/File")
      public static let filterAsset = ImageAsset(name: "24/Filter")
      public static let flareAsset = ImageAsset(name: "24/Flare")
      public static let formatAlignCenterAsset = ImageAsset(name: "24/FormatAlignCenter")
      public static let formatAlignJustifiedAsset = ImageAsset(name: "24/FormatAlignJustified")
      public static let formatAlignLeftAsset = ImageAsset(name: "24/FormatAlignLeft")
      public static let formatAlignRightAsset = ImageAsset(name: "24/FormatAlignRight")
      public static let formatColorFillAsset = ImageAsset(name: "24/FormatColorFill")
      public static let formatColorFillNoColorAsset = ImageAsset(name: "24/FormatColorFillNoColor")
      public static let formatFontFamilyAsset = ImageAsset(name: "24/FormatFontFamily")
      public static let formatFontSizeAsset = ImageAsset(name: "24/FormatFontSize")
      public static let formatLetterSpacingAsset = ImageAsset(name: "24/FormatLetterSpacing")
      public static let formatLineSpacingAsset = ImageAsset(name: "24/FormatLineSpacing")
      public static let fovAsset = ImageAsset(name: "24/Fov")
      public static let frameEffectAsset = ImageAsset(name: "24/FrameEffect")
      public static let frameSizeAsset = ImageAsset(name: "24/FrameSize")
      public static let giftAsset = ImageAsset(name: "24/Gift")
      public static let glowAsset = ImageAsset(name: "24/Glow")
      public static let groupsAsset = ImageAsset(name: "24/Groups")
      public static let hairEditAsset = ImageAsset(name: "24/HairEdit")
      public static let hashtagAsset = ImageAsset(name: "24/Hashtag")
      public static let hideAsset = ImageAsset(name: "24/Hide")
      public static let hightlightTextAsset = ImageAsset(name: "24/HightlightText")
      public static let homeAsset = ImageAsset(name: "24/Home")
      public static let hueAsset = ImageAsset(name: "24/Hue")
      public static let ideaAsset = ImageAsset(name: "24/Idea")
      public static let imageAsset = ImageAsset(name: "24/Image")
      public static let imageAltAsset = ImageAsset(name: "24/ImageAlt")
      public static let imageHiddenAsset = ImageAsset(name: "24/ImageHidden")
      public static let imageReplaceAsset = ImageAsset(name: "24/ImageReplace")
      public static let imagesAsset = ImageAsset(name: "24/Images")
      public static let imgContainAsset = ImageAsset(name: "24/ImgContain")
      public static let imgCoverAsset = ImageAsset(name: "24/ImgCover")
      public static let indexAsset = ImageAsset(name: "24/Index")
      public static let infoAsset = ImageAsset(name: "24/Info")
      public static let invalidAsset = ImageAsset(name: "24/Invalid")
      public static let invoiceAsset = ImageAsset(name: "24/Invoice")
      public static let itemRemoveAsset = ImageAsset(name: "24/ItemRemove")
      public static let latestWorksAsset = ImageAsset(name: "24/LatestWorks")
      public static let likeOffAsset = ImageAsset(name: "24/LikeOff")
      public static let likeOnAsset = ImageAsset(name: "24/LikeOn")
      public static let linkAsset = ImageAsset(name: "24/Link")
      public static let listAsset = ImageAsset(name: "24/List")
      public static let lockLockAsset = ImageAsset(name: "24/LockLock")
      public static let lockUnlockAsset = ImageAsset(name: "24/LockUnlock")
      public static let loginAsset = ImageAsset(name: "24/Login")
      public static let logoutAsset = ImageAsset(name: "24/Logout")
      public static let mangaAsset = ImageAsset(name: "24/Manga")
      public static let menuAsset = ImageAsset(name: "24/Menu")
      public static let messageAsset = ImageAsset(name: "24/Message")
      public static let microphoneAsset = ImageAsset(name: "24/Microphone")
      public static let mobilePhoneAsset = ImageAsset(name: "24/MobilePhone")
      public static let move1Asset = ImageAsset(name: "24/Move1")
      public static let multiSelectAsset = ImageAsset(name: "24/MultiSelect")
      public static let nextAsset = ImageAsset(name: "24/Next")
      public static let noImageAsset = ImageAsset(name: "24/NoImage")
      public static let notificationAsset = ImageAsset(name: "24/Notification")
      public static let notificationOffAsset = ImageAsset(name: "24/NotificationOff")
      public static let novelsAsset = ImageAsset(name: "24/Novels")
      public static let openInNewAsset = ImageAsset(name: "24/OpenInNew")
      public static let optionsAsset = ImageAsset(name: "24/Options")
      public static let optionsAltAsset = ImageAsset(name: "24/OptionsAlt")
      public static let overlayAsset = ImageAsset(name: "24/Overlay")
      public static let paletteAsset = ImageAsset(name: "24/Palette")
      public static let pauseAsset = ImageAsset(name: "24/Pause")
      public static let pauseAltAsset = ImageAsset(name: "24/PauseAlt")
      public static let pencilAsset = ImageAsset(name: "24/Pencil")
      public static let pencilAddAsset = ImageAsset(name: "24/PencilAdd")
      public static let pencilDrawAsset = ImageAsset(name: "24/PencilDraw")
      public static let pencilLiveAsset = ImageAsset(name: "24/PencilLive")
      public static let pencilTextAsset = ImageAsset(name: "24/PencilText")
      public static let personAsset = ImageAsset(name: "24/Person")
      public static let playAsset = ImageAsset(name: "24/Play")
      public static let poseAsset = ImageAsset(name: "24/Pose")
      public static let prevAsset = ImageAsset(name: "24/Prev")
      public static let projectsAsset = ImageAsset(name: "24/Projects")
      public static let pullDownAsset = ImageAsset(name: "24/PullDown")
      public static let pullUpAsset = ImageAsset(name: "24/PullUp")
      public static let questionAsset = ImageAsset(name: "24/Question")
      public static let questionOutlineAsset = ImageAsset(name: "24/QuestionOutline")
      public static let rankingAsset = ImageAsset(name: "24/Ranking")
      public static let readHorizontalLeftAsset = ImageAsset(name: "24/ReadHorizontalLeft")
      public static let readHorizontalRightAsset = ImageAsset(name: "24/ReadHorizontalRight")
      public static let readVerticalAsset = ImageAsset(name: "24/ReadVertical")
      public static let redoAsset = ImageAsset(name: "24/Redo")
      public static let reloadAsset = ImageAsset(name: "24/Reload")
      public static let reloadLoopAsset = ImageAsset(name: "24/ReloadLoop")
      public static let reorderAsset = ImageAsset(name: "24/Reorder")
      public static let replyAsset = ImageAsset(name: "24/Reply")
      public static let rollAsset = ImageAsset(name: "24/Roll")
      public static let rotate90DegreesCAsset = ImageAsset(name: "24/Rotate90DegreesC")
      public static let rotate90DegreesCcAsset = ImageAsset(name: "24/Rotate90DegreesCc")
      public static let rotateRightAsset = ImageAsset(name: "24/RotateRight")
      public static let saturationAsset = ImageAsset(name: "24/Saturation")
      public static let saveAsset = ImageAsset(name: "24/Save")
      public static let searchAsset = ImageAsset(name: "24/Search")
      public static let sendAsset = ImageAsset(name: "24/Send")
      public static let servicesAsset = ImageAsset(name: "24/Services")
      public static let setAsset = ImageAsset(name: "24/Set")
      public static let settingsAsset = ImageAsset(name: "24/Settings")
      public static let shareAndroidAsset = ImageAsset(name: "24/ShareAndroid")
      public static let shareIosAsset = ImageAsset(name: "24/ShareIos")
      public static let shoppingAsset = ImageAsset(name: "24/Shopping")
      public static let showAsset = ImageAsset(name: "24/Show")
      public static let showOutlineAsset = ImageAsset(name: "24/ShowOutline")
      public static let shutterAsset = ImageAsset(name: "24/Shutter")
      public static let starAsset = ImageAsset(name: "24/Star")
      public static let subtractAsset = ImageAsset(name: "24/Subtract")
      public static let sunAsset = ImageAsset(name: "24/Sun")
      public static let temperatureAsset = ImageAsset(name: "24/Temperature")
      public static let textAsset = ImageAsset(name: "24/Text")
      public static let threadAsset = ImageAsset(name: "24/Thread")
      public static let trashAsset = ImageAsset(name: "24/Trash")
      public static let trashAltAsset = ImageAsset(name: "24/TrashAlt")
      public static let undoAsset = ImageAsset(name: "24/Undo")
      public static let upAsset = ImageAsset(name: "24/Up")
      public static let uploadAsset = ImageAsset(name: "24/Upload")
      public static let uploadAltAsset = ImageAsset(name: "24/UploadAlt")
      public static let usagiAsset = ImageAsset(name: "24/Usagi")
      public static let usagiAltAsset = ImageAsset(name: "24/UsagiAlt")
      public static let usersAsset = ImageAsset(name: "24/Users")
      public static let videoAsset = ImageAsset(name: "24/Video")
      public static let viewGrid2ColumnsAsset = ImageAsset(name: "24/ViewGrid2Columns")
      public static let viewGrid3ColumnsAsset = ImageAsset(name: "24/ViewGrid3Columns")
      public static let viewListAsset = ImageAsset(name: "24/ViewList")
      public static let warningAsset = ImageAsset(name: "24/Warning")
    }
    public enum _32 : CaseIterable {
      public static let bookmarkOffAsset = ImageAsset(name: "32/BookmarkOff")
      public static let bookmarkOnAsset = ImageAsset(name: "32/BookmarkOn")
      public static let cameraAsset = ImageAsset(name: "32/Camera")
      public static let closeAsset = ImageAsset(name: "32/Close")
      public static let collapseAsset = ImageAsset(name: "32/Collapse")
      public static let commentOffAsset = ImageAsset(name: "32/CommentOff")
      public static let commentOnAsset = ImageAsset(name: "32/CommentOn")
      public static let deleteAsset = ImageAsset(name: "32/Delete")
      public static let dotAsset = ImageAsset(name: "32/Dot")
      public static let editAsset = ImageAsset(name: "32/Edit")
      public static let expandAsset = ImageAsset(name: "32/Expand")
      public static let giftAsset = ImageAsset(name: "32/Gift")
      public static let homeAsset = ImageAsset(name: "32/Home")
      public static let horizontalWritingAsset = ImageAsset(name: "32/HorizontalWriting")
      public static let imageHiddenAsset = ImageAsset(name: "32/ImageHidden")
      public static let indexAsset = ImageAsset(name: "32/Index")
      public static let likeOffAsset = ImageAsset(name: "32/LikeOff")
      public static let likeOnAsset = ImageAsset(name: "32/LikeOn")
      public static let likeOnPrivateAsset = ImageAsset(name: "32/LikeOnPrivate")
      public static let messageAsset = ImageAsset(name: "32/Message")
      public static let nextAsset = ImageAsset(name: "32/Next")
      public static let notificationAsset = ImageAsset(name: "32/Notification")
      public static let notificationOffAsset = ImageAsset(name: "32/NotificationOff")
      public static let novelViewerSettingsAsset = ImageAsset(name: "32/NovelViewerSettings")
      public static let panAsset = ImageAsset(name: "32/Pan")
      public static let prevAsset = ImageAsset(name: "32/Prev")
      public static let pullDownAsset = ImageAsset(name: "32/PullDown")
      public static let pullUpAsset = ImageAsset(name: "32/PullUp")
      public static let readHorizontalLeftAsset = ImageAsset(name: "32/ReadHorizontalLeft")
      public static let readHorizontalRightAsset = ImageAsset(name: "32/ReadHorizontalRight")
      public static let readVerticalAsset = ImageAsset(name: "32/ReadVertical")
      public static let redoAsset = ImageAsset(name: "32/Redo")
      public static let rollHorizontalAsset = ImageAsset(name: "32/RollHorizontal")
      public static let rollVerticalAsset = ImageAsset(name: "32/RollVertical")
      public static let sansSerifAsset = ImageAsset(name: "32/SansSerif")
      public static let serifAsset = ImageAsset(name: "32/Serif")
      public static let shareAndroidAsset = ImageAsset(name: "32/ShareAndroid")
      public static let shareIosAsset = ImageAsset(name: "32/ShareIos")
      public static let shoppingAsset = ImageAsset(name: "32/Shopping")
      public static let undoAsset = ImageAsset(name: "32/Undo")
      public static let uploadAsset = ImageAsset(name: "32/Upload")
      public static let userAsset = ImageAsset(name: "32/User")
      public static let verticalWritingAsset = ImageAsset(name: "32/VerticalWriting")
      public static let zoomInAsset = ImageAsset(name: "32/ZoomIn")
    }
    public enum Inline : CaseIterable {
      public static let addAsset = ImageAsset(name: "Inline/Add")
      public static let backAsset = ImageAsset(name: "Inline/Back")
      public static let bookmarkOffAsset = ImageAsset(name: "Inline/BookmarkOff")
      public static let bookmarkOnAsset = ImageAsset(name: "Inline/BookmarkOn")
      public static let breadcrumbsAsset = ImageAsset(name: "Inline/Breadcrumbs")
      public static let checkAsset = ImageAsset(name: "Inline/Check")
      public static let commentAsset = ImageAsset(name: "Inline/Comment")
      public static let contextMenuAsset = ImageAsset(name: "Inline/ContextMenu")
      public static let externalAsset = ImageAsset(name: "Inline/External")
      public static let filterAsset = ImageAsset(name: "Inline/Filter")
      public static let folderAsset = ImageAsset(name: "Inline/Folder")
      public static let imageResponseAsset = ImageAsset(name: "Inline/ImageResponse")
      public static let imagesAsset = ImageAsset(name: "Inline/Images")
      public static let latestAsset = ImageAsset(name: "Inline/Latest")
      public static let likeAsset = ImageAsset(name: "Inline/Like")
      public static let likeOffAsset = ImageAsset(name: "Inline/LikeOff")
      public static let listAsset = ImageAsset(name: "Inline/List")
      public static let locationAsset = ImageAsset(name: "Inline/Location")
      public static let lockAsset = ImageAsset(name: "Inline/Lock")
      public static let moreAsset = ImageAsset(name: "Inline/More")
      public static let multiSelectAsset = ImageAsset(name: "Inline/MultiSelect")
      public static let nextworksAsset = ImageAsset(name: "Inline/Nextworks")
      public static let openInNewAsset = ImageAsset(name: "Inline/OpenInNew")
      public static let pencilAsset = ImageAsset(name: "Inline/Pencil")
      public static let removeAsset = ImageAsset(name: "Inline/Remove")
      public static let smileAsset = ImageAsset(name: "Inline/Smile")
      public static let smileOnAsset = ImageAsset(name: "Inline/SmileOn")
      public static let trashAsset = ImageAsset(name: "Inline/Trash")
      public static let usersAsset = ImageAsset(name: "Inline/Users")
      public static let viewAsset = ImageAsset(name: "Inline/View")
      public static let viewOutlineAsset = ImageAsset(name: "Inline/ViewOutline")
    }
    case add16
    case archive16
    case arrowDown16
    case artwork16
    case back16
    case book16
    case bookmarkOff16
    case bookmarkOn16
    case check16
    case comment16
    case dot16
    case down16
    case error16
    case filter16
    case imageResponse16
    case info16
    case like16
    case menu16
    case more16
    case nextworks16
    case pencil16
    case question16
    case ranking16
    case remove16
    case search16
    case smile16
    case speaker16
    case trash16
    case up16
    case view16
    case warning16
    case add24
    case addImage24
    case addModel24
    case addPeople24
    case addRubi24
    case addText24
    case alart24
    case announcement24
    case ar24
    case archive24
    case arrowDown24
    case arrowUp24
    case binet24
    case body24
    case bodyEdit24
    case book24
    case bringBackward24
    case bringForward24
    case calendar24
    case camera24
    case cameraVideo24
    case cart24
    case changeCharacter24
    case chatBot24
    case check24
    case chromaticAberration24
    case click24
    case close24
    case codes24
    case collapse24
    case collection24
    case commentFill24
    case commentOutline24
    case contest24
    case contrast24
    case copy24
    case description24
    case deviceRotation24
    case discovery24
    case dot24
    case dotAlt24
    case down24
    case downloadAlt24
    case duplicate24
    case dust24
    case emoji24
    case error24
    case errorOctagon24
    case events24
    case expand24
    case faceEdit24
    case fashion24
    case feed24
    case file24
    case filter24
    case flare24
    case formatAlignCenter24
    case formatAlignJustified24
    case formatAlignLeft24
    case formatAlignRight24
    case formatColorFill24
    case formatColorFillNoColor24
    case formatFontFamily24
    case formatFontSize24
    case formatLetterSpacing24
    case formatLineSpacing24
    case fov24
    case frameEffect24
    case frameSize24
    case gift24
    case glow24
    case groups24
    case hairEdit24
    case hashtag24
    case hide24
    case hightlightText24
    case home24
    case hue24
    case idea24
    case image24
    case imageAlt24
    case imageHidden24
    case imageReplace24
    case images24
    case imgContain24
    case imgCover24
    case index24
    case info24
    case invalid24
    case invoice24
    case itemRemove24
    case latestWorks24
    case likeOff24
    case likeOn24
    case link24
    case list24
    case lockLock24
    case lockUnlock24
    case login24
    case logout24
    case manga24
    case menu24
    case message24
    case microphone24
    case mobilePhone24
    case move124
    case multiSelect24
    case next24
    case noImage24
    case notification24
    case notificationOff24
    case novels24
    case openInNew24
    case options24
    case optionsAlt24
    case overlay24
    case palette24
    case pause24
    case pauseAlt24
    case pencil24
    case pencilAdd24
    case pencilDraw24
    case pencilLive24
    case pencilText24
    case person24
    case play24
    case pose24
    case prev24
    case projects24
    case pullDown24
    case pullUp24
    case question24
    case questionOutline24
    case ranking24
    case readHorizontalLeft24
    case readHorizontalRight24
    case readVertical24
    case redo24
    case reload24
    case reloadLoop24
    case reorder24
    case reply24
    case roll24
    case rotate90DegreesC24
    case rotate90DegreesCc24
    case rotateRight24
    case saturation24
    case save24
    case search24
    case send24
    case services24
    case set24
    case settings24
    case shareAndroid24
    case shareIos24
    case shopping24
    case show24
    case showOutline24
    case shutter24
    case star24
    case subtract24
    case sun24
    case temperature24
    case text24
    case thread24
    case trash24
    case trashAlt24
    case undo24
    case up24
    case upload24
    case uploadAlt24
    case usagi24
    case usagiAlt24
    case users24
    case video24
    case viewGrid2Columns24
    case viewGrid3Columns24
    case viewList24
    case warning24
    case bookmarkOff32
    case bookmarkOn32
    case camera32
    case close32
    case collapse32
    case commentOff32
    case commentOn32
    case delete32
    case dot32
    case edit32
    case expand32
    case gift32
    case home32
    case horizontalWriting32
    case imageHidden32
    case index32
    case likeOff32
    case likeOn32
    case likeOnPrivate32
    case message32
    case next32
    case notification32
    case notificationOff32
    case novelViewerSettings32
    case pan32
    case prev32
    case pullDown32
    case pullUp32
    case readHorizontalLeft32
    case readHorizontalRight32
    case readVertical32
    case redo32
    case rollHorizontal32
    case rollVertical32
    case sansSerif32
    case serif32
    case shareAndroid32
    case shareIos32
    case shopping32
    case undo32
    case upload32
    case user32
    case verticalWriting32
    case zoomIn32
    case addInline
    case backInline
    case bookmarkOffInline
    case bookmarkOnInline
    case breadcrumbsInline
    case checkInline
    case commentInline
    case contextMenuInline
    case externalInline
    case filterInline
    case folderInline
    case imageResponseInline
    case imagesInline
    case latestInline
    case likeInline
    case likeOffInline
    case listInline
    case locationInline
    case lockInline
    case moreInline
    case multiSelectInline
    case nextworksInline
    case openInNewInline
    case pencilInline
    case removeInline
    case smileInline
    case smileOnInline
    case trashInline
    case usersInline
    case viewInline
    case viewOutlineInline
    public var imageAsset: ImageAsset {
      switch (self) {
        case .add16:
          return CharcoalAsset.Images._16.addAsset
        case .archive16:
          return CharcoalAsset.Images._16.archiveAsset
        case .arrowDown16:
          return CharcoalAsset.Images._16.arrowDownAsset
        case .artwork16:
          return CharcoalAsset.Images._16.artworkAsset
        case .back16:
          return CharcoalAsset.Images._16.backAsset
        case .book16:
          return CharcoalAsset.Images._16.bookAsset
        case .bookmarkOff16:
          return CharcoalAsset.Images._16.bookmarkOffAsset
        case .bookmarkOn16:
          return CharcoalAsset.Images._16.bookmarkOnAsset
        case .check16:
          return CharcoalAsset.Images._16.checkAsset
        case .comment16:
          return CharcoalAsset.Images._16.commentAsset
        case .dot16:
          return CharcoalAsset.Images._16.dotAsset
        case .down16:
          return CharcoalAsset.Images._16.downAsset
        case .error16:
          return CharcoalAsset.Images._16.errorAsset
        case .filter16:
          return CharcoalAsset.Images._16.filterAsset
        case .imageResponse16:
          return CharcoalAsset.Images._16.imageResponseAsset
        case .info16:
          return CharcoalAsset.Images._16.infoAsset
        case .like16:
          return CharcoalAsset.Images._16.likeAsset
        case .menu16:
          return CharcoalAsset.Images._16.menuAsset
        case .more16:
          return CharcoalAsset.Images._16.moreAsset
        case .nextworks16:
          return CharcoalAsset.Images._16.nextworksAsset
        case .pencil16:
          return CharcoalAsset.Images._16.pencilAsset
        case .question16:
          return CharcoalAsset.Images._16.questionAsset
        case .ranking16:
          return CharcoalAsset.Images._16.rankingAsset
        case .remove16:
          return CharcoalAsset.Images._16.removeAsset
        case .search16:
          return CharcoalAsset.Images._16.searchAsset
        case .smile16:
          return CharcoalAsset.Images._16.smileAsset
        case .speaker16:
          return CharcoalAsset.Images._16.speakerAsset
        case .trash16:
          return CharcoalAsset.Images._16.trashAsset
        case .up16:
          return CharcoalAsset.Images._16.upAsset
        case .view16:
          return CharcoalAsset.Images._16.viewAsset
        case .warning16:
          return CharcoalAsset.Images._16.warningAsset
        case .add24:
          return CharcoalAsset.Images._24.addAsset
        case .addImage24:
          return CharcoalAsset.Images._24.addImageAsset
        case .addModel24:
          return CharcoalAsset.Images._24.addModelAsset
        case .addPeople24:
          return CharcoalAsset.Images._24.addPeopleAsset
        case .addRubi24:
          return CharcoalAsset.Images._24.addRubiAsset
        case .addText24:
          return CharcoalAsset.Images._24.addTextAsset
        case .alart24:
          return CharcoalAsset.Images._24.alartAsset
        case .announcement24:
          return CharcoalAsset.Images._24.announcementAsset
        case .ar24:
          return CharcoalAsset.Images._24.arAsset
        case .archive24:
          return CharcoalAsset.Images._24.archiveAsset
        case .arrowDown24:
          return CharcoalAsset.Images._24.arrowDownAsset
        case .arrowUp24:
          return CharcoalAsset.Images._24.arrowUpAsset
        case .binet24:
          return CharcoalAsset.Images._24.binetAsset
        case .body24:
          return CharcoalAsset.Images._24.bodyAsset
        case .bodyEdit24:
          return CharcoalAsset.Images._24.bodyEditAsset
        case .book24:
          return CharcoalAsset.Images._24.bookAsset
        case .bringBackward24:
          return CharcoalAsset.Images._24.bringBackwardAsset
        case .bringForward24:
          return CharcoalAsset.Images._24.bringForwardAsset
        case .calendar24:
          return CharcoalAsset.Images._24.calendarAsset
        case .camera24:
          return CharcoalAsset.Images._24.cameraAsset
        case .cameraVideo24:
          return CharcoalAsset.Images._24.cameraVideoAsset
        case .cart24:
          return CharcoalAsset.Images._24.cartAsset
        case .changeCharacter24:
          return CharcoalAsset.Images._24.changeCharacterAsset
        case .chatBot24:
          return CharcoalAsset.Images._24.chatBotAsset
        case .check24:
          return CharcoalAsset.Images._24.checkAsset
        case .chromaticAberration24:
          return CharcoalAsset.Images._24.chromaticAberrationAsset
        case .click24:
          return CharcoalAsset.Images._24.clickAsset
        case .close24:
          return CharcoalAsset.Images._24.closeAsset
        case .codes24:
          return CharcoalAsset.Images._24.codesAsset
        case .collapse24:
          return CharcoalAsset.Images._24.collapseAsset
        case .collection24:
          return CharcoalAsset.Images._24.collectionAsset
        case .commentFill24:
          return CharcoalAsset.Images._24.commentFillAsset
        case .commentOutline24:
          return CharcoalAsset.Images._24.commentOutlineAsset
        case .contest24:
          return CharcoalAsset.Images._24.contestAsset
        case .contrast24:
          return CharcoalAsset.Images._24.contrastAsset
        case .copy24:
          return CharcoalAsset.Images._24.copyAsset
        case .description24:
          return CharcoalAsset.Images._24.descriptionAsset
        case .deviceRotation24:
          return CharcoalAsset.Images._24.deviceRotationAsset
        case .discovery24:
          return CharcoalAsset.Images._24.discoveryAsset
        case .dot24:
          return CharcoalAsset.Images._24.dotAsset
        case .dotAlt24:
          return CharcoalAsset.Images._24.dotAltAsset
        case .down24:
          return CharcoalAsset.Images._24.downAsset
        case .downloadAlt24:
          return CharcoalAsset.Images._24.downloadAltAsset
        case .duplicate24:
          return CharcoalAsset.Images._24.duplicateAsset
        case .dust24:
          return CharcoalAsset.Images._24.dustAsset
        case .emoji24:
          return CharcoalAsset.Images._24.emojiAsset
        case .error24:
          return CharcoalAsset.Images._24.errorAsset
        case .errorOctagon24:
          return CharcoalAsset.Images._24.errorOctagonAsset
        case .events24:
          return CharcoalAsset.Images._24.eventsAsset
        case .expand24:
          return CharcoalAsset.Images._24.expandAsset
        case .faceEdit24:
          return CharcoalAsset.Images._24.faceEditAsset
        case .fashion24:
          return CharcoalAsset.Images._24.fashionAsset
        case .feed24:
          return CharcoalAsset.Images._24.feedAsset
        case .file24:
          return CharcoalAsset.Images._24.fileAsset
        case .filter24:
          return CharcoalAsset.Images._24.filterAsset
        case .flare24:
          return CharcoalAsset.Images._24.flareAsset
        case .formatAlignCenter24:
          return CharcoalAsset.Images._24.formatAlignCenterAsset
        case .formatAlignJustified24:
          return CharcoalAsset.Images._24.formatAlignJustifiedAsset
        case .formatAlignLeft24:
          return CharcoalAsset.Images._24.formatAlignLeftAsset
        case .formatAlignRight24:
          return CharcoalAsset.Images._24.formatAlignRightAsset
        case .formatColorFill24:
          return CharcoalAsset.Images._24.formatColorFillAsset
        case .formatColorFillNoColor24:
          return CharcoalAsset.Images._24.formatColorFillNoColorAsset
        case .formatFontFamily24:
          return CharcoalAsset.Images._24.formatFontFamilyAsset
        case .formatFontSize24:
          return CharcoalAsset.Images._24.formatFontSizeAsset
        case .formatLetterSpacing24:
          return CharcoalAsset.Images._24.formatLetterSpacingAsset
        case .formatLineSpacing24:
          return CharcoalAsset.Images._24.formatLineSpacingAsset
        case .fov24:
          return CharcoalAsset.Images._24.fovAsset
        case .frameEffect24:
          return CharcoalAsset.Images._24.frameEffectAsset
        case .frameSize24:
          return CharcoalAsset.Images._24.frameSizeAsset
        case .gift24:
          return CharcoalAsset.Images._24.giftAsset
        case .glow24:
          return CharcoalAsset.Images._24.glowAsset
        case .groups24:
          return CharcoalAsset.Images._24.groupsAsset
        case .hairEdit24:
          return CharcoalAsset.Images._24.hairEditAsset
        case .hashtag24:
          return CharcoalAsset.Images._24.hashtagAsset
        case .hide24:
          return CharcoalAsset.Images._24.hideAsset
        case .hightlightText24:
          return CharcoalAsset.Images._24.hightlightTextAsset
        case .home24:
          return CharcoalAsset.Images._24.homeAsset
        case .hue24:
          return CharcoalAsset.Images._24.hueAsset
        case .idea24:
          return CharcoalAsset.Images._24.ideaAsset
        case .image24:
          return CharcoalAsset.Images._24.imageAsset
        case .imageAlt24:
          return CharcoalAsset.Images._24.imageAltAsset
        case .imageHidden24:
          return CharcoalAsset.Images._24.imageHiddenAsset
        case .imageReplace24:
          return CharcoalAsset.Images._24.imageReplaceAsset
        case .images24:
          return CharcoalAsset.Images._24.imagesAsset
        case .imgContain24:
          return CharcoalAsset.Images._24.imgContainAsset
        case .imgCover24:
          return CharcoalAsset.Images._24.imgCoverAsset
        case .index24:
          return CharcoalAsset.Images._24.indexAsset
        case .info24:
          return CharcoalAsset.Images._24.infoAsset
        case .invalid24:
          return CharcoalAsset.Images._24.invalidAsset
        case .invoice24:
          return CharcoalAsset.Images._24.invoiceAsset
        case .itemRemove24:
          return CharcoalAsset.Images._24.itemRemoveAsset
        case .latestWorks24:
          return CharcoalAsset.Images._24.latestWorksAsset
        case .likeOff24:
          return CharcoalAsset.Images._24.likeOffAsset
        case .likeOn24:
          return CharcoalAsset.Images._24.likeOnAsset
        case .link24:
          return CharcoalAsset.Images._24.linkAsset
        case .list24:
          return CharcoalAsset.Images._24.listAsset
        case .lockLock24:
          return CharcoalAsset.Images._24.lockLockAsset
        case .lockUnlock24:
          return CharcoalAsset.Images._24.lockUnlockAsset
        case .login24:
          return CharcoalAsset.Images._24.loginAsset
        case .logout24:
          return CharcoalAsset.Images._24.logoutAsset
        case .manga24:
          return CharcoalAsset.Images._24.mangaAsset
        case .menu24:
          return CharcoalAsset.Images._24.menuAsset
        case .message24:
          return CharcoalAsset.Images._24.messageAsset
        case .microphone24:
          return CharcoalAsset.Images._24.microphoneAsset
        case .mobilePhone24:
          return CharcoalAsset.Images._24.mobilePhoneAsset
        case .move124:
          return CharcoalAsset.Images._24.move1Asset
        case .multiSelect24:
          return CharcoalAsset.Images._24.multiSelectAsset
        case .next24:
          return CharcoalAsset.Images._24.nextAsset
        case .noImage24:
          return CharcoalAsset.Images._24.noImageAsset
        case .notification24:
          return CharcoalAsset.Images._24.notificationAsset
        case .notificationOff24:
          return CharcoalAsset.Images._24.notificationOffAsset
        case .novels24:
          return CharcoalAsset.Images._24.novelsAsset
        case .openInNew24:
          return CharcoalAsset.Images._24.openInNewAsset
        case .options24:
          return CharcoalAsset.Images._24.optionsAsset
        case .optionsAlt24:
          return CharcoalAsset.Images._24.optionsAltAsset
        case .overlay24:
          return CharcoalAsset.Images._24.overlayAsset
        case .palette24:
          return CharcoalAsset.Images._24.paletteAsset
        case .pause24:
          return CharcoalAsset.Images._24.pauseAsset
        case .pauseAlt24:
          return CharcoalAsset.Images._24.pauseAltAsset
        case .pencil24:
          return CharcoalAsset.Images._24.pencilAsset
        case .pencilAdd24:
          return CharcoalAsset.Images._24.pencilAddAsset
        case .pencilDraw24:
          return CharcoalAsset.Images._24.pencilDrawAsset
        case .pencilLive24:
          return CharcoalAsset.Images._24.pencilLiveAsset
        case .pencilText24:
          return CharcoalAsset.Images._24.pencilTextAsset
        case .person24:
          return CharcoalAsset.Images._24.personAsset
        case .play24:
          return CharcoalAsset.Images._24.playAsset
        case .pose24:
          return CharcoalAsset.Images._24.poseAsset
        case .prev24:
          return CharcoalAsset.Images._24.prevAsset
        case .projects24:
          return CharcoalAsset.Images._24.projectsAsset
        case .pullDown24:
          return CharcoalAsset.Images._24.pullDownAsset
        case .pullUp24:
          return CharcoalAsset.Images._24.pullUpAsset
        case .question24:
          return CharcoalAsset.Images._24.questionAsset
        case .questionOutline24:
          return CharcoalAsset.Images._24.questionOutlineAsset
        case .ranking24:
          return CharcoalAsset.Images._24.rankingAsset
        case .readHorizontalLeft24:
          return CharcoalAsset.Images._24.readHorizontalLeftAsset
        case .readHorizontalRight24:
          return CharcoalAsset.Images._24.readHorizontalRightAsset
        case .readVertical24:
          return CharcoalAsset.Images._24.readVerticalAsset
        case .redo24:
          return CharcoalAsset.Images._24.redoAsset
        case .reload24:
          return CharcoalAsset.Images._24.reloadAsset
        case .reloadLoop24:
          return CharcoalAsset.Images._24.reloadLoopAsset
        case .reorder24:
          return CharcoalAsset.Images._24.reorderAsset
        case .reply24:
          return CharcoalAsset.Images._24.replyAsset
        case .roll24:
          return CharcoalAsset.Images._24.rollAsset
        case .rotate90DegreesC24:
          return CharcoalAsset.Images._24.rotate90DegreesCAsset
        case .rotate90DegreesCc24:
          return CharcoalAsset.Images._24.rotate90DegreesCcAsset
        case .rotateRight24:
          return CharcoalAsset.Images._24.rotateRightAsset
        case .saturation24:
          return CharcoalAsset.Images._24.saturationAsset
        case .save24:
          return CharcoalAsset.Images._24.saveAsset
        case .search24:
          return CharcoalAsset.Images._24.searchAsset
        case .send24:
          return CharcoalAsset.Images._24.sendAsset
        case .services24:
          return CharcoalAsset.Images._24.servicesAsset
        case .set24:
          return CharcoalAsset.Images._24.setAsset
        case .settings24:
          return CharcoalAsset.Images._24.settingsAsset
        case .shareAndroid24:
          return CharcoalAsset.Images._24.shareAndroidAsset
        case .shareIos24:
          return CharcoalAsset.Images._24.shareIosAsset
        case .shopping24:
          return CharcoalAsset.Images._24.shoppingAsset
        case .show24:
          return CharcoalAsset.Images._24.showAsset
        case .showOutline24:
          return CharcoalAsset.Images._24.showOutlineAsset
        case .shutter24:
          return CharcoalAsset.Images._24.shutterAsset
        case .star24:
          return CharcoalAsset.Images._24.starAsset
        case .subtract24:
          return CharcoalAsset.Images._24.subtractAsset
        case .sun24:
          return CharcoalAsset.Images._24.sunAsset
        case .temperature24:
          return CharcoalAsset.Images._24.temperatureAsset
        case .text24:
          return CharcoalAsset.Images._24.textAsset
        case .thread24:
          return CharcoalAsset.Images._24.threadAsset
        case .trash24:
          return CharcoalAsset.Images._24.trashAsset
        case .trashAlt24:
          return CharcoalAsset.Images._24.trashAltAsset
        case .undo24:
          return CharcoalAsset.Images._24.undoAsset
        case .up24:
          return CharcoalAsset.Images._24.upAsset
        case .upload24:
          return CharcoalAsset.Images._24.uploadAsset
        case .uploadAlt24:
          return CharcoalAsset.Images._24.uploadAltAsset
        case .usagi24:
          return CharcoalAsset.Images._24.usagiAsset
        case .usagiAlt24:
          return CharcoalAsset.Images._24.usagiAltAsset
        case .users24:
          return CharcoalAsset.Images._24.usersAsset
        case .video24:
          return CharcoalAsset.Images._24.videoAsset
        case .viewGrid2Columns24:
          return CharcoalAsset.Images._24.viewGrid2ColumnsAsset
        case .viewGrid3Columns24:
          return CharcoalAsset.Images._24.viewGrid3ColumnsAsset
        case .viewList24:
          return CharcoalAsset.Images._24.viewListAsset
        case .warning24:
          return CharcoalAsset.Images._24.warningAsset
        case .bookmarkOff32:
          return CharcoalAsset.Images._32.bookmarkOffAsset
        case .bookmarkOn32:
          return CharcoalAsset.Images._32.bookmarkOnAsset
        case .camera32:
          return CharcoalAsset.Images._32.cameraAsset
        case .close32:
          return CharcoalAsset.Images._32.closeAsset
        case .collapse32:
          return CharcoalAsset.Images._32.collapseAsset
        case .commentOff32:
          return CharcoalAsset.Images._32.commentOffAsset
        case .commentOn32:
          return CharcoalAsset.Images._32.commentOnAsset
        case .delete32:
          return CharcoalAsset.Images._32.deleteAsset
        case .dot32:
          return CharcoalAsset.Images._32.dotAsset
        case .edit32:
          return CharcoalAsset.Images._32.editAsset
        case .expand32:
          return CharcoalAsset.Images._32.expandAsset
        case .gift32:
          return CharcoalAsset.Images._32.giftAsset
        case .home32:
          return CharcoalAsset.Images._32.homeAsset
        case .horizontalWriting32:
          return CharcoalAsset.Images._32.horizontalWritingAsset
        case .imageHidden32:
          return CharcoalAsset.Images._32.imageHiddenAsset
        case .index32:
          return CharcoalAsset.Images._32.indexAsset
        case .likeOff32:
          return CharcoalAsset.Images._32.likeOffAsset
        case .likeOn32:
          return CharcoalAsset.Images._32.likeOnAsset
        case .likeOnPrivate32:
          return CharcoalAsset.Images._32.likeOnPrivateAsset
        case .message32:
          return CharcoalAsset.Images._32.messageAsset
        case .next32:
          return CharcoalAsset.Images._32.nextAsset
        case .notification32:
          return CharcoalAsset.Images._32.notificationAsset
        case .notificationOff32:
          return CharcoalAsset.Images._32.notificationOffAsset
        case .novelViewerSettings32:
          return CharcoalAsset.Images._32.novelViewerSettingsAsset
        case .pan32:
          return CharcoalAsset.Images._32.panAsset
        case .prev32:
          return CharcoalAsset.Images._32.prevAsset
        case .pullDown32:
          return CharcoalAsset.Images._32.pullDownAsset
        case .pullUp32:
          return CharcoalAsset.Images._32.pullUpAsset
        case .readHorizontalLeft32:
          return CharcoalAsset.Images._32.readHorizontalLeftAsset
        case .readHorizontalRight32:
          return CharcoalAsset.Images._32.readHorizontalRightAsset
        case .readVertical32:
          return CharcoalAsset.Images._32.readVerticalAsset
        case .redo32:
          return CharcoalAsset.Images._32.redoAsset
        case .rollHorizontal32:
          return CharcoalAsset.Images._32.rollHorizontalAsset
        case .rollVertical32:
          return CharcoalAsset.Images._32.rollVerticalAsset
        case .sansSerif32:
          return CharcoalAsset.Images._32.sansSerifAsset
        case .serif32:
          return CharcoalAsset.Images._32.serifAsset
        case .shareAndroid32:
          return CharcoalAsset.Images._32.shareAndroidAsset
        case .shareIos32:
          return CharcoalAsset.Images._32.shareIosAsset
        case .shopping32:
          return CharcoalAsset.Images._32.shoppingAsset
        case .undo32:
          return CharcoalAsset.Images._32.undoAsset
        case .upload32:
          return CharcoalAsset.Images._32.uploadAsset
        case .user32:
          return CharcoalAsset.Images._32.userAsset
        case .verticalWriting32:
          return CharcoalAsset.Images._32.verticalWritingAsset
        case .zoomIn32:
          return CharcoalAsset.Images._32.zoomInAsset
        case .addInline:
          return CharcoalAsset.Images.Inline.addAsset
        case .backInline:
          return CharcoalAsset.Images.Inline.backAsset
        case .bookmarkOffInline:
          return CharcoalAsset.Images.Inline.bookmarkOffAsset
        case .bookmarkOnInline:
          return CharcoalAsset.Images.Inline.bookmarkOnAsset
        case .breadcrumbsInline:
          return CharcoalAsset.Images.Inline.breadcrumbsAsset
        case .checkInline:
          return CharcoalAsset.Images.Inline.checkAsset
        case .commentInline:
          return CharcoalAsset.Images.Inline.commentAsset
        case .contextMenuInline:
          return CharcoalAsset.Images.Inline.contextMenuAsset
        case .externalInline:
          return CharcoalAsset.Images.Inline.externalAsset
        case .filterInline:
          return CharcoalAsset.Images.Inline.filterAsset
        case .folderInline:
          return CharcoalAsset.Images.Inline.folderAsset
        case .imageResponseInline:
          return CharcoalAsset.Images.Inline.imageResponseAsset
        case .imagesInline:
          return CharcoalAsset.Images.Inline.imagesAsset
        case .latestInline:
          return CharcoalAsset.Images.Inline.latestAsset
        case .likeInline:
          return CharcoalAsset.Images.Inline.likeAsset
        case .likeOffInline:
          return CharcoalAsset.Images.Inline.likeOffAsset
        case .listInline:
          return CharcoalAsset.Images.Inline.listAsset
        case .locationInline:
          return CharcoalAsset.Images.Inline.locationAsset
        case .lockInline:
          return CharcoalAsset.Images.Inline.lockAsset
        case .moreInline:
          return CharcoalAsset.Images.Inline.moreAsset
        case .multiSelectInline:
          return CharcoalAsset.Images.Inline.multiSelectAsset
        case .nextworksInline:
          return CharcoalAsset.Images.Inline.nextworksAsset
        case .openInNewInline:
          return CharcoalAsset.Images.Inline.openInNewAsset
        case .pencilInline:
          return CharcoalAsset.Images.Inline.pencilAsset
        case .removeInline:
          return CharcoalAsset.Images.Inline.removeAsset
        case .smileInline:
          return CharcoalAsset.Images.Inline.smileAsset
        case .smileOnInline:
          return CharcoalAsset.Images.Inline.smileOnAsset
        case .trashInline:
          return CharcoalAsset.Images.Inline.trashAsset
        case .usersInline:
          return CharcoalAsset.Images.Inline.usersAsset
        case .viewInline:
          return CharcoalAsset.Images.Inline.viewAsset
        case .viewOutlineInline:
          return CharcoalAsset.Images.Inline.viewOutlineAsset
      }
    }
    public var image: ImageAsset.Image {
      return imageAsset.image
    }
  }
  public enum ImagesV2 : CaseIterable {
    public enum _16 : CaseIterable {
      public enum Regular : CaseIterable {
        public static let arrowLeftDownAsset = ImageAsset(name: "16/regular/arrow.left-down")
        public static let chevronDownAsset = ImageAsset(name: "16/regular/chevron.down")
        public static let chevronLeftAsset = ImageAsset(name: "16/regular/chevron.left")
        public static let chevronRightAsset = ImageAsset(name: "16/regular/chevron.right")
        public static let chevronUpAsset = ImageAsset(name: "16/regular/chevron.up")
      }
      public enum Solid : CaseIterable {
        public static let arrowLeftDownAsset = ImageAsset(name: "16/solid/arrow.left-down")
        public static let chevronDownAsset = ImageAsset(name: "16/solid/chevron.down")
        public static let chevronLeftAsset = ImageAsset(name: "16/solid/chevron.left")
        public static let chevronRightAsset = ImageAsset(name: "16/solid/chevron.right")
        public static let chevronUpAsset = ImageAsset(name: "16/solid/chevron.up")
      }
    }
    public enum _20 : CaseIterable {
      public enum Regular : CaseIterable {
        public static let xAsset = ImageAsset(name: "20/regular/x")
      }
      public enum Solid : CaseIterable {
        public static let xAsset = ImageAsset(name: "20/solid/x")
      }
    }
    public enum _24 : CaseIterable {
      public enum Color : CaseIterable {
        public static let colorMixtureAsset = ImageAsset(name: "24/color/color-mixture")
      }
      public enum Regular : CaseIterable {
        public static let addCircleAsset = ImageAsset(name: "24/regular/add.circle")
        public static let addAsset = ImageAsset(name: "24/regular/add")
        public static let airbrushAsset = ImageAsset(name: "24/regular/airbrush")
        public static let albumAddAsset = ImageAsset(name: "24/regular/album.add")
        public static let albumAsset = ImageAsset(name: "24/regular/album")
        public static let alertAsset = ImageAsset(name: "24/regular/alert")
        public static let alignHorizontalAsset = ImageAsset(name: "24/regular/align.horizontal")
        public static let alignVerticalAsset = ImageAsset(name: "24/regular/align.vertical")
        public static let angleAsset = ImageAsset(name: "24/regular/angle")
        public static let announceAsset = ImageAsset(name: "24/regular/announce")
        public static let applePencilAsset = ImageAsset(name: "24/regular/apple-pencil")
        public static let arAsset = ImageAsset(name: "24/regular/ar")
        public static let archiveAsset = ImageAsset(name: "24/regular/archive")
        public static let arrowCcwAsset = ImageAsset(name: "24/regular/arrow.ccw")
        public static let arrowDownAsset = ImageAsset(name: "24/regular/arrow.down")
        public static let arrowDownSquareAsset = ImageAsset(name: "24/regular/arrow.down.square")
        public static let arrowLeftDownAsset = ImageAsset(name: "24/regular/arrow.left-down")
        public static let arrowLeftAsset = ImageAsset(name: "24/regular/arrow.left")
        public static let arrowLeftSquareAsset = ImageAsset(name: "24/regular/arrow.left.square")
        public static let arrowRightAsset = ImageAsset(name: "24/regular/arrow.right")
        public static let arrowUpAsset = ImageAsset(name: "24/regular/arrow.up")
        public static let autoSelectAsset = ImageAsset(name: "24/regular/auto-select")
        public static let bellAsset = ImageAsset(name: "24/regular/bell")
        public static let bezierCurveAsset = ImageAsset(name: "24/regular/bezier-curve")
        public static let blendModeAsset = ImageAsset(name: "24/regular/blend-mode")
        public static let bodyAddAsset = ImageAsset(name: "24/regular/body.add")
        public static let bodyEditAsset = ImageAsset(name: "24/regular/body.edit")
        public static let bodyAsset = ImageAsset(name: "24/regular/body")
        public static let boldAsset = ImageAsset(name: "24/regular/bold")
        public static let bookAsset = ImageAsset(name: "24/regular/book")
        public static let bookmarkAsset = ImageAsset(name: "24/regular/bookmark")
        public static let bringBackwardAsset = ImageAsset(name: "24/regular/bring.backward")
        public static let bringForwardAsset = ImageAsset(name: "24/regular/bring.forward")
        public static let brushDecorationAsset = ImageAsset(name: "24/regular/brush.decoration")
        public static let brushAsset = ImageAsset(name: "24/regular/brush")
        public static let brushOpacityAsset = ImageAsset(name: "24/regular/brush.opacity")
        public static let brushPressAsset = ImageAsset(name: "24/regular/brush.press")
        public static let brushSizeAsset = ImageAsset(name: "24/regular/brush.size")
        public static let brushStablizeAsset = ImageAsset(name: "24/regular/brush.stablize")
        public static let bubbleAsset = ImageAsset(name: "24/regular/bubble")
        public static let bulbShineAsset = ImageAsset(name: "24/regular/bulb.shine")
        public static let calendarAsset = ImageAsset(name: "24/regular/calendar")
        public static let cameraAsset = ImageAsset(name: "24/regular/camera")
        public static let characterReplaceAsset = ImageAsset(name: "24/regular/character.replace")
        public static let checkCircleAsset = ImageAsset(name: "24/regular/check.circle")
        public static let checkAsset = ImageAsset(name: "24/regular/check")
        public static let chevronDownAsset = ImageAsset(name: "24/regular/chevron.down")
        public static let chevronLeftAsset = ImageAsset(name: "24/regular/chevron.left")
        public static let chevronRightAsset = ImageAsset(name: "24/regular/chevron.right")
        public static let chevronUpAsset = ImageAsset(name: "24/regular/chevron.up")
        public static let circleAsset = ImageAsset(name: "24/regular/circle")
        public static let clickAsset = ImageAsset(name: "24/regular/click")
        public static let clippingAsset = ImageAsset(name: "24/regular/clipping")
        public static let cloudCheckAsset = ImageAsset(name: "24/regular/cloud.check")
        public static let cloudExclamationAsset = ImageAsset(name: "24/regular/cloud.exclamation")
        public static let cloudAsset = ImageAsset(name: "24/regular/cloud")
        public static let cloudSyncAsset = ImageAsset(name: "24/regular/cloud.sync")
        public static let codeAsset = ImageAsset(name: "24/regular/code")
        public static let colorSetsAsset = ImageAsset(name: "24/regular/color-sets")
        public static let colorWheelRectangleAsset = ImageAsset(name: "24/regular/color-wheel.rectangle")
        public static let colorWheelTriangleAsset = ImageAsset(name: "24/regular/color-wheel.triangle")
        public static let colorAsset = ImageAsset(name: "24/regular/color")
        public static let commandsCircleAsset = ImageAsset(name: "24/regular/commands.circle")
        public static let compassAsset = ImageAsset(name: "24/regular/compass")
        public static let contestAsset = ImageAsset(name: "24/regular/contest")
        public static let contrastAsset = ImageAsset(name: "24/regular/contrast")
        public static let copyAsset = ImageAsset(name: "24/regular/copy")
        public static let crownAsset = ImageAsset(name: "24/regular/crown")
        public static let curveAsset = ImageAsset(name: "24/regular/curve")
        public static let curveNodesAsset = ImageAsset(name: "24/regular/curve.nodes")
        public static let deleteAsset = ImageAsset(name: "24/regular/delete")
        public static let deviceAsset = ImageAsset(name: "24/regular/device")
        public static let deviceRotateAsset = ImageAsset(name: "24/regular/device.rotate")
        public static let dialAsset = ImageAsset(name: "24/regular/dial")
        public static let distortionAsset = ImageAsset(name: "24/regular/distortion")
        public static let dotsHorizontalCircleAsset = ImageAsset(name: "24/regular/dots.horizontal.circle")
        public static let dotsHorizontalAsset = ImageAsset(name: "24/regular/dots.horizontal")
        public static let dotsVerticalCircleAsset = ImageAsset(name: "24/regular/dots.vertical.circle")
        public static let dotsVerticalAsset = ImageAsset(name: "24/regular/dots.vertical")
        public static let downloadAsset = ImageAsset(name: "24/regular/download")
        public static let downloadIosAsset = ImageAsset(name: "24/regular/download.ios")
        public static let dropperAsset = ImageAsset(name: "24/regular/dropper")
        public static let duplicateAsset = ImageAsset(name: "24/regular/duplicate")
        public static let emojiAsset = ImageAsset(name: "24/regular/emoji")
        public static let eraserAsset = ImageAsset(name: "24/regular/eraser")
        public static let expandAsset = ImageAsset(name: "24/regular/expand")
        public static let eyeClosedAsset = ImageAsset(name: "24/regular/eye.closed")
        public static let eyeAsset = ImageAsset(name: "24/regular/eye")
        public static let eyeOffAsset = ImageAsset(name: "24/regular/eye.off")
        public static let faceAsset = ImageAsset(name: "24/regular/face")
        public static let feedAsset = ImageAsset(name: "24/regular/feed")
        public static let fileAddAsset = ImageAsset(name: "24/regular/file.add")
        public static let fileExportAsset = ImageAsset(name: "24/regular/file.export")
        public static let fileAsset = ImageAsset(name: "24/regular/file")
        public static let filePngAsset = ImageAsset(name: "24/regular/file.png")
        public static let filePsdAsset = ImageAsset(name: "24/regular/file.psd")
        public static let fileRestoreAsset = ImageAsset(name: "24/regular/file.restore")
        public static let fillAsset = ImageAsset(name: "24/regular/fill")
        public static let fillSquareAsset = ImageAsset(name: "24/regular/fill.square")
        public static let flameAsset = ImageAsset(name: "24/regular/flame")
        public static let flipHorizontalAsset = ImageAsset(name: "24/regular/flip.horizontal")
        public static let flipVerticalAsset = ImageAsset(name: "24/regular/flip.vertical")
        public static let folderAddAsset = ImageAsset(name: "24/regular/folder.add")
        public static let folderAsset = ImageAsset(name: "24/regular/folder")
        public static let folderOpenAsset = ImageAsset(name: "24/regular/folder.open")
        public static let fontSizeAsset = ImageAsset(name: "24/regular/font-size")
        public static let fovAsset = ImageAsset(name: "24/regular/fov")
        public static let frameAsset = ImageAsset(name: "24/regular/frame")
        public static let funnelAsset = ImageAsset(name: "24/regular/funnel")
        public static let giftAsset = ImageAsset(name: "24/regular/gift")
        public static let glowAsset = ImageAsset(name: "24/regular/glow")
        public static let gradientAsset = ImageAsset(name: "24/regular/gradient")
        public static let gridviewAsset = ImageAsset(name: "24/regular/gridview")
        public static let groupAsset = ImageAsset(name: "24/regular/group")
        public static let hairAsset = ImageAsset(name: "24/regular/hair")
        public static let hashTagAsset = ImageAsset(name: "24/regular/hash-tag")
        public static let heartAsset = ImageAsset(name: "24/regular/heart")
        public static let historyAsset = ImageAsset(name: "24/regular/history")
        public static let homeAsset = ImageAsset(name: "24/regular/home")
        public static let imageAddAsset = ImageAsset(name: "24/regular/image.add")
        public static let imageContainAsset = ImageAsset(name: "24/regular/image.contain")
        public static let imageCoverAsset = ImageAsset(name: "24/regular/image.cover")
        public static let imageEffectAsset = ImageAsset(name: "24/regular/image.effect")
        public static let imageAsset = ImageAsset(name: "24/regular/image")
        public static let imageOffAsset = ImageAsset(name: "24/regular/image.off")
        public static let imageReplaceAsset = ImageAsset(name: "24/regular/image.replace")
        public static let imagesAsset = ImageAsset(name: "24/regular/images")
        public static let infoCircleAsset = ImageAsset(name: "24/regular/info.circle")
        public static let invertSelectionAsset = ImageAsset(name: "24/regular/invert-selection")
        public static let invoiceAsset = ImageAsset(name: "24/regular/invoice")
        public static let italicAsset = ImageAsset(name: "24/regular/italic")
        public static let keyboardAsset = ImageAsset(name: "24/regular/keyboard")
        public static let lassoFillAsset = ImageAsset(name: "24/regular/lasso.fill")
        public static let lassoAsset = ImageAsset(name: "24/regular/lasso")
        public static let layerAddAsset = ImageAsset(name: "24/regular/layer.add")
        public static let layerImageMaterialAsset = ImageAsset(name: "24/regular/layer.image-material")
        public static let layerAsset = ImageAsset(name: "24/regular/layer")
        public static let layerMergeAsset = ImageAsset(name: "24/regular/layer.merge")
        public static let layerOpacityAsset = ImageAsset(name: "24/regular/layer.opacity")
        public static let layerSetReferenceAsset = ImageAsset(name: "24/regular/layer.set-reference")
        public static let layerSettingAsset = ImageAsset(name: "24/regular/layer.setting")
        public static let layerTextAsset = ImageAsset(name: "24/regular/layer.text")
        public static let layerVectorAsset = ImageAsset(name: "24/regular/layer.vector")
        public static let layoutAsset = ImageAsset(name: "24/regular/layout")
        public static let letterSpacingAsset = ImageAsset(name: "24/regular/letter-spacing")
        public static let lineSpacingAsset = ImageAsset(name: "24/regular/line-spacing")
        public static let lineAsset = ImageAsset(name: "24/regular/line")
        public static let lineNodesAsset = ImageAsset(name: "24/regular/line.nodes")
        public static let linkClearAsset = ImageAsset(name: "24/regular/link.clear")
        public static let linkAsset = ImageAsset(name: "24/regular/link")
        public static let listAsset = ImageAsset(name: "24/regular/list")
        public static let locationAsset = ImageAsset(name: "24/regular/location")
        public static let lockAsset = ImageAsset(name: "24/regular/lock")
        public static let logoutAsset = ImageAsset(name: "24/regular/logout")
        public static let mangaAsset = ImageAsset(name: "24/regular/manga")
        public static let maskAsset = ImageAsset(name: "24/regular/mask")
        public static let meshAsset = ImageAsset(name: "24/regular/mesh")
        public static let messageAsset = ImageAsset(name: "24/regular/message")
        public static let microphoneAsset = ImageAsset(name: "24/regular/microphone")
        public static let moveAsset = ImageAsset(name: "24/regular/move")
        public static let navigatorAsset = ImageAsset(name: "24/regular/navigator")
        public static let newPostAsset = ImageAsset(name: "24/regular/new-post")
        public static let novelAsset = ImageAsset(name: "24/regular/novel")
        public static let opacityAsset = ImageAsset(name: "24/regular/opacity")
        public static let opacityLockAsset = ImageAsset(name: "24/regular/opacity.lock")
        public static let openInNewAsset = ImageAsset(name: "24/regular/open-in-new")
        public static let outlineAsset = ImageAsset(name: "24/regular/outline")
        public static let paletteAsset = ImageAsset(name: "24/regular/palette")
        public static let pasteAsset = ImageAsset(name: "24/regular/paste")
        public static let pauseAsset = ImageAsset(name: "24/regular/pause")
        public static let penAddAsset = ImageAsset(name: "24/regular/pen.add")
        public static let penDrawAsset = ImageAsset(name: "24/regular/pen.draw")
        public static let penAsset = ImageAsset(name: "24/regular/pen")
        public static let penTextAsset = ImageAsset(name: "24/regular/pen.text")
        public static let personAddAsset = ImageAsset(name: "24/regular/person.add")
        public static let personCircleAsset = ImageAsset(name: "24/regular/person.circle")
        public static let personsAsset = ImageAsset(name: "24/regular/persons")
        public static let playAsset = ImageAsset(name: "24/regular/play")
        public static let polygonAsset = ImageAsset(name: "24/regular/polygon")
        public static let polylineAsset = ImageAsset(name: "24/regular/polyline")
        public static let polylineNodesAsset = ImageAsset(name: "24/regular/polyline.nodes")
        public static let poseAsset = ImageAsset(name: "24/regular/pose")
        public static let projectsAsset = ImageAsset(name: "24/regular/projects")
        public static let questionBubbleAsset = ImageAsset(name: "24/regular/question.bubble")
        public static let questionCircleAsset = ImageAsset(name: "24/regular/question.circle")
        public static let rabbitEarBentAsset = ImageAsset(name: "24/regular/rabbit.ear-bent")
        public static let rabbitAsset = ImageAsset(name: "24/regular/rabbit")
        public static let redoAsset = ImageAsset(name: "24/regular/redo")
        public static let renameAsset = ImageAsset(name: "24/regular/rename")
        public static let resolutionAsset = ImageAsset(name: "24/regular/resolution")
        public static let rotateCcwAsset = ImageAsset(name: "24/regular/rotate.ccw")
        public static let rotateCwAsset = ImageAsset(name: "24/regular/rotate.cw")
        public static let rotateAsset = ImageAsset(name: "24/regular/rotate")
        public static let rulerAsset = ImageAsset(name: "24/regular/ruler")
        public static let sansSerifAsset = ImageAsset(name: "24/regular/sans-serif")
        public static let saturationAsset = ImageAsset(name: "24/regular/saturation")
        public static let saveAsset = ImageAsset(name: "24/regular/save")
        public static let scatterAsset = ImageAsset(name: "24/regular/scatter")
        public static let scissorsAsset = ImageAsset(name: "24/regular/scissors")
        public static let searchAsset = ImageAsset(name: "24/regular/search")
        public static let selectClearAsset = ImageAsset(name: "24/regular/select.clear")
        public static let selectImageAsset = ImageAsset(name: "24/regular/select.image")
        public static let selectOffAsset = ImageAsset(name: "24/regular/select.off")
        public static let selectionsAsset = ImageAsset(name: "24/regular/selections")
        public static let sendAsset = ImageAsset(name: "24/regular/send")
        public static let settingAsset = ImageAsset(name: "24/regular/setting")
        public static let shapeAsset = ImageAsset(name: "24/regular/shape")
        public static let shareAndroidAsset = ImageAsset(name: "24/regular/share.android")
        public static let shareIosAsset = ImageAsset(name: "24/regular/share.ios")
        public static let shoppingAsset = ImageAsset(name: "24/regular/shopping")
        public static let shrinkAsset = ImageAsset(name: "24/regular/shrink")
        public static let shutterAsset = ImageAsset(name: "24/regular/shutter")
        public static let slidersAsset = ImageAsset(name: "24/regular/sliders")
        public static let softEdgeAsset = ImageAsset(name: "24/regular/soft-edge")
        public static let squareDashAsset = ImageAsset(name: "24/regular/square.dash")
        public static let squareDashResizeAsset = ImageAsset(name: "24/regular/square.dash.resize")
        public static let squareAsset = ImageAsset(name: "24/regular/square")
        public static let squares2x2Asset = ImageAsset(name: "24/regular/squares.2x2")
        public static let squares3x3Asset = ImageAsset(name: "24/regular/squares.3x3")
        public static let starAsset = ImageAsset(name: "24/regular/star")
        public static let strikeThroughAsset = ImageAsset(name: "24/regular/strike-through")
        public static let strokeTaperAsset = ImageAsset(name: "24/regular/stroke-taper")
        public static let strokeWidthAsset = ImageAsset(name: "24/regular/stroke-width")
        public static let subtractAsset = ImageAsset(name: "24/regular/subtract")
        public static let sunAsset = ImageAsset(name: "24/regular/sun")
        public static let syncCircleAsset = ImageAsset(name: "24/regular/sync.circle")
        public static let syncAsset = ImageAsset(name: "24/regular/sync")
        public static let tShirtAsset = ImageAsset(name: "24/regular/t-shirt")
        public static let tap1FingerAsset = ImageAsset(name: "24/regular/tap.1-finger")
        public static let tap2FingersAsset = ImageAsset(name: "24/regular/tap.2-fingers")
        public static let tap3FingersAsset = ImageAsset(name: "24/regular/tap.3-fingers")
        public static let temperatureAsset = ImageAsset(name: "24/regular/temperature")
        public static let textAlignCenterAsset = ImageAsset(name: "24/regular/text-align.center")
        public static let textAlignJustifyAsset = ImageAsset(name: "24/regular/text-align.justify")
        public static let textAlignLeftAsset = ImageAsset(name: "24/regular/text-align.left")
        public static let textAlignRightAsset = ImageAsset(name: "24/regular/text-align.right")
        public static let textRubyAsset = ImageAsset(name: "24/regular/text-ruby")
        public static let textAsset = ImageAsset(name: "24/regular/text")
        public static let textureAsset = ImageAsset(name: "24/regular/texture")
        public static let toolsAsset = ImageAsset(name: "24/regular/tools")
        public static let touchAsset = ImageAsset(name: "24/regular/touch")
        public static let transformAsset = ImageAsset(name: "24/regular/transform")
        public static let transformRotationHandleAsset = ImageAsset(name: "24/regular/transform.rotation-handle")
        public static let underlineAsset = ImageAsset(name: "24/regular/underline")
        public static let undoAsset = ImageAsset(name: "24/regular/undo")
        public static let uploadAsset = ImageAsset(name: "24/regular/upload")
        public static let userCampaignAsset = ImageAsset(name: "24/regular/user-campaign")
        public static let videoCameraAsset = ImageAsset(name: "24/regular/video-camera")
        public static let videoAsset = ImageAsset(name: "24/regular/video")
        public static let viewFitAsset = ImageAsset(name: "24/regular/view.fit")
        public static let viewFullAsset = ImageAsset(name: "24/regular/view.full")
        public static let warnAsset = ImageAsset(name: "24/regular/warn")
        public static let warnTriangleAsset = ImageAsset(name: "24/regular/warn.triangle")
        public static let xCircleAsset = ImageAsset(name: "24/regular/x.circle")
        public static let xAsset = ImageAsset(name: "24/regular/x")
        public static let xOctagonAsset = ImageAsset(name: "24/regular/x.octagon")
        public static let zoomInAsset = ImageAsset(name: "24/regular/zoom-in")
        public static let zoomOutAsset = ImageAsset(name: "24/regular/zoom-out")
      }
      public enum Solid : CaseIterable {
        public static let addCircleAsset = ImageAsset(name: "24/solid/add.circle")
        public static let addAsset = ImageAsset(name: "24/solid/add")
        public static let airbrushAsset = ImageAsset(name: "24/solid/airbrush")
        public static let albumAddAsset = ImageAsset(name: "24/solid/album.add")
        public static let albumAsset = ImageAsset(name: "24/solid/album")
        public static let alertAsset = ImageAsset(name: "24/solid/alert")
        public static let alignHorizontalAsset = ImageAsset(name: "24/solid/align.horizontal")
        public static let alignVerticalAsset = ImageAsset(name: "24/solid/align.vertical")
        public static let angleAsset = ImageAsset(name: "24/solid/angle")
        public static let announceAsset = ImageAsset(name: "24/solid/announce")
        public static let applePencilAsset = ImageAsset(name: "24/solid/apple-pencil")
        public static let arAsset = ImageAsset(name: "24/solid/ar")
        public static let archiveAsset = ImageAsset(name: "24/solid/archive")
        public static let arrowCcwAsset = ImageAsset(name: "24/solid/arrow.ccw")
        public static let arrowDownAsset = ImageAsset(name: "24/solid/arrow.down")
        public static let arrowDownSquareAsset = ImageAsset(name: "24/solid/arrow.down.square")
        public static let arrowLeftDownAsset = ImageAsset(name: "24/solid/arrow.left-down")
        public static let arrowLeftAsset = ImageAsset(name: "24/solid/arrow.left")
        public static let arrowLeftSquareAsset = ImageAsset(name: "24/solid/arrow.left.square")
        public static let arrowRightAsset = ImageAsset(name: "24/solid/arrow.right")
        public static let arrowUpAsset = ImageAsset(name: "24/solid/arrow.up")
        public static let autoSelectAsset = ImageAsset(name: "24/solid/auto-select")
        public static let bellAsset = ImageAsset(name: "24/solid/bell")
        public static let bezierCurveAsset = ImageAsset(name: "24/solid/bezier-curve")
        public static let blendModeAsset = ImageAsset(name: "24/solid/blend-mode")
        public static let bodyAddAsset = ImageAsset(name: "24/solid/body.add")
        public static let bodyEditAsset = ImageAsset(name: "24/solid/body.edit")
        public static let bodyAsset = ImageAsset(name: "24/solid/body")
        public static let boldAsset = ImageAsset(name: "24/solid/bold")
        public static let bookAsset = ImageAsset(name: "24/solid/book")
        public static let bookmarkAsset = ImageAsset(name: "24/solid/bookmark")
        public static let bringBackwardAsset = ImageAsset(name: "24/solid/bring.backward")
        public static let bringForwardAsset = ImageAsset(name: "24/solid/bring.forward")
        public static let brushDecorationAsset = ImageAsset(name: "24/solid/brush.decoration")
        public static let brushAsset = ImageAsset(name: "24/solid/brush")
        public static let brushOpacityAsset = ImageAsset(name: "24/solid/brush.opacity")
        public static let brushPressAsset = ImageAsset(name: "24/solid/brush.press")
        public static let brushSizeAsset = ImageAsset(name: "24/solid/brush.size")
        public static let brushStablizeAsset = ImageAsset(name: "24/solid/brush.stablize")
        public static let bubbleAsset = ImageAsset(name: "24/solid/bubble")
        public static let bulbShineAsset = ImageAsset(name: "24/solid/bulb.shine")
        public static let calendarAsset = ImageAsset(name: "24/solid/calendar")
        public static let cameraAsset = ImageAsset(name: "24/solid/camera")
        public static let characterReplaceAsset = ImageAsset(name: "24/solid/character.replace")
        public static let checkCircleAsset = ImageAsset(name: "24/solid/check.circle")
        public static let checkAsset = ImageAsset(name: "24/solid/check")
        public static let chevronDownAsset = ImageAsset(name: "24/solid/chevron.down")
        public static let chevronLeftAsset = ImageAsset(name: "24/solid/chevron.left")
        public static let chevronRightAsset = ImageAsset(name: "24/solid/chevron.right")
        public static let chevronUpAsset = ImageAsset(name: "24/solid/chevron.up")
        public static let circleAsset = ImageAsset(name: "24/solid/circle")
        public static let clickAsset = ImageAsset(name: "24/solid/click")
        public static let clippingAsset = ImageAsset(name: "24/solid/clipping")
        public static let cloudCheckAsset = ImageAsset(name: "24/solid/cloud.check")
        public static let cloudExclamationAsset = ImageAsset(name: "24/solid/cloud.exclamation")
        public static let cloudAsset = ImageAsset(name: "24/solid/cloud")
        public static let cloudSyncAsset = ImageAsset(name: "24/solid/cloud.sync")
        public static let codeAsset = ImageAsset(name: "24/solid/code")
        public static let colorSetsAsset = ImageAsset(name: "24/solid/color-sets")
        public static let colorWheelRectangleAsset = ImageAsset(name: "24/solid/color-wheel.rectangle")
        public static let colorWheelTriangleAsset = ImageAsset(name: "24/solid/color-wheel.triangle")
        public static let colorAsset = ImageAsset(name: "24/solid/color")
        public static let commandsCircleAsset = ImageAsset(name: "24/solid/commands.circle")
        public static let compassAsset = ImageAsset(name: "24/solid/compass")
        public static let contestAsset = ImageAsset(name: "24/solid/contest")
        public static let contrastAsset = ImageAsset(name: "24/solid/contrast")
        public static let copyAsset = ImageAsset(name: "24/solid/copy")
        public static let crownAsset = ImageAsset(name: "24/solid/crown")
        public static let curveAsset = ImageAsset(name: "24/solid/curve")
        public static let curveNodesAsset = ImageAsset(name: "24/solid/curve.nodes")
        public static let deleteAsset = ImageAsset(name: "24/solid/delete")
        public static let deviceAsset = ImageAsset(name: "24/solid/device")
        public static let deviceRotateAsset = ImageAsset(name: "24/solid/device.rotate")
        public static let dialAsset = ImageAsset(name: "24/solid/dial")
        public static let distortionAsset = ImageAsset(name: "24/solid/distortion")
        public static let dotsHorizontalCircleAsset = ImageAsset(name: "24/solid/dots.horizontal.circle")
        public static let dotsHorizontalAsset = ImageAsset(name: "24/solid/dots.horizontal")
        public static let dotsVerticalCircleAsset = ImageAsset(name: "24/solid/dots.vertical.circle")
        public static let dotsVerticalAsset = ImageAsset(name: "24/solid/dots.vertical")
        public static let downloadAsset = ImageAsset(name: "24/solid/download")
        public static let downloadIosAsset = ImageAsset(name: "24/solid/download.ios")
        public static let dropperAsset = ImageAsset(name: "24/solid/dropper")
        public static let duplicateAsset = ImageAsset(name: "24/solid/duplicate")
        public static let emojiAsset = ImageAsset(name: "24/solid/emoji")
        public static let eraserAsset = ImageAsset(name: "24/solid/eraser")
        public static let expandAsset = ImageAsset(name: "24/solid/expand")
        public static let eyeClosedAsset = ImageAsset(name: "24/solid/eye.closed")
        public static let eyeAsset = ImageAsset(name: "24/solid/eye")
        public static let eyeOffAsset = ImageAsset(name: "24/solid/eye.off")
        public static let faceAsset = ImageAsset(name: "24/solid/face")
        public static let feedAsset = ImageAsset(name: "24/solid/feed")
        public static let fileAddAsset = ImageAsset(name: "24/solid/file.add")
        public static let fileExportAsset = ImageAsset(name: "24/solid/file.export")
        public static let fileAsset = ImageAsset(name: "24/solid/file")
        public static let filePngAsset = ImageAsset(name: "24/solid/file.png")
        public static let filePsdAsset = ImageAsset(name: "24/solid/file.psd")
        public static let fileRestoreAsset = ImageAsset(name: "24/solid/file.restore")
        public static let fillAsset = ImageAsset(name: "24/solid/fill")
        public static let fillSquareAsset = ImageAsset(name: "24/solid/fill.square")
        public static let flameAsset = ImageAsset(name: "24/solid/flame")
        public static let flipHorizontalAsset = ImageAsset(name: "24/solid/flip.horizontal")
        public static let flipVerticalAsset = ImageAsset(name: "24/solid/flip.vertical")
        public static let folderAddAsset = ImageAsset(name: "24/solid/folder.add")
        public static let folderAsset = ImageAsset(name: "24/solid/folder")
        public static let folderOpenAsset = ImageAsset(name: "24/solid/folder.open")
        public static let fontSizeAsset = ImageAsset(name: "24/solid/font-size")
        public static let fovAsset = ImageAsset(name: "24/solid/fov")
        public static let frameAsset = ImageAsset(name: "24/solid/frame")
        public static let funnelAsset = ImageAsset(name: "24/solid/funnel")
        public static let giftAsset = ImageAsset(name: "24/solid/gift")
        public static let glowAsset = ImageAsset(name: "24/solid/glow")
        public static let gradientAsset = ImageAsset(name: "24/solid/gradient")
        public static let gridviewAsset = ImageAsset(name: "24/solid/gridview")
        public static let groupAsset = ImageAsset(name: "24/solid/group")
        public static let hairAsset = ImageAsset(name: "24/solid/hair")
        public static let hashTagAsset = ImageAsset(name: "24/solid/hash-tag")
        public static let heartAsset = ImageAsset(name: "24/solid/heart")
        public static let historyAsset = ImageAsset(name: "24/solid/history")
        public static let homeAsset = ImageAsset(name: "24/solid/home")
        public static let imageAddAsset = ImageAsset(name: "24/solid/image.add")
        public static let imageContainAsset = ImageAsset(name: "24/solid/image.contain")
        public static let imageCoverAsset = ImageAsset(name: "24/solid/image.cover")
        public static let imageEffectAsset = ImageAsset(name: "24/solid/image.effect")
        public static let imageAsset = ImageAsset(name: "24/solid/image")
        public static let imageOffAsset = ImageAsset(name: "24/solid/image.off")
        public static let imageReplaceAsset = ImageAsset(name: "24/solid/image.replace")
        public static let imagesAsset = ImageAsset(name: "24/solid/images")
        public static let infoCircleAsset = ImageAsset(name: "24/solid/info.circle")
        public static let invertSelectionAsset = ImageAsset(name: "24/solid/invert-selection")
        public static let invoiceAsset = ImageAsset(name: "24/solid/invoice")
        public static let italicAsset = ImageAsset(name: "24/solid/italic")
        public static let keyboardAsset = ImageAsset(name: "24/solid/keyboard")
        public static let lassoFillAsset = ImageAsset(name: "24/solid/lasso.fill")
        public static let lassoAsset = ImageAsset(name: "24/solid/lasso")
        public static let layerAddAsset = ImageAsset(name: "24/solid/layer.add")
        public static let layerImageMaterialAsset = ImageAsset(name: "24/solid/layer.image-material")
        public static let layerAsset = ImageAsset(name: "24/solid/layer")
        public static let layerMergeAsset = ImageAsset(name: "24/solid/layer.merge")
        public static let layerOpacityAsset = ImageAsset(name: "24/solid/layer.opacity")
        public static let layerSetReferenceAsset = ImageAsset(name: "24/solid/layer.set-reference")
        public static let layerSettingAsset = ImageAsset(name: "24/solid/layer.setting")
        public static let layerTextAsset = ImageAsset(name: "24/solid/layer.text")
        public static let layerVectorAsset = ImageAsset(name: "24/solid/layer.vector")
        public static let layoutAsset = ImageAsset(name: "24/solid/layout")
        public static let letterSpacingAsset = ImageAsset(name: "24/solid/letter-spacing")
        public static let lineSpacingAsset = ImageAsset(name: "24/solid/line-spacing")
        public static let lineAsset = ImageAsset(name: "24/solid/line")
        public static let lineNodesAsset = ImageAsset(name: "24/solid/line.nodes")
        public static let linkClearAsset = ImageAsset(name: "24/solid/link.clear")
        public static let linkAsset = ImageAsset(name: "24/solid/link")
        public static let listAsset = ImageAsset(name: "24/solid/list")
        public static let locationAsset = ImageAsset(name: "24/solid/location")
        public static let lockAsset = ImageAsset(name: "24/solid/lock")
        public static let logoutAsset = ImageAsset(name: "24/solid/logout")
        public static let mangaAsset = ImageAsset(name: "24/solid/manga")
        public static let maskAsset = ImageAsset(name: "24/solid/mask")
        public static let meshAsset = ImageAsset(name: "24/solid/mesh")
        public static let messageAsset = ImageAsset(name: "24/solid/message")
        public static let microphoneAsset = ImageAsset(name: "24/solid/microphone")
        public static let moveAsset = ImageAsset(name: "24/solid/move")
        public static let navigatorAsset = ImageAsset(name: "24/solid/navigator")
        public static let newPostAsset = ImageAsset(name: "24/solid/new-post")
        public static let novelAsset = ImageAsset(name: "24/solid/novel")
        public static let opacityAsset = ImageAsset(name: "24/solid/opacity")
        public static let opacityLockAsset = ImageAsset(name: "24/solid/opacity.lock")
        public static let openInNewAsset = ImageAsset(name: "24/solid/open-in-new")
        public static let outlineAsset = ImageAsset(name: "24/solid/outline")
        public static let paletteAsset = ImageAsset(name: "24/solid/palette")
        public static let pasteAsset = ImageAsset(name: "24/solid/paste")
        public static let pauseAsset = ImageAsset(name: "24/solid/pause")
        public static let penAddAsset = ImageAsset(name: "24/solid/pen.add")
        public static let penDrawAsset = ImageAsset(name: "24/solid/pen.draw")
        public static let penAsset = ImageAsset(name: "24/solid/pen")
        public static let penTextAsset = ImageAsset(name: "24/solid/pen.text")
        public static let personAddAsset = ImageAsset(name: "24/solid/person.add")
        public static let personCircleAsset = ImageAsset(name: "24/solid/person.circle")
        public static let personsAsset = ImageAsset(name: "24/solid/persons")
        public static let playAsset = ImageAsset(name: "24/solid/play")
        public static let polygonAsset = ImageAsset(name: "24/solid/polygon")
        public static let polylineAsset = ImageAsset(name: "24/solid/polyline")
        public static let polylineNodesAsset = ImageAsset(name: "24/solid/polyline.nodes")
        public static let poseAsset = ImageAsset(name: "24/solid/pose")
        public static let projectsAsset = ImageAsset(name: "24/solid/projects")
        public static let questionBubbleAsset = ImageAsset(name: "24/solid/question.bubble")
        public static let questionCircleAsset = ImageAsset(name: "24/solid/question.circle")
        public static let rabbitEarBentAsset = ImageAsset(name: "24/solid/rabbit.ear-bent")
        public static let rabbitAsset = ImageAsset(name: "24/solid/rabbit")
        public static let redoAsset = ImageAsset(name: "24/solid/redo")
        public static let renameAsset = ImageAsset(name: "24/solid/rename")
        public static let resolutionAsset = ImageAsset(name: "24/solid/resolution")
        public static let rotateCcwAsset = ImageAsset(name: "24/solid/rotate.ccw")
        public static let rotateCwAsset = ImageAsset(name: "24/solid/rotate.cw")
        public static let rotateAsset = ImageAsset(name: "24/solid/rotate")
        public static let rulerAsset = ImageAsset(name: "24/solid/ruler")
        public static let sansSerifAsset = ImageAsset(name: "24/solid/sans-serif")
        public static let saturationAsset = ImageAsset(name: "24/solid/saturation")
        public static let saveAsset = ImageAsset(name: "24/solid/save")
        public static let scatterAsset = ImageAsset(name: "24/solid/scatter")
        public static let scissorsAsset = ImageAsset(name: "24/solid/scissors")
        public static let searchAsset = ImageAsset(name: "24/solid/search")
        public static let selectClearAsset = ImageAsset(name: "24/solid/select.clear")
        public static let selectImageAsset = ImageAsset(name: "24/solid/select.image")
        public static let selectOffAsset = ImageAsset(name: "24/solid/select.off")
        public static let selectionsAsset = ImageAsset(name: "24/solid/selections")
        public static let sendAsset = ImageAsset(name: "24/solid/send")
        public static let settingAsset = ImageAsset(name: "24/solid/setting")
        public static let shapeAsset = ImageAsset(name: "24/solid/shape")
        public static let shareAndroidAsset = ImageAsset(name: "24/solid/share.android")
        public static let shareIosAsset = ImageAsset(name: "24/solid/share.ios")
        public static let shoppingAsset = ImageAsset(name: "24/solid/shopping")
        public static let shrinkAsset = ImageAsset(name: "24/solid/shrink")
        public static let shutterAsset = ImageAsset(name: "24/solid/shutter")
        public static let slidersAsset = ImageAsset(name: "24/solid/sliders")
        public static let softEdgeAsset = ImageAsset(name: "24/solid/soft-edge")
        public static let squareDashAsset = ImageAsset(name: "24/solid/square.dash")
        public static let squareDashResizeAsset = ImageAsset(name: "24/solid/square.dash.resize")
        public static let squareAsset = ImageAsset(name: "24/solid/square")
        public static let squares2x2Asset = ImageAsset(name: "24/solid/squares.2x2")
        public static let squares3x3Asset = ImageAsset(name: "24/solid/squares.3x3")
        public static let starAsset = ImageAsset(name: "24/solid/star")
        public static let strikeThroughAsset = ImageAsset(name: "24/solid/strike-through")
        public static let strokeTaperAsset = ImageAsset(name: "24/solid/stroke-taper")
        public static let strokeWidthAsset = ImageAsset(name: "24/solid/stroke-width")
        public static let subtractAsset = ImageAsset(name: "24/solid/subtract")
        public static let sunAsset = ImageAsset(name: "24/solid/sun")
        public static let syncCircleAsset = ImageAsset(name: "24/solid/sync.circle")
        public static let syncAsset = ImageAsset(name: "24/solid/sync")
        public static let tShirtAsset = ImageAsset(name: "24/solid/t-shirt")
        public static let tap1FingerAsset = ImageAsset(name: "24/solid/tap.1-finger")
        public static let tap2FingersAsset = ImageAsset(name: "24/solid/tap.2-fingers")
        public static let tap3FingersAsset = ImageAsset(name: "24/solid/tap.3-fingers")
        public static let temperatureAsset = ImageAsset(name: "24/solid/temperature")
        public static let textAlignCenterAsset = ImageAsset(name: "24/solid/text-align.center")
        public static let textAlignJustifyAsset = ImageAsset(name: "24/solid/text-align.justify")
        public static let textAlignLeftAsset = ImageAsset(name: "24/solid/text-align.left")
        public static let textAlignRightAsset = ImageAsset(name: "24/solid/text-align.right")
        public static let textRubyAsset = ImageAsset(name: "24/solid/text-ruby")
        public static let textAsset = ImageAsset(name: "24/solid/text")
        public static let textureAsset = ImageAsset(name: "24/solid/texture")
        public static let toolsAsset = ImageAsset(name: "24/solid/tools")
        public static let touchAsset = ImageAsset(name: "24/solid/touch")
        public static let transformAsset = ImageAsset(name: "24/solid/transform")
        public static let transformRotationHandleAsset = ImageAsset(name: "24/solid/transform.rotation-handle")
        public static let underlineAsset = ImageAsset(name: "24/solid/underline")
        public static let undoAsset = ImageAsset(name: "24/solid/undo")
        public static let uploadAsset = ImageAsset(name: "24/solid/upload")
        public static let userCampaignAsset = ImageAsset(name: "24/solid/user-campaign")
        public static let videoCameraAsset = ImageAsset(name: "24/solid/video-camera")
        public static let videoAsset = ImageAsset(name: "24/solid/video")
        public static let viewFitAsset = ImageAsset(name: "24/solid/view.fit")
        public static let viewFullAsset = ImageAsset(name: "24/solid/view.full")
        public static let warnAsset = ImageAsset(name: "24/solid/warn")
        public static let warnTriangleAsset = ImageAsset(name: "24/solid/warn.triangle")
        public static let xCircleAsset = ImageAsset(name: "24/solid/x.circle")
        public static let xAsset = ImageAsset(name: "24/solid/x")
        public static let xOctagonAsset = ImageAsset(name: "24/solid/x.octagon")
        public static let zoomInAsset = ImageAsset(name: "24/solid/zoom-in")
        public static let zoomOutAsset = ImageAsset(name: "24/solid/zoom-out")
      }
    }
    case arrowLeftDownRegular16
    case chevronDownRegular16
    case chevronLeftRegular16
    case chevronRightRegular16
    case chevronUpRegular16
    case arrowLeftDownSolid16
    case chevronDownSolid16
    case chevronLeftSolid16
    case chevronRightSolid16
    case chevronUpSolid16
    case xRegular20
    case xSolid20
    case colorMixtureColor24
    case addCircleRegular24
    case addRegular24
    case airbrushRegular24
    case albumAddRegular24
    case albumRegular24
    case alertRegular24
    case alignHorizontalRegular24
    case alignVerticalRegular24
    case angleRegular24
    case announceRegular24
    case applePencilRegular24
    case arRegular24
    case archiveRegular24
    case arrowCcwRegular24
    case arrowDownRegular24
    case arrowDownSquareRegular24
    case arrowLeftDownRegular24
    case arrowLeftRegular24
    case arrowLeftSquareRegular24
    case arrowRightRegular24
    case arrowUpRegular24
    case autoSelectRegular24
    case bellRegular24
    case bezierCurveRegular24
    case blendModeRegular24
    case bodyAddRegular24
    case bodyEditRegular24
    case bodyRegular24
    case boldRegular24
    case bookRegular24
    case bookmarkRegular24
    case bringBackwardRegular24
    case bringForwardRegular24
    case brushDecorationRegular24
    case brushRegular24
    case brushOpacityRegular24
    case brushPressRegular24
    case brushSizeRegular24
    case brushStablizeRegular24
    case bubbleRegular24
    case bulbShineRegular24
    case calendarRegular24
    case cameraRegular24
    case characterReplaceRegular24
    case checkCircleRegular24
    case checkRegular24
    case chevronDownRegular24
    case chevronLeftRegular24
    case chevronRightRegular24
    case chevronUpRegular24
    case circleRegular24
    case clickRegular24
    case clippingRegular24
    case cloudCheckRegular24
    case cloudExclamationRegular24
    case cloudRegular24
    case cloudSyncRegular24
    case codeRegular24
    case colorSetsRegular24
    case colorWheelRectangleRegular24
    case colorWheelTriangleRegular24
    case colorRegular24
    case commandsCircleRegular24
    case compassRegular24
    case contestRegular24
    case contrastRegular24
    case copyRegular24
    case crownRegular24
    case curveRegular24
    case curveNodesRegular24
    case deleteRegular24
    case deviceRegular24
    case deviceRotateRegular24
    case dialRegular24
    case distortionRegular24
    case dotsHorizontalCircleRegular24
    case dotsHorizontalRegular24
    case dotsVerticalCircleRegular24
    case dotsVerticalRegular24
    case downloadRegular24
    case downloadIosRegular24
    case dropperRegular24
    case duplicateRegular24
    case emojiRegular24
    case eraserRegular24
    case expandRegular24
    case eyeClosedRegular24
    case eyeRegular24
    case eyeOffRegular24
    case faceRegular24
    case feedRegular24
    case fileAddRegular24
    case fileExportRegular24
    case fileRegular24
    case filePngRegular24
    case filePsdRegular24
    case fileRestoreRegular24
    case fillRegular24
    case fillSquareRegular24
    case flameRegular24
    case flipHorizontalRegular24
    case flipVerticalRegular24
    case folderAddRegular24
    case folderRegular24
    case folderOpenRegular24
    case fontSizeRegular24
    case fovRegular24
    case frameRegular24
    case funnelRegular24
    case giftRegular24
    case glowRegular24
    case gradientRegular24
    case gridviewRegular24
    case groupRegular24
    case hairRegular24
    case hashTagRegular24
    case heartRegular24
    case historyRegular24
    case homeRegular24
    case imageAddRegular24
    case imageContainRegular24
    case imageCoverRegular24
    case imageEffectRegular24
    case imageRegular24
    case imageOffRegular24
    case imageReplaceRegular24
    case imagesRegular24
    case infoCircleRegular24
    case invertSelectionRegular24
    case invoiceRegular24
    case italicRegular24
    case keyboardRegular24
    case lassoFillRegular24
    case lassoRegular24
    case layerAddRegular24
    case layerImageMaterialRegular24
    case layerRegular24
    case layerMergeRegular24
    case layerOpacityRegular24
    case layerSetReferenceRegular24
    case layerSettingRegular24
    case layerTextRegular24
    case layerVectorRegular24
    case layoutRegular24
    case letterSpacingRegular24
    case lineSpacingRegular24
    case lineRegular24
    case lineNodesRegular24
    case linkClearRegular24
    case linkRegular24
    case listRegular24
    case locationRegular24
    case lockRegular24
    case logoutRegular24
    case mangaRegular24
    case maskRegular24
    case meshRegular24
    case messageRegular24
    case microphoneRegular24
    case moveRegular24
    case navigatorRegular24
    case newPostRegular24
    case novelRegular24
    case opacityRegular24
    case opacityLockRegular24
    case openInNewRegular24
    case outlineRegular24
    case paletteRegular24
    case pasteRegular24
    case pauseRegular24
    case penAddRegular24
    case penDrawRegular24
    case penRegular24
    case penTextRegular24
    case personAddRegular24
    case personCircleRegular24
    case personsRegular24
    case playRegular24
    case polygonRegular24
    case polylineRegular24
    case polylineNodesRegular24
    case poseRegular24
    case projectsRegular24
    case questionBubbleRegular24
    case questionCircleRegular24
    case rabbitEarBentRegular24
    case rabbitRegular24
    case redoRegular24
    case renameRegular24
    case resolutionRegular24
    case rotateCcwRegular24
    case rotateCwRegular24
    case rotateRegular24
    case rulerRegular24
    case sansSerifRegular24
    case saturationRegular24
    case saveRegular24
    case scatterRegular24
    case scissorsRegular24
    case searchRegular24
    case selectClearRegular24
    case selectImageRegular24
    case selectOffRegular24
    case selectionsRegular24
    case sendRegular24
    case settingRegular24
    case shapeRegular24
    case shareAndroidRegular24
    case shareIosRegular24
    case shoppingRegular24
    case shrinkRegular24
    case shutterRegular24
    case slidersRegular24
    case softEdgeRegular24
    case squareDashRegular24
    case squareDashResizeRegular24
    case squareRegular24
    case squares2x2Regular24
    case squares3x3Regular24
    case starRegular24
    case strikeThroughRegular24
    case strokeTaperRegular24
    case strokeWidthRegular24
    case subtractRegular24
    case sunRegular24
    case syncCircleRegular24
    case syncRegular24
    case tShirtRegular24
    case tap1FingerRegular24
    case tap2FingersRegular24
    case tap3FingersRegular24
    case temperatureRegular24
    case textAlignCenterRegular24
    case textAlignJustifyRegular24
    case textAlignLeftRegular24
    case textAlignRightRegular24
    case textRubyRegular24
    case textRegular24
    case textureRegular24
    case toolsRegular24
    case touchRegular24
    case transformRegular24
    case transformRotationHandleRegular24
    case underlineRegular24
    case undoRegular24
    case uploadRegular24
    case userCampaignRegular24
    case videoCameraRegular24
    case videoRegular24
    case viewFitRegular24
    case viewFullRegular24
    case warnRegular24
    case warnTriangleRegular24
    case xCircleRegular24
    case xRegular24
    case xOctagonRegular24
    case zoomInRegular24
    case zoomOutRegular24
    case addCircleSolid24
    case addSolid24
    case airbrushSolid24
    case albumAddSolid24
    case albumSolid24
    case alertSolid24
    case alignHorizontalSolid24
    case alignVerticalSolid24
    case angleSolid24
    case announceSolid24
    case applePencilSolid24
    case arSolid24
    case archiveSolid24
    case arrowCcwSolid24
    case arrowDownSolid24
    case arrowDownSquareSolid24
    case arrowLeftDownSolid24
    case arrowLeftSolid24
    case arrowLeftSquareSolid24
    case arrowRightSolid24
    case arrowUpSolid24
    case autoSelectSolid24
    case bellSolid24
    case bezierCurveSolid24
    case blendModeSolid24
    case bodyAddSolid24
    case bodyEditSolid24
    case bodySolid24
    case boldSolid24
    case bookSolid24
    case bookmarkSolid24
    case bringBackwardSolid24
    case bringForwardSolid24
    case brushDecorationSolid24
    case brushSolid24
    case brushOpacitySolid24
    case brushPressSolid24
    case brushSizeSolid24
    case brushStablizeSolid24
    case bubbleSolid24
    case bulbShineSolid24
    case calendarSolid24
    case cameraSolid24
    case characterReplaceSolid24
    case checkCircleSolid24
    case checkSolid24
    case chevronDownSolid24
    case chevronLeftSolid24
    case chevronRightSolid24
    case chevronUpSolid24
    case circleSolid24
    case clickSolid24
    case clippingSolid24
    case cloudCheckSolid24
    case cloudExclamationSolid24
    case cloudSolid24
    case cloudSyncSolid24
    case codeSolid24
    case colorSetsSolid24
    case colorWheelRectangleSolid24
    case colorWheelTriangleSolid24
    case colorSolid24
    case commandsCircleSolid24
    case compassSolid24
    case contestSolid24
    case contrastSolid24
    case copySolid24
    case crownSolid24
    case curveSolid24
    case curveNodesSolid24
    case deleteSolid24
    case deviceSolid24
    case deviceRotateSolid24
    case dialSolid24
    case distortionSolid24
    case dotsHorizontalCircleSolid24
    case dotsHorizontalSolid24
    case dotsVerticalCircleSolid24
    case dotsVerticalSolid24
    case downloadSolid24
    case downloadIosSolid24
    case dropperSolid24
    case duplicateSolid24
    case emojiSolid24
    case eraserSolid24
    case expandSolid24
    case eyeClosedSolid24
    case eyeSolid24
    case eyeOffSolid24
    case faceSolid24
    case feedSolid24
    case fileAddSolid24
    case fileExportSolid24
    case fileSolid24
    case filePngSolid24
    case filePsdSolid24
    case fileRestoreSolid24
    case fillSolid24
    case fillSquareSolid24
    case flameSolid24
    case flipHorizontalSolid24
    case flipVerticalSolid24
    case folderAddSolid24
    case folderSolid24
    case folderOpenSolid24
    case fontSizeSolid24
    case fovSolid24
    case frameSolid24
    case funnelSolid24
    case giftSolid24
    case glowSolid24
    case gradientSolid24
    case gridviewSolid24
    case groupSolid24
    case hairSolid24
    case hashTagSolid24
    case heartSolid24
    case historySolid24
    case homeSolid24
    case imageAddSolid24
    case imageContainSolid24
    case imageCoverSolid24
    case imageEffectSolid24
    case imageSolid24
    case imageOffSolid24
    case imageReplaceSolid24
    case imagesSolid24
    case infoCircleSolid24
    case invertSelectionSolid24
    case invoiceSolid24
    case italicSolid24
    case keyboardSolid24
    case lassoFillSolid24
    case lassoSolid24
    case layerAddSolid24
    case layerImageMaterialSolid24
    case layerSolid24
    case layerMergeSolid24
    case layerOpacitySolid24
    case layerSetReferenceSolid24
    case layerSettingSolid24
    case layerTextSolid24
    case layerVectorSolid24
    case layoutSolid24
    case letterSpacingSolid24
    case lineSpacingSolid24
    case lineSolid24
    case lineNodesSolid24
    case linkClearSolid24
    case linkSolid24
    case listSolid24
    case locationSolid24
    case lockSolid24
    case logoutSolid24
    case mangaSolid24
    case maskSolid24
    case meshSolid24
    case messageSolid24
    case microphoneSolid24
    case moveSolid24
    case navigatorSolid24
    case newPostSolid24
    case novelSolid24
    case opacitySolid24
    case opacityLockSolid24
    case openInNewSolid24
    case outlineSolid24
    case paletteSolid24
    case pasteSolid24
    case pauseSolid24
    case penAddSolid24
    case penDrawSolid24
    case penSolid24
    case penTextSolid24
    case personAddSolid24
    case personCircleSolid24
    case personsSolid24
    case playSolid24
    case polygonSolid24
    case polylineSolid24
    case polylineNodesSolid24
    case poseSolid24
    case projectsSolid24
    case questionBubbleSolid24
    case questionCircleSolid24
    case rabbitEarBentSolid24
    case rabbitSolid24
    case redoSolid24
    case renameSolid24
    case resolutionSolid24
    case rotateCcwSolid24
    case rotateCwSolid24
    case rotateSolid24
    case rulerSolid24
    case sansSerifSolid24
    case saturationSolid24
    case saveSolid24
    case scatterSolid24
    case scissorsSolid24
    case searchSolid24
    case selectClearSolid24
    case selectImageSolid24
    case selectOffSolid24
    case selectionsSolid24
    case sendSolid24
    case settingSolid24
    case shapeSolid24
    case shareAndroidSolid24
    case shareIosSolid24
    case shoppingSolid24
    case shrinkSolid24
    case shutterSolid24
    case slidersSolid24
    case softEdgeSolid24
    case squareDashSolid24
    case squareDashResizeSolid24
    case squareSolid24
    case squares2x2Solid24
    case squares3x3Solid24
    case starSolid24
    case strikeThroughSolid24
    case strokeTaperSolid24
    case strokeWidthSolid24
    case subtractSolid24
    case sunSolid24
    case syncCircleSolid24
    case syncSolid24
    case tShirtSolid24
    case tap1FingerSolid24
    case tap2FingersSolid24
    case tap3FingersSolid24
    case temperatureSolid24
    case textAlignCenterSolid24
    case textAlignJustifySolid24
    case textAlignLeftSolid24
    case textAlignRightSolid24
    case textRubySolid24
    case textSolid24
    case textureSolid24
    case toolsSolid24
    case touchSolid24
    case transformSolid24
    case transformRotationHandleSolid24
    case underlineSolid24
    case undoSolid24
    case uploadSolid24
    case userCampaignSolid24
    case videoCameraSolid24
    case videoSolid24
    case viewFitSolid24
    case viewFullSolid24
    case warnSolid24
    case warnTriangleSolid24
    case xCircleSolid24
    case xSolid24
    case xOctagonSolid24
    case zoomInSolid24
    case zoomOutSolid24
    public var imageAsset: ImageAsset {
      switch (self) {
        case .arrowLeftDownRegular16:
          return CharcoalAsset.ImagesV2._16.Regular.arrowLeftDownAsset
        case .chevronDownRegular16:
          return CharcoalAsset.ImagesV2._16.Regular.chevronDownAsset
        case .chevronLeftRegular16:
          return CharcoalAsset.ImagesV2._16.Regular.chevronLeftAsset
        case .chevronRightRegular16:
          return CharcoalAsset.ImagesV2._16.Regular.chevronRightAsset
        case .chevronUpRegular16:
          return CharcoalAsset.ImagesV2._16.Regular.chevronUpAsset
        case .arrowLeftDownSolid16:
          return CharcoalAsset.ImagesV2._16.Solid.arrowLeftDownAsset
        case .chevronDownSolid16:
          return CharcoalAsset.ImagesV2._16.Solid.chevronDownAsset
        case .chevronLeftSolid16:
          return CharcoalAsset.ImagesV2._16.Solid.chevronLeftAsset
        case .chevronRightSolid16:
          return CharcoalAsset.ImagesV2._16.Solid.chevronRightAsset
        case .chevronUpSolid16:
          return CharcoalAsset.ImagesV2._16.Solid.chevronUpAsset
        case .xRegular20:
          return CharcoalAsset.ImagesV2._20.Regular.xAsset
        case .xSolid20:
          return CharcoalAsset.ImagesV2._20.Solid.xAsset
        case .colorMixtureColor24:
          return CharcoalAsset.ImagesV2._24.Color.colorMixtureAsset
        case .addCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.addCircleAsset
        case .addRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.addAsset
        case .airbrushRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.airbrushAsset
        case .albumAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.albumAddAsset
        case .albumRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.albumAsset
        case .alertRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.alertAsset
        case .alignHorizontalRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.alignHorizontalAsset
        case .alignVerticalRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.alignVerticalAsset
        case .angleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.angleAsset
        case .announceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.announceAsset
        case .applePencilRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.applePencilAsset
        case .arRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arAsset
        case .archiveRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.archiveAsset
        case .arrowCcwRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowCcwAsset
        case .arrowDownRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowDownAsset
        case .arrowDownSquareRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowDownSquareAsset
        case .arrowLeftDownRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowLeftDownAsset
        case .arrowLeftRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowLeftAsset
        case .arrowLeftSquareRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowLeftSquareAsset
        case .arrowRightRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowRightAsset
        case .arrowUpRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.arrowUpAsset
        case .autoSelectRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.autoSelectAsset
        case .bellRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bellAsset
        case .bezierCurveRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bezierCurveAsset
        case .blendModeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.blendModeAsset
        case .bodyAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bodyAddAsset
        case .bodyEditRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bodyEditAsset
        case .bodyRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bodyAsset
        case .boldRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.boldAsset
        case .bookRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bookAsset
        case .bookmarkRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bookmarkAsset
        case .bringBackwardRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bringBackwardAsset
        case .bringForwardRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bringForwardAsset
        case .brushDecorationRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.brushDecorationAsset
        case .brushRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.brushAsset
        case .brushOpacityRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.brushOpacityAsset
        case .brushPressRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.brushPressAsset
        case .brushSizeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.brushSizeAsset
        case .brushStablizeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.brushStablizeAsset
        case .bubbleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bubbleAsset
        case .bulbShineRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.bulbShineAsset
        case .calendarRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.calendarAsset
        case .cameraRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.cameraAsset
        case .characterReplaceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.characterReplaceAsset
        case .checkCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.checkCircleAsset
        case .checkRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.checkAsset
        case .chevronDownRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.chevronDownAsset
        case .chevronLeftRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.chevronLeftAsset
        case .chevronRightRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.chevronRightAsset
        case .chevronUpRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.chevronUpAsset
        case .circleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.circleAsset
        case .clickRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.clickAsset
        case .clippingRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.clippingAsset
        case .cloudCheckRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.cloudCheckAsset
        case .cloudExclamationRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.cloudExclamationAsset
        case .cloudRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.cloudAsset
        case .cloudSyncRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.cloudSyncAsset
        case .codeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.codeAsset
        case .colorSetsRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.colorSetsAsset
        case .colorWheelRectangleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.colorWheelRectangleAsset
        case .colorWheelTriangleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.colorWheelTriangleAsset
        case .colorRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.colorAsset
        case .commandsCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.commandsCircleAsset
        case .compassRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.compassAsset
        case .contestRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.contestAsset
        case .contrastRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.contrastAsset
        case .copyRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.copyAsset
        case .crownRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.crownAsset
        case .curveRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.curveAsset
        case .curveNodesRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.curveNodesAsset
        case .deleteRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.deleteAsset
        case .deviceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.deviceAsset
        case .deviceRotateRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.deviceRotateAsset
        case .dialRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.dialAsset
        case .distortionRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.distortionAsset
        case .dotsHorizontalCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.dotsHorizontalCircleAsset
        case .dotsHorizontalRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.dotsHorizontalAsset
        case .dotsVerticalCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.dotsVerticalCircleAsset
        case .dotsVerticalRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.dotsVerticalAsset
        case .downloadRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.downloadAsset
        case .downloadIosRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.downloadIosAsset
        case .dropperRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.dropperAsset
        case .duplicateRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.duplicateAsset
        case .emojiRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.emojiAsset
        case .eraserRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.eraserAsset
        case .expandRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.expandAsset
        case .eyeClosedRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.eyeClosedAsset
        case .eyeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.eyeAsset
        case .eyeOffRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.eyeOffAsset
        case .faceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.faceAsset
        case .feedRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.feedAsset
        case .fileAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fileAddAsset
        case .fileExportRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fileExportAsset
        case .fileRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fileAsset
        case .filePngRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.filePngAsset
        case .filePsdRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.filePsdAsset
        case .fileRestoreRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fileRestoreAsset
        case .fillRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fillAsset
        case .fillSquareRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fillSquareAsset
        case .flameRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.flameAsset
        case .flipHorizontalRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.flipHorizontalAsset
        case .flipVerticalRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.flipVerticalAsset
        case .folderAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.folderAddAsset
        case .folderRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.folderAsset
        case .folderOpenRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.folderOpenAsset
        case .fontSizeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fontSizeAsset
        case .fovRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.fovAsset
        case .frameRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.frameAsset
        case .funnelRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.funnelAsset
        case .giftRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.giftAsset
        case .glowRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.glowAsset
        case .gradientRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.gradientAsset
        case .gridviewRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.gridviewAsset
        case .groupRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.groupAsset
        case .hairRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.hairAsset
        case .hashTagRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.hashTagAsset
        case .heartRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.heartAsset
        case .historyRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.historyAsset
        case .homeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.homeAsset
        case .imageAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageAddAsset
        case .imageContainRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageContainAsset
        case .imageCoverRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageCoverAsset
        case .imageEffectRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageEffectAsset
        case .imageRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageAsset
        case .imageOffRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageOffAsset
        case .imageReplaceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imageReplaceAsset
        case .imagesRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.imagesAsset
        case .infoCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.infoCircleAsset
        case .invertSelectionRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.invertSelectionAsset
        case .invoiceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.invoiceAsset
        case .italicRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.italicAsset
        case .keyboardRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.keyboardAsset
        case .lassoFillRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.lassoFillAsset
        case .lassoRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.lassoAsset
        case .layerAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerAddAsset
        case .layerImageMaterialRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerImageMaterialAsset
        case .layerRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerAsset
        case .layerMergeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerMergeAsset
        case .layerOpacityRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerOpacityAsset
        case .layerSetReferenceRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerSetReferenceAsset
        case .layerSettingRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerSettingAsset
        case .layerTextRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerTextAsset
        case .layerVectorRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layerVectorAsset
        case .layoutRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.layoutAsset
        case .letterSpacingRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.letterSpacingAsset
        case .lineSpacingRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.lineSpacingAsset
        case .lineRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.lineAsset
        case .lineNodesRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.lineNodesAsset
        case .linkClearRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.linkClearAsset
        case .linkRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.linkAsset
        case .listRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.listAsset
        case .locationRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.locationAsset
        case .lockRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.lockAsset
        case .logoutRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.logoutAsset
        case .mangaRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.mangaAsset
        case .maskRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.maskAsset
        case .meshRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.meshAsset
        case .messageRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.messageAsset
        case .microphoneRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.microphoneAsset
        case .moveRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.moveAsset
        case .navigatorRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.navigatorAsset
        case .newPostRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.newPostAsset
        case .novelRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.novelAsset
        case .opacityRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.opacityAsset
        case .opacityLockRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.opacityLockAsset
        case .openInNewRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.openInNewAsset
        case .outlineRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.outlineAsset
        case .paletteRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.paletteAsset
        case .pasteRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.pasteAsset
        case .pauseRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.pauseAsset
        case .penAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.penAddAsset
        case .penDrawRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.penDrawAsset
        case .penRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.penAsset
        case .penTextRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.penTextAsset
        case .personAddRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.personAddAsset
        case .personCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.personCircleAsset
        case .personsRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.personsAsset
        case .playRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.playAsset
        case .polygonRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.polygonAsset
        case .polylineRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.polylineAsset
        case .polylineNodesRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.polylineNodesAsset
        case .poseRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.poseAsset
        case .projectsRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.projectsAsset
        case .questionBubbleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.questionBubbleAsset
        case .questionCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.questionCircleAsset
        case .rabbitEarBentRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.rabbitEarBentAsset
        case .rabbitRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.rabbitAsset
        case .redoRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.redoAsset
        case .renameRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.renameAsset
        case .resolutionRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.resolutionAsset
        case .rotateCcwRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.rotateCcwAsset
        case .rotateCwRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.rotateCwAsset
        case .rotateRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.rotateAsset
        case .rulerRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.rulerAsset
        case .sansSerifRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.sansSerifAsset
        case .saturationRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.saturationAsset
        case .saveRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.saveAsset
        case .scatterRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.scatterAsset
        case .scissorsRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.scissorsAsset
        case .searchRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.searchAsset
        case .selectClearRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.selectClearAsset
        case .selectImageRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.selectImageAsset
        case .selectOffRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.selectOffAsset
        case .selectionsRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.selectionsAsset
        case .sendRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.sendAsset
        case .settingRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.settingAsset
        case .shapeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.shapeAsset
        case .shareAndroidRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.shareAndroidAsset
        case .shareIosRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.shareIosAsset
        case .shoppingRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.shoppingAsset
        case .shrinkRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.shrinkAsset
        case .shutterRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.shutterAsset
        case .slidersRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.slidersAsset
        case .softEdgeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.softEdgeAsset
        case .squareDashRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.squareDashAsset
        case .squareDashResizeRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.squareDashResizeAsset
        case .squareRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.squareAsset
        case .squares2x2Regular24:
          return CharcoalAsset.ImagesV2._24.Regular.squares2x2Asset
        case .squares3x3Regular24:
          return CharcoalAsset.ImagesV2._24.Regular.squares3x3Asset
        case .starRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.starAsset
        case .strikeThroughRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.strikeThroughAsset
        case .strokeTaperRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.strokeTaperAsset
        case .strokeWidthRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.strokeWidthAsset
        case .subtractRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.subtractAsset
        case .sunRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.sunAsset
        case .syncCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.syncCircleAsset
        case .syncRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.syncAsset
        case .tShirtRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.tShirtAsset
        case .tap1FingerRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.tap1FingerAsset
        case .tap2FingersRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.tap2FingersAsset
        case .tap3FingersRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.tap3FingersAsset
        case .temperatureRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.temperatureAsset
        case .textAlignCenterRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textAlignCenterAsset
        case .textAlignJustifyRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textAlignJustifyAsset
        case .textAlignLeftRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textAlignLeftAsset
        case .textAlignRightRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textAlignRightAsset
        case .textRubyRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textRubyAsset
        case .textRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textAsset
        case .textureRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.textureAsset
        case .toolsRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.toolsAsset
        case .touchRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.touchAsset
        case .transformRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.transformAsset
        case .transformRotationHandleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.transformRotationHandleAsset
        case .underlineRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.underlineAsset
        case .undoRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.undoAsset
        case .uploadRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.uploadAsset
        case .userCampaignRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.userCampaignAsset
        case .videoCameraRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.videoCameraAsset
        case .videoRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.videoAsset
        case .viewFitRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.viewFitAsset
        case .viewFullRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.viewFullAsset
        case .warnRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.warnAsset
        case .warnTriangleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.warnTriangleAsset
        case .xCircleRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.xCircleAsset
        case .xRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.xAsset
        case .xOctagonRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.xOctagonAsset
        case .zoomInRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.zoomInAsset
        case .zoomOutRegular24:
          return CharcoalAsset.ImagesV2._24.Regular.zoomOutAsset
        case .addCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.addCircleAsset
        case .addSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.addAsset
        case .airbrushSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.airbrushAsset
        case .albumAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.albumAddAsset
        case .albumSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.albumAsset
        case .alertSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.alertAsset
        case .alignHorizontalSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.alignHorizontalAsset
        case .alignVerticalSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.alignVerticalAsset
        case .angleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.angleAsset
        case .announceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.announceAsset
        case .applePencilSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.applePencilAsset
        case .arSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arAsset
        case .archiveSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.archiveAsset
        case .arrowCcwSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowCcwAsset
        case .arrowDownSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowDownAsset
        case .arrowDownSquareSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowDownSquareAsset
        case .arrowLeftDownSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowLeftDownAsset
        case .arrowLeftSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowLeftAsset
        case .arrowLeftSquareSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowLeftSquareAsset
        case .arrowRightSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowRightAsset
        case .arrowUpSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.arrowUpAsset
        case .autoSelectSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.autoSelectAsset
        case .bellSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bellAsset
        case .bezierCurveSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bezierCurveAsset
        case .blendModeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.blendModeAsset
        case .bodyAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bodyAddAsset
        case .bodyEditSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bodyEditAsset
        case .bodySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bodyAsset
        case .boldSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.boldAsset
        case .bookSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bookAsset
        case .bookmarkSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bookmarkAsset
        case .bringBackwardSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bringBackwardAsset
        case .bringForwardSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bringForwardAsset
        case .brushDecorationSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.brushDecorationAsset
        case .brushSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.brushAsset
        case .brushOpacitySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.brushOpacityAsset
        case .brushPressSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.brushPressAsset
        case .brushSizeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.brushSizeAsset
        case .brushStablizeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.brushStablizeAsset
        case .bubbleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bubbleAsset
        case .bulbShineSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.bulbShineAsset
        case .calendarSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.calendarAsset
        case .cameraSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.cameraAsset
        case .characterReplaceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.characterReplaceAsset
        case .checkCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.checkCircleAsset
        case .checkSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.checkAsset
        case .chevronDownSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.chevronDownAsset
        case .chevronLeftSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.chevronLeftAsset
        case .chevronRightSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.chevronRightAsset
        case .chevronUpSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.chevronUpAsset
        case .circleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.circleAsset
        case .clickSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.clickAsset
        case .clippingSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.clippingAsset
        case .cloudCheckSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.cloudCheckAsset
        case .cloudExclamationSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.cloudExclamationAsset
        case .cloudSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.cloudAsset
        case .cloudSyncSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.cloudSyncAsset
        case .codeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.codeAsset
        case .colorSetsSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.colorSetsAsset
        case .colorWheelRectangleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.colorWheelRectangleAsset
        case .colorWheelTriangleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.colorWheelTriangleAsset
        case .colorSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.colorAsset
        case .commandsCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.commandsCircleAsset
        case .compassSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.compassAsset
        case .contestSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.contestAsset
        case .contrastSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.contrastAsset
        case .copySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.copyAsset
        case .crownSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.crownAsset
        case .curveSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.curveAsset
        case .curveNodesSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.curveNodesAsset
        case .deleteSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.deleteAsset
        case .deviceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.deviceAsset
        case .deviceRotateSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.deviceRotateAsset
        case .dialSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.dialAsset
        case .distortionSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.distortionAsset
        case .dotsHorizontalCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.dotsHorizontalCircleAsset
        case .dotsHorizontalSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.dotsHorizontalAsset
        case .dotsVerticalCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.dotsVerticalCircleAsset
        case .dotsVerticalSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.dotsVerticalAsset
        case .downloadSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.downloadAsset
        case .downloadIosSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.downloadIosAsset
        case .dropperSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.dropperAsset
        case .duplicateSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.duplicateAsset
        case .emojiSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.emojiAsset
        case .eraserSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.eraserAsset
        case .expandSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.expandAsset
        case .eyeClosedSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.eyeClosedAsset
        case .eyeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.eyeAsset
        case .eyeOffSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.eyeOffAsset
        case .faceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.faceAsset
        case .feedSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.feedAsset
        case .fileAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fileAddAsset
        case .fileExportSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fileExportAsset
        case .fileSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fileAsset
        case .filePngSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.filePngAsset
        case .filePsdSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.filePsdAsset
        case .fileRestoreSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fileRestoreAsset
        case .fillSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fillAsset
        case .fillSquareSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fillSquareAsset
        case .flameSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.flameAsset
        case .flipHorizontalSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.flipHorizontalAsset
        case .flipVerticalSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.flipVerticalAsset
        case .folderAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.folderAddAsset
        case .folderSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.folderAsset
        case .folderOpenSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.folderOpenAsset
        case .fontSizeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fontSizeAsset
        case .fovSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.fovAsset
        case .frameSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.frameAsset
        case .funnelSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.funnelAsset
        case .giftSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.giftAsset
        case .glowSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.glowAsset
        case .gradientSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.gradientAsset
        case .gridviewSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.gridviewAsset
        case .groupSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.groupAsset
        case .hairSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.hairAsset
        case .hashTagSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.hashTagAsset
        case .heartSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.heartAsset
        case .historySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.historyAsset
        case .homeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.homeAsset
        case .imageAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageAddAsset
        case .imageContainSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageContainAsset
        case .imageCoverSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageCoverAsset
        case .imageEffectSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageEffectAsset
        case .imageSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageAsset
        case .imageOffSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageOffAsset
        case .imageReplaceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imageReplaceAsset
        case .imagesSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.imagesAsset
        case .infoCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.infoCircleAsset
        case .invertSelectionSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.invertSelectionAsset
        case .invoiceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.invoiceAsset
        case .italicSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.italicAsset
        case .keyboardSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.keyboardAsset
        case .lassoFillSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.lassoFillAsset
        case .lassoSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.lassoAsset
        case .layerAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerAddAsset
        case .layerImageMaterialSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerImageMaterialAsset
        case .layerSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerAsset
        case .layerMergeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerMergeAsset
        case .layerOpacitySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerOpacityAsset
        case .layerSetReferenceSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerSetReferenceAsset
        case .layerSettingSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerSettingAsset
        case .layerTextSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerTextAsset
        case .layerVectorSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layerVectorAsset
        case .layoutSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.layoutAsset
        case .letterSpacingSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.letterSpacingAsset
        case .lineSpacingSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.lineSpacingAsset
        case .lineSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.lineAsset
        case .lineNodesSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.lineNodesAsset
        case .linkClearSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.linkClearAsset
        case .linkSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.linkAsset
        case .listSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.listAsset
        case .locationSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.locationAsset
        case .lockSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.lockAsset
        case .logoutSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.logoutAsset
        case .mangaSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.mangaAsset
        case .maskSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.maskAsset
        case .meshSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.meshAsset
        case .messageSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.messageAsset
        case .microphoneSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.microphoneAsset
        case .moveSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.moveAsset
        case .navigatorSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.navigatorAsset
        case .newPostSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.newPostAsset
        case .novelSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.novelAsset
        case .opacitySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.opacityAsset
        case .opacityLockSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.opacityLockAsset
        case .openInNewSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.openInNewAsset
        case .outlineSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.outlineAsset
        case .paletteSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.paletteAsset
        case .pasteSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.pasteAsset
        case .pauseSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.pauseAsset
        case .penAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.penAddAsset
        case .penDrawSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.penDrawAsset
        case .penSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.penAsset
        case .penTextSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.penTextAsset
        case .personAddSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.personAddAsset
        case .personCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.personCircleAsset
        case .personsSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.personsAsset
        case .playSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.playAsset
        case .polygonSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.polygonAsset
        case .polylineSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.polylineAsset
        case .polylineNodesSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.polylineNodesAsset
        case .poseSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.poseAsset
        case .projectsSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.projectsAsset
        case .questionBubbleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.questionBubbleAsset
        case .questionCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.questionCircleAsset
        case .rabbitEarBentSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.rabbitEarBentAsset
        case .rabbitSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.rabbitAsset
        case .redoSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.redoAsset
        case .renameSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.renameAsset
        case .resolutionSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.resolutionAsset
        case .rotateCcwSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.rotateCcwAsset
        case .rotateCwSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.rotateCwAsset
        case .rotateSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.rotateAsset
        case .rulerSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.rulerAsset
        case .sansSerifSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.sansSerifAsset
        case .saturationSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.saturationAsset
        case .saveSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.saveAsset
        case .scatterSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.scatterAsset
        case .scissorsSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.scissorsAsset
        case .searchSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.searchAsset
        case .selectClearSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.selectClearAsset
        case .selectImageSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.selectImageAsset
        case .selectOffSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.selectOffAsset
        case .selectionsSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.selectionsAsset
        case .sendSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.sendAsset
        case .settingSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.settingAsset
        case .shapeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.shapeAsset
        case .shareAndroidSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.shareAndroidAsset
        case .shareIosSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.shareIosAsset
        case .shoppingSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.shoppingAsset
        case .shrinkSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.shrinkAsset
        case .shutterSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.shutterAsset
        case .slidersSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.slidersAsset
        case .softEdgeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.softEdgeAsset
        case .squareDashSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.squareDashAsset
        case .squareDashResizeSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.squareDashResizeAsset
        case .squareSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.squareAsset
        case .squares2x2Solid24:
          return CharcoalAsset.ImagesV2._24.Solid.squares2x2Asset
        case .squares3x3Solid24:
          return CharcoalAsset.ImagesV2._24.Solid.squares3x3Asset
        case .starSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.starAsset
        case .strikeThroughSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.strikeThroughAsset
        case .strokeTaperSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.strokeTaperAsset
        case .strokeWidthSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.strokeWidthAsset
        case .subtractSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.subtractAsset
        case .sunSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.sunAsset
        case .syncCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.syncCircleAsset
        case .syncSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.syncAsset
        case .tShirtSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.tShirtAsset
        case .tap1FingerSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.tap1FingerAsset
        case .tap2FingersSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.tap2FingersAsset
        case .tap3FingersSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.tap3FingersAsset
        case .temperatureSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.temperatureAsset
        case .textAlignCenterSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textAlignCenterAsset
        case .textAlignJustifySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textAlignJustifyAsset
        case .textAlignLeftSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textAlignLeftAsset
        case .textAlignRightSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textAlignRightAsset
        case .textRubySolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textRubyAsset
        case .textSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textAsset
        case .textureSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.textureAsset
        case .toolsSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.toolsAsset
        case .touchSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.touchAsset
        case .transformSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.transformAsset
        case .transformRotationHandleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.transformRotationHandleAsset
        case .underlineSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.underlineAsset
        case .undoSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.undoAsset
        case .uploadSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.uploadAsset
        case .userCampaignSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.userCampaignAsset
        case .videoCameraSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.videoCameraAsset
        case .videoSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.videoAsset
        case .viewFitSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.viewFitAsset
        case .viewFullSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.viewFullAsset
        case .warnSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.warnAsset
        case .warnTriangleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.warnTriangleAsset
        case .xCircleSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.xCircleAsset
        case .xSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.xAsset
        case .xOctagonSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.xOctagonAsset
        case .zoomInSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.zoomInAsset
        case .zoomOutSolid24:
          return CharcoalAsset.ImagesV2._24.Solid.zoomOutAsset
      }
    }
    public var image: ImageAsset.Image {
      return imageAsset.image
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
