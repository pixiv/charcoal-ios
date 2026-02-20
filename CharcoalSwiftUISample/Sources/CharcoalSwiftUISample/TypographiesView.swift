import SwiftUI

struct TypographiesView: View {
    enum Const {
        static let shortText = "Heavy boxes perform quick waltzes and jigs"
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
                            .font(charcoalSize: .the20, weight: .bold, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Bold MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the20, weight: .bold)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Regular SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the20, weight: .regular, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Regular MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the20, weight: .regular)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Bold Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the20, weight: .bold, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Regular Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the20, weight: .regular, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("20 Attributed String")

                        Text("Atributed")
                            .font(charcoalSize: .the20, weight: .bold)
                            +
                            Text("String")
                            .font(charcoalSize: .the20, weight: .regular)
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Bold SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the16, weight: .bold, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Bold MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the16, weight: .bold)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Regular SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the16, weight: .regular, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Regular MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the16, weight: .regular)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Bold Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the16, weight: .bold, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Regular Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the16, weight: .regular, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("16 Attributed String")

                        Text("Atributed")
                            .font(charcoalSize: .the16, weight: .bold)
                            +
                            Text("String")
                            .font(charcoalSize: .the16, weight: .regular)
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Bold SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the14, weight: .bold, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Bold MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the14, weight: .bold)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Regular SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the14, weight: .regular, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Regular MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the14, weight: .regular)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Bold Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the14, weight: .bold, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Regular Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the14, weight: .regular, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("14 Attributed String")

                        Text("Atributed")
                            .font(charcoalSize: .the14, weight: .bold)
                            +
                            Text("String")
                            .font(charcoalSize: .the14, weight: .regular)
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Bold SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the12, weight: .bold, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Bold MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the12, weight: .bold)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Regular SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the12, weight: .regular, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Regular MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the12, weight: .regular)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Bold Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the12, weight: .bold, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Regular Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the12, weight: .regular, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("12 Attributed String")

                        Text("Atributed")
                            .font(charcoalSize: .the12, weight: .bold)
                            +
                            Text("String")
                            .font(charcoalSize: .the12, weight: .regular)
                    }
                }
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Bold SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the10, weight: .bold, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Bold MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the10, weight: .bold)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Regular SingleLine")
                        Text(Const.shortText)
                            .font(charcoalSize: .the10, weight: .regular, isSingleLine: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Regular MultiLine")
                        Text(Const.longText)
                            .font(charcoalSize: .the10, weight: .regular)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Bold Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the10, weight: .bold, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Regular Mono")
                        Text(Const.numberText)
                            .font(charcoalSize: .the10, weight: .regular, mono: true)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("10 Attributed String")

                        Text("Atributed")
                            .font(charcoalSize: .the10, weight: .bold)
                            +
                            Text("String")
                            .font(charcoalSize: .the10, weight: .regular)
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
