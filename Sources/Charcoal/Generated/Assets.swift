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
  public enum ColorPaletteGenerated {
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
          return CharcoalAsset.ColorPaletteGenerated.assertiveAsset
        case .background1:
          return CharcoalAsset.ColorPaletteGenerated.background1Asset
        case .background2:
          return CharcoalAsset.ColorPaletteGenerated.background2Asset
        case .border:
          return CharcoalAsset.ColorPaletteGenerated.borderAsset
        case .brand:
          return CharcoalAsset.ColorPaletteGenerated.brandAsset
        case .callToAction0:
          return CharcoalAsset.ColorPaletteGenerated.callToAction0Asset
        case .callToAction100:
          return CharcoalAsset.ColorPaletteGenerated.callToAction100Asset
        case .icon6:
          return CharcoalAsset.ColorPaletteGenerated.icon6Asset
        case .link1:
          return CharcoalAsset.ColorPaletteGenerated.link1Asset
        case .link2:
          return CharcoalAsset.ColorPaletteGenerated.link2Asset
        case .success:
          return CharcoalAsset.ColorPaletteGenerated.successAsset
        case .surface1:
          return CharcoalAsset.ColorPaletteGenerated.surface1Asset
        case .surface10:
          return CharcoalAsset.ColorPaletteGenerated.surface10Asset
        case .surface2:
          return CharcoalAsset.ColorPaletteGenerated.surface2Asset
        case .surface3:
          return CharcoalAsset.ColorPaletteGenerated.surface3Asset
        case .surface4:
          return CharcoalAsset.ColorPaletteGenerated.surface4Asset
        case .surface50:
          return CharcoalAsset.ColorPaletteGenerated.surface50Asset
        case .surface5100:
          return CharcoalAsset.ColorPaletteGenerated.surface5100Asset
        case .surface6:
          return CharcoalAsset.ColorPaletteGenerated.surface6Asset
        case .surface7:
          return CharcoalAsset.ColorPaletteGenerated.surface7Asset
        case .surface8:
          return CharcoalAsset.ColorPaletteGenerated.surface8Asset
        case .surface9:
          return CharcoalAsset.ColorPaletteGenerated.surface9Asset
        case .text1:
          return CharcoalAsset.ColorPaletteGenerated.text1Asset
        case .text2:
          return CharcoalAsset.ColorPaletteGenerated.text2Asset
        case .text3:
          return CharcoalAsset.ColorPaletteGenerated.text3Asset
        case .text4:
          return CharcoalAsset.ColorPaletteGenerated.text4Asset
        case .text5:
          return CharcoalAsset.ColorPaletteGenerated.text5Asset
        case .transparent:
          return CharcoalAsset.ColorPaletteGenerated.transparentAsset
        case .updatedItem:
          return CharcoalAsset.ColorPaletteGenerated.updatedItemAsset
        case .warning:
          return CharcoalAsset.ColorPaletteGenerated.warningAsset
      }
    }
    public var color: UIColor {
      return colorAsset.color
    }
  }
  public enum Images {
    public enum _16 {
      public static let add = ImageAsset(name: "16/Add")
      public static let arrowDown = ImageAsset(name: "16/ArrowDown")
      public static let artwork = ImageAsset(name: "16/Artwork")
      public static let back = ImageAsset(name: "16/Back")
      public static let book = ImageAsset(name: "16/Book")
      public static let bookmarkOff = ImageAsset(name: "16/BookmarkOff")
      public static let bookmarkOn = ImageAsset(name: "16/BookmarkOn")
      public static let check = ImageAsset(name: "16/Check")
      public static let comment = ImageAsset(name: "16/Comment")
      public static let dot = ImageAsset(name: "16/Dot")
      public static let error = ImageAsset(name: "16/Error")
      public static let filter = ImageAsset(name: "16/Filter")
      public static let imageResponse = ImageAsset(name: "16/ImageResponse")
      public static let info = ImageAsset(name: "16/Info")
      public static let like = ImageAsset(name: "16/Like")
      public static let menu = ImageAsset(name: "16/Menu")
      public static let more = ImageAsset(name: "16/More")
      public static let pencil = ImageAsset(name: "16/Pencil")
      public static let question = ImageAsset(name: "16/Question")
      public static let ranking = ImageAsset(name: "16/Ranking")
      public static let remove = ImageAsset(name: "16/Remove")
      public static let search = ImageAsset(name: "16/Search")
      public static let smile = ImageAsset(name: "16/Smile")
      public static let speaker = ImageAsset(name: "16/Speaker")
      public static let view = ImageAsset(name: "16/View")
    }
    public enum _24 {
      public static let add = ImageAsset(name: "24/Add")
      public static let addImage = ImageAsset(name: "24/AddImage")
      public static let addModel = ImageAsset(name: "24/AddModel")
      public static let addPeople = ImageAsset(name: "24/AddPeople")
      public static let addRubi = ImageAsset(name: "24/AddRubi")
      public static let addText = ImageAsset(name: "24/AddText")
      public static let alart = ImageAsset(name: "24/Alart")
      public static let announcement = ImageAsset(name: "24/Announcement")
      public static let ar = ImageAsset(name: "24/Ar")
      public static let archive = ImageAsset(name: "24/Archive")
      public static let arrowDown = ImageAsset(name: "24/ArrowDown")
      public static let arrowUp = ImageAsset(name: "24/ArrowUp")
      public static let binet = ImageAsset(name: "24/Binet")
      public static let body = ImageAsset(name: "24/Body")
      public static let bodyEdit = ImageAsset(name: "24/BodyEdit")
      public static let book = ImageAsset(name: "24/Book")
      public static let bringBackward = ImageAsset(name: "24/BringBackward")
      public static let bringForward = ImageAsset(name: "24/BringForward")
      public static let calendar = ImageAsset(name: "24/Calendar")
      public static let camera = ImageAsset(name: "24/Camera")
      public static let cameraVideo = ImageAsset(name: "24/CameraVideo")
      public static let changeCharactor = ImageAsset(name: "24/ChangeCharactor")
      public static let chatBot = ImageAsset(name: "24/ChatBot")
      public static let check = ImageAsset(name: "24/Check")
      public static let chromaticAberration = ImageAsset(name: "24/ChromaticAberration")
      public static let close = ImageAsset(name: "24/Close")
      public static let codes = ImageAsset(name: "24/Codes")
      public static let collapse = ImageAsset(name: "24/Collapse")
      public static let commentFill = ImageAsset(name: "24/CommentFill")
      public static let commentOutline = ImageAsset(name: "24/CommentOutline")
      public static let contest = ImageAsset(name: "24/Contest")
      public static let contrast = ImageAsset(name: "24/Contrast")
      public static let description = ImageAsset(name: "24/Description")
      public static let deviceRotation = ImageAsset(name: "24/DeviceRotation")
      public static let discovery = ImageAsset(name: "24/Discovery")
      public static let dot = ImageAsset(name: "24/Dot")
      public static let dotAlt = ImageAsset(name: "24/DotAlt")
      public static let down = ImageAsset(name: "24/Down")
      public static let downloadAlt = ImageAsset(name: "24/DownloadAlt")
      public static let duplicate = ImageAsset(name: "24/Duplicate")
      public static let dust = ImageAsset(name: "24/Dust")
      public static let emoji = ImageAsset(name: "24/Emoji")
      public static let error = ImageAsset(name: "24/Error")
      public static let errorOctagon = ImageAsset(name: "24/ErrorOctagon")
      public static let events = ImageAsset(name: "24/Events")
      public static let expand = ImageAsset(name: "24/Expand")
      public static let faceEdit = ImageAsset(name: "24/FaceEdit")
      public static let fashion = ImageAsset(name: "24/Fashion")
      public static let feed = ImageAsset(name: "24/Feed")
      public static let file = ImageAsset(name: "24/File")
      public static let filter = ImageAsset(name: "24/Filter")
      public static let flare = ImageAsset(name: "24/Flare")
      public static let formatAlignCenter = ImageAsset(name: "24/FormatAlignCenter")
      public static let formatAlignLeft = ImageAsset(name: "24/FormatAlignLeft")
      public static let formatAlignRight = ImageAsset(name: "24/FormatAlignRight")
      public static let formatColorFill = ImageAsset(name: "24/FormatColorFill")
      public static let formatColorFillNoColor = ImageAsset(name: "24/FormatColorFillNoColor")
      public static let formatFontFamily = ImageAsset(name: "24/FormatFontFamily")
      public static let formatFontSize = ImageAsset(name: "24/FormatFontSize")
      public static let formatLetterSpacing = ImageAsset(name: "24/FormatLetterSpacing")
      public static let formatLineSpacing = ImageAsset(name: "24/FormatLineSpacing")
      public static let fov = ImageAsset(name: "24/Fov")
      public static let frameEffect = ImageAsset(name: "24/FrameEffect")
      public static let frameSize = ImageAsset(name: "24/FrameSize")
      public static let gift = ImageAsset(name: "24/Gift")
      public static let glow = ImageAsset(name: "24/Glow")
      public static let groups = ImageAsset(name: "24/Groups")
      public static let hairEdit = ImageAsset(name: "24/HairEdit")
      public static let hashtag = ImageAsset(name: "24/Hashtag")
      public static let hide = ImageAsset(name: "24/Hide")
      public static let home = ImageAsset(name: "24/Home")
      public static let hue = ImageAsset(name: "24/Hue")
      public static let idea = ImageAsset(name: "24/Idea")
      public static let image = ImageAsset(name: "24/Image")
      public static let imageAlt = ImageAsset(name: "24/ImageAlt")
      public static let imageHidden = ImageAsset(name: "24/ImageHidden")
      public static let imageReplace = ImageAsset(name: "24/ImageReplace")
      public static let images = ImageAsset(name: "24/Images")
      public static let imgContain = ImageAsset(name: "24/ImgContain")
      public static let imgCover = ImageAsset(name: "24/ImgCover")
      public static let index = ImageAsset(name: "24/Index")
      public static let info = ImageAsset(name: "24/Info")
      public static let invalid = ImageAsset(name: "24/Invalid")
      public static let invoice = ImageAsset(name: "24/Invoice")
      public static let itemRemove = ImageAsset(name: "24/ItemRemove")
      public static let latestWorks = ImageAsset(name: "24/LatestWorks")
      public static let likeOff = ImageAsset(name: "24/LikeOff")
      public static let likeOn = ImageAsset(name: "24/LikeOn")
      public static let link = ImageAsset(name: "24/Link")
      public static let list = ImageAsset(name: "24/List")
      public static let lockLock = ImageAsset(name: "24/LockLock")
      public static let lockUnlock = ImageAsset(name: "24/LockUnlock")
      public static let logout = ImageAsset(name: "24/Logout")
      public static let manga = ImageAsset(name: "24/Manga")
      public static let menu = ImageAsset(name: "24/Menu")
      public static let message = ImageAsset(name: "24/Message")
      public static let microphone = ImageAsset(name: "24/Microphone")
      public static let mobilePhone = ImageAsset(name: "24/MobilePhone")
      public static let move1 = ImageAsset(name: "24/Move1")
      public static let next = ImageAsset(name: "24/Next")
      public static let noImage = ImageAsset(name: "24/NoImage")
      public static let notification = ImageAsset(name: "24/Notification")
      public static let notificationOff = ImageAsset(name: "24/NotificationOff")
      public static let novels = ImageAsset(name: "24/Novels")
      public static let openInNew = ImageAsset(name: "24/OpenInNew")
      public static let options = ImageAsset(name: "24/Options")
      public static let optionsAlt = ImageAsset(name: "24/OptionsAlt")
      public static let overlay = ImageAsset(name: "24/Overlay")
      public static let palette = ImageAsset(name: "24/Palette")
      public static let pause = ImageAsset(name: "24/Pause")
      public static let pauseAlt = ImageAsset(name: "24/PauseAlt")
      public static let pencil = ImageAsset(name: "24/Pencil")
      public static let pencilDraw = ImageAsset(name: "24/PencilDraw")
      public static let pencilLive = ImageAsset(name: "24/PencilLive")
      public static let pencilText = ImageAsset(name: "24/PencilText")
      public static let person = ImageAsset(name: "24/Person")
      public static let play = ImageAsset(name: "24/Play")
      public static let pose = ImageAsset(name: "24/Pose")
      public static let prev = ImageAsset(name: "24/Prev")
      public static let projects = ImageAsset(name: "24/Projects")
      public static let pullDown = ImageAsset(name: "24/PullDown")
      public static let pullUp = ImageAsset(name: "24/PullUp")
      public static let question = ImageAsset(name: "24/Question")
      public static let questionOutline = ImageAsset(name: "24/QuestionOutline")
      public static let ranking = ImageAsset(name: "24/Ranking")
      public static let readHorizontalLeft = ImageAsset(name: "24/ReadHorizontalLeft")
      public static let readHorizontalRight = ImageAsset(name: "24/ReadHorizontalRight")
      public static let readVertical = ImageAsset(name: "24/ReadVertical")
      public static let reload = ImageAsset(name: "24/Reload")
      public static let reloadLoop = ImageAsset(name: "24/ReloadLoop")
      public static let reorder = ImageAsset(name: "24/Reorder")
      public static let roll = ImageAsset(name: "24/Roll")
      public static let rotate90DegreesC = ImageAsset(name: "24/Rotate90DegreesC")
      public static let rotate90DegreesCc = ImageAsset(name: "24/Rotate90DegreesCc")
      public static let rotateRight = ImageAsset(name: "24/RotateRight")
      public static let saturation = ImageAsset(name: "24/Saturation")
      public static let save = ImageAsset(name: "24/Save")
      public static let search = ImageAsset(name: "24/Search")
      public static let send = ImageAsset(name: "24/Send")
      public static let services = ImageAsset(name: "24/Services")
      public static let `set` = ImageAsset(name: "24/Set")
      public static let settings = ImageAsset(name: "24/Settings")
      public static let shareAndroid = ImageAsset(name: "24/ShareAndroid")
      public static let shareIos = ImageAsset(name: "24/ShareIos")
      public static let shopping = ImageAsset(name: "24/Shopping")
      public static let show = ImageAsset(name: "24/Show")
      public static let showOutline = ImageAsset(name: "24/ShowOutline")
      public static let shutter = ImageAsset(name: "24/Shutter")
      public static let star = ImageAsset(name: "24/Star")
      public static let subtract = ImageAsset(name: "24/Subtract")
      public static let sun = ImageAsset(name: "24/Sun")
      public static let temperature = ImageAsset(name: "24/Temperature")
      public static let text = ImageAsset(name: "24/Text")
      public static let trash = ImageAsset(name: "24/Trash")
      public static let trashAlt = ImageAsset(name: "24/TrashAlt")
      public static let up = ImageAsset(name: "24/Up")
      public static let upload = ImageAsset(name: "24/Upload")
      public static let uploadAlt = ImageAsset(name: "24/UploadAlt")
      public static let usagi = ImageAsset(name: "24/Usagi")
      public static let usagiAlt = ImageAsset(name: "24/UsagiAlt")
      public static let users = ImageAsset(name: "24/Users")
      public static let video = ImageAsset(name: "24/Video")
      public static let viewGrid2Columns = ImageAsset(name: "24/ViewGrid2Columns")
      public static let viewGrid3Columns = ImageAsset(name: "24/ViewGrid3Columns")
      public static let viewList = ImageAsset(name: "24/ViewList")
      public static let warning = ImageAsset(name: "24/Warning")
    }
    public enum _32 {
      public static let bookmarkOff = ImageAsset(name: "32/BookmarkOff")
      public static let bookmarkOn = ImageAsset(name: "32/BookmarkOn")
      public static let camera = ImageAsset(name: "32/Camera")
      public static let close = ImageAsset(name: "32/Close")
      public static let collapse = ImageAsset(name: "32/Collapse")
      public static let commentOff = ImageAsset(name: "32/CommentOff")
      public static let commentOn = ImageAsset(name: "32/CommentOn")
      public static let delete = ImageAsset(name: "32/Delete")
      public static let dot = ImageAsset(name: "32/Dot")
      public static let edit = ImageAsset(name: "32/Edit")
      public static let expand = ImageAsset(name: "32/Expand")
      public static let gift = ImageAsset(name: "32/Gift")
      public static let home = ImageAsset(name: "32/Home")
      public static let horizontalWriting = ImageAsset(name: "32/HorizontalWriting")
      public static let index = ImageAsset(name: "32/Index")
      public static let likeOff = ImageAsset(name: "32/LikeOff")
      public static let likeOn = ImageAsset(name: "32/LikeOn")
      public static let likeOnPrivate = ImageAsset(name: "32/LikeOnPrivate")
      public static let message = ImageAsset(name: "32/Message")
      public static let next = ImageAsset(name: "32/Next")
      public static let notification = ImageAsset(name: "32/Notification")
      public static let notificationOff = ImageAsset(name: "32/NotificationOff")
      public static let novelViewerSettings = ImageAsset(name: "32/NovelViewerSettings")
      public static let pan = ImageAsset(name: "32/Pan")
      public static let prev = ImageAsset(name: "32/Prev")
      public static let pullDown = ImageAsset(name: "32/PullDown")
      public static let pullUp = ImageAsset(name: "32/PullUp")
      public static let readHorizontalLeft = ImageAsset(name: "32/ReadHorizontalLeft")
      public static let readHorizontalRight = ImageAsset(name: "32/ReadHorizontalRight")
      public static let readVertical = ImageAsset(name: "32/ReadVertical")
      public static let rollHorizontal = ImageAsset(name: "32/RollHorizontal")
      public static let rollVertical = ImageAsset(name: "32/RollVertical")
      public static let sansSerif = ImageAsset(name: "32/SansSerif")
      public static let serif = ImageAsset(name: "32/Serif")
      public static let shareAndroid = ImageAsset(name: "32/ShareAndroid")
      public static let shareIos = ImageAsset(name: "32/ShareIos")
      public static let shopping = ImageAsset(name: "32/Shopping")
      public static let upload = ImageAsset(name: "32/Upload")
      public static let user = ImageAsset(name: "32/User")
      public static let verticalWriting = ImageAsset(name: "32/VerticalWriting")
      public static let zoomIn = ImageAsset(name: "32/ZoomIn")
    }
    public enum Inline {
      public static let add = ImageAsset(name: "Inline/Add")
      public static let bookmarkOff = ImageAsset(name: "Inline/BookmarkOff")
      public static let bookmarkOn = ImageAsset(name: "Inline/BookmarkOn")
      public static let breadcrumbs = ImageAsset(name: "Inline/Breadcrumbs")
      public static let check = ImageAsset(name: "Inline/Check")
      public static let comment = ImageAsset(name: "Inline/Comment")
      public static let contextMenu = ImageAsset(name: "Inline/ContextMenu")
      public static let external = ImageAsset(name: "Inline/External")
      public static let filter = ImageAsset(name: "Inline/Filter")
      public static let folder = ImageAsset(name: "Inline/Folder")
      public static let imageResponse = ImageAsset(name: "Inline/ImageResponse")
      public static let images = ImageAsset(name: "Inline/Images")
      public static let like = ImageAsset(name: "Inline/Like")
      public static let likeOff = ImageAsset(name: "Inline/LikeOff")
      public static let list = ImageAsset(name: "Inline/List")
      public static let location = ImageAsset(name: "Inline/Location")
      public static let lock = ImageAsset(name: "Inline/Lock")
      public static let more = ImageAsset(name: "Inline/More")
      public static let nextworks = ImageAsset(name: "Inline/Nextworks")
      public static let openInNew = ImageAsset(name: "Inline/OpenInNew")
      public static let pencil = ImageAsset(name: "Inline/Pencil")
      public static let remove = ImageAsset(name: "Inline/Remove")
      public static let smile = ImageAsset(name: "Inline/Smile")
      public static let smileOn = ImageAsset(name: "Inline/SmileOn")
      public static let users = ImageAsset(name: "Inline/Users")
      public static let view = ImageAsset(name: "Inline/View")
      public static let viewOutline = ImageAsset(name: "Inline/ViewOutline")
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

