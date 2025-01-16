//
// CardExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct CardExamples: StaticLayout {
    var title = "Cards"

    var body: some HTML {
        Text("Cards")
            .font(.title1)

        Text("Cards provide a standard way of representing group information.")
            .font(.lead)

        Text("They have various options depending on what data you want to provide and how you want it to look.")

        Text("Here's an example card, with image, content, and a button going back to the homepage:")

        CodeBlock(.swift) {
            """
            Card(imageName: "/images/photos/dishwasher.jpg") {
                Text("Before putting your dishes into the dishwasher, make sure and give them a quick pre-clean.")

                Link("Back to the homepage", target: "/")
                    .linkStyle(.button)
            }
            .frame(maxWidth: 500)
            """
        }

        Card(imageName: "/images/photos/dishwasher.jpg") {
            Text("Before putting your dishes into the dishwasher, make sure and give them a quick pre-clean.")

            Link("Back to the homepage", target: "/")
                .linkStyle(.button)
        }
        .frame(maxWidth: 500)

        Text(markdown: "It's also possible to omit the `imageName` parameter and simply place a image in the content:")
            .margin(.top, .xLarge)

        CodeBlock(.swift) {
            """
            Card {
                Text("An image embedded")
                Image(decorative: "/images/photos/rug.jpg")
                Text("as part of the card")
            }
            .frame(maxWidth: 500)
            """
        }

        Card {
            Text("An image embedded")
            Image(decorative: "/images/photos/rug.jpg")
            Text("as part of the card")
        }
        .frame(maxWidth: 500)

        Text("Content position")
            .font(.lead)

        Text(markdown: """
        By default the contents of your card are positioned below any image, but you can change that using
        `.contentPosition()` with a value of `ContentPosition.top` or `ContentPosition.bottom`.
        """)

        CodeBlock(.swift) {
            """
            Card(imageName: "/images/photos/rug.jpg") {
                Text(markdown: "Content below image: `.top`")
            }
            .contentPosition(.top)
            """
        }

        Grid {
            Card(imageName: "/images/photos/rug.jpg") {
                Text(markdown: "Content below image: use `.top`")
            }
            .contentPosition(.top)

            Card(imageName: "/images/photos/rug.jpg") {
                Text(markdown: "Content below image: use `.bottom`")
            }
            .contentPosition(.bottom)
        }
        .columns(2)

        Text("Overlaying text")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        By default the contents of your card are positioned below any image, but you can change that using \
        `.contentPosition(.overlay)` and optionally also the `imageOpacity()` modifier.
        """)

        CodeBlock(.swift) {
            """
            Card(imageName: "/images/photos/dishwasher.jpg") {
                Text("Before putting your dishes into the dishwasher, make sure and give them a quick pre-clean.")
                    .foregroundStyle(.white)

                Link("Back to the homepage", target: "/")
                    .linkStyle(.button)
            }
            .frame(maxWidth: 500)
            .contentPosition(.overlay)
            .imageOpacity(0.5)
            """
        }

        Card(imageName: "/images/photos/dishwasher.jpg") {
            Text("Before putting your dishes into the dishwasher, make sure and give them a quick pre-clean.")
                .foregroundStyle(.white)

            Link("Back to the homepage", target: "/")
                .linkStyle(.button)
        }
        .contentPosition(.overlay)
        .imageOpacity(0.5)
        .frame(maxWidth: 500)

        Text(markdown: """
        To control the position of the overlay you can specify an alignment using `.overlay(alignment:)`
        with one of the following options:
        """)
        .margin(.top, .large)

        Grid {
            ForEach(Card.ContentAlignment.allCases) { alignment in
                let alignmentName = String(describing: alignment)
                Card(imageName: "/images/photos/dishwasher.jpg") {
                    Text(markdown: "`.\(alignmentName)`")
                        .foregroundStyle(.white)
                        .background(.lightGray)

                    Link("Back to the homepage", target: "/")
                        .linkStyle(.button)
                }
                .contentPosition(.overlay(alignment: alignment))
                .imageOpacity(0.5)
            }
        }
        .columns(3)
        .margin(.top, .large)

        Text("Headers and footers")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        You can attach headers and/or footers to your cards, and they automatically get styled appropriately. \
        This is in *addition* to any image you provide, or any titles used in the card body.
        """)

        CodeBlock(.swift) {
            """
            Card {
                Text("This is important!")
                    .font(.title3)
                Text("This is card body text. This is card body text. This is card body text. This is card body text. This is card body text.")
            } header: {
                "Header Example"
            } footer: {
                "Your footer goes here footer"
            }
            """
        }

        Card {
            Text("This is important!")
                .font(.title3)
            Text("This is card body text. This is card body text. This is card body text. This is card body text. This is card body text.")
        } header: {
            "Header Example"
        } footer: {
            "Your footer goes here footer"
        }

        Text("Card styles")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        Cards have three styles: `.default`, `.solid`, and `.bordered`, and can also be assigned roles. \
        The `.default` style does nothing special, but both `.solid` and `.bordered` apply coloring based on role.
        """)

        CodeBlock(.swift) {
            """
            ForEach(Card.Style.allCases) { style in
                if style != .default {
                    Text(markdown: "`\\(style)` style")
                        .font(.title3)

                    ForEach(Role.allCases) { role in
                        Card {
                            "This is a \\(style) card with the \\(role) role."
                        } header: {
                            "Header"
                        }
                        .role(role)
                        .cardStyle(style)
                        .margin(.bottom)
                    }

                    Spacer(size: .xLarge)
                }
            }
            """
        }

        ForEach(Card.Style.allCases) { style in
            if style != .default {
                Text(markdown: "`\(style)` style")
                    .font(.title3)
                    .margin(.top, .xLarge)

                ForEach(Role.allCases) { role in
                    Card {
                        "This is a \(style) card with the \(role) role."
                    } header: {
                        "Header"
                    }
                    .role(role)
                    .cardStyle(style)
                    .margin(.bottom)
                }
            }
        }
    }
}
