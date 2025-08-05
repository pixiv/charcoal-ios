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
    public var color: ColorAsset.Color {
      return colorAsset.color
    }
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

