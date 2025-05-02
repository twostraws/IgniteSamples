//
// ImageExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ImageExamples: StaticPage {
    var title = "Images"
    var description = """
    Display local images and system icons with resizing, \
    lazy loading, and accessibility support. Customize \
    icons with different colors and sizes.
    """

    // This page also demonstrates using a custom layout, as shown below.
    var layout = SuggestedArticleLayout()

    var body: some HTML {
        Text("Images")
            .font(.title1)

        Section {
            Text(markdown: "Images can be either pictures from your **/Assets/images** folder, or one of the built-in icons.")
                .font(.lead)

            Text("Pictures are shown at their natural size by default; you'll usually want to add the `resizable()` modifier to make them scalable:")

            CodeBlock(.swift) {
                """
                Image("/images/photos/rug.jpg", description: "A rug. Not a dog, a rug.")
                    .resizable()
                """
            }

            Image("/images/photos/rug.jpg", description: "A rug. Not a dog, a rug.")
                .resizable()
                .margin(.bottom, .large)

            Alert {
                Text(markdown: "Most images should be created with a `description` value provided, for screen readers.")
            }
            .role(.info)

            Text(markdown: "If you're working with large images, consider using the `lazy()` modifier to have them loaded lazily.")

            Text("Icons")
                .font(.title2)
                .margin(.top, .xLarge)

            Text(markdown: "You can also create images from icons. If they are inside `Text`, they will resize with the font:")

            CodeBlock(.swift) {
                """
                let icons = ["airplane", "apple", "arrow-counterclockwise", "award", "balloon", "book", "brightness-high"]

                ForEach(Font.Style.allCases) { font in
                    Text {
                        for icon in icons {
                            Image(systemName: icon)
                                .margin(.trailing, 20)
                        }
                    }
                    .font(font)
                }
                """
            }
        }

        let icons = ["airplane", "apple", "arrow-counterclockwise", "award", "balloon", "book", "brightness-high"]

        ForEach(Font.Style.allCases) { font in
            Text {
                InlineForEach(icons) { icon in
                    Image(systemName: icon)
                        .margin(.trailing, 20)
                }
            }
            .font(font)
        }

        Text(markdown: "Use the `foregroundStyle()` modifier to recolor your icons, like this:")
            .margin(.top, .xLarge)

            CodeBlock(.swift) {
                """
                let colors = [Color.green, .blue, .indigo, .slateGray, .gold, .orange, .tomato, .gray]

                Text {
                    ForEach(zip(icons, colors)) { icon, color in
                        Image(systemName: icon)
                            .foregroundStyle(color)
                            .margin(.trailing, 20)
                    }
                }
                .font(.title1)
                """
            }

        let colors = [Color.green, .blue, .indigo, .slateGray, .gold, .orange, .tomato, .gray]

        Text {
            InlineForEach(zip(icons, colors)) { icon, color in
                Image(systemName: icon)
                    .foregroundStyle(color)
                    .margin(.trailing, 20)
            }
        }
        .font(.title1)
        .margin(.bottom, .large)

        Text(markdown: "**Tip:** Make sure your site configuration options enables the built-in icons.")
            .margin(.bottom, .xLarge)

        Alert {
            Text("In case you hadn't noticed, this page uses a custom theme that places some random content on the right-hand side.")
        }
        .role(.info)
    }
}
