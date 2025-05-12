import SwiftUI

struct TypographiesView: View {
    enum Const {
        static let shortText = "Hello world, こんにちは世界"
        // swiftlint:disable line_length
        static let longText = "Oh, wet Alex, a jar, a fag! Up, disk, curve by! Man Oz, Iraq, Arizona, my Bev? Ruck's id-pug, a far Ajax, elate? Who?"
        static let numberText = "0123456789"
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Bold SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography20Bold(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Bold MultiLine")
                        Text(Const.longText)
                            .charcoalTypography20Bold()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Regular SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography20Regular(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Regular MultiLine")
                        Text(Const.longText)
                            .charcoalTypography20Regular()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Bold Mono")
                        Text(Const.numberText)
                            .charcoalTypography20BoldMono()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Regular Mono")
                        Text(Const.numberText)
                            .charcoalTypography20RegularMono()
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Bold SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography16Bold(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Bold MultiLine")
                        Text(Const.longText)
                            .charcoalTypography16Bold()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Regular SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography16Regular(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Regular MultiLine")
                        Text(Const.longText)
                            .charcoalTypography16Regular()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Bold Mono")
                        Text(Const.numberText)
                            .charcoalTypography16BoldMono()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Regular Mono")
                        Text(Const.numberText)
                            .charcoalTypography16RegularMono()
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Bold SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography14Bold(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Bold MultiLine")
                        Text(Const.longText)
                            .charcoalTypography14Bold()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Regular SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography14Regular(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Regular MultiLine")
                        Text(Const.longText)
                            .charcoalTypography14Regular()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Bold Mono")
                        Text(Const.numberText)
                            .charcoalTypography14BoldMono()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Regular Mono")
                        Text(Const.numberText)
                            .charcoalTypography14RegularMono()
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Bold SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography12Bold(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Bold MultiLine")
                        Text(Const.longText)
                            .charcoalTypography12Bold()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Regular SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography12Regular(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Regular MultiLine")
                        Text(Const.longText)
                            .charcoalTypography12Regular()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Bold Mono")
                        Text(Const.numberText)
                            .charcoalTypography12BoldMono()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Regular Mono")
                        Text(Const.numberText)
                            .charcoalTypography12RegularMono()
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Bold SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography10Bold(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Bold MultiLine")
                        Text(Const.longText)
                            .charcoalTypography10Bold()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Regular SingleLine")
                        Text(Const.shortText)
                            .charcoalTypography10Regular(isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Regular MultiLine")
                        Text(Const.longText)
                            .charcoalTypography10Regular()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Bold Mono")
                        Text(Const.numberText)
                            .charcoalTypography10BoldMono()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Regular Mono")
                        Text(Const.numberText)
                            .charcoalTypography10RegularMono()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(16)
        }
        .navigationBarTitle("Typographies")
    }
}

#Preview {
    TypographiesView()
}
