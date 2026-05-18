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
    Display local images, remote images and system icons with resizing, \
    lazy loading, and accessibility support. Customize \
    icons with different colors and sizes.
    """

    // This page also demonstrates using a custom layout, as shown below.
    var layout = SuggestedArticleLayout()

    var body: some HTML {
        Text("Images")
            .font(.title1)

        Section {
            Text(markdown: "Images can be pictures from your local **/Assets/images** folder, remote images, or one of the built-in icons.")
                .font(.lead)

            Text("Pictures are shown at their natural size by default; you'll usually want to add the `resizable()` modifier to make them scalable:")

            #LiveExample(previewMargin: .large) {
                Image("/images/photos/rug.jpg", description: "A rug. Not a dog, a rug.")
                    .resizable()
            }

            Alert {
                Text(markdown: "Most images should be created with a `description` value provided, for screen readers.")
            }
            .role(.info)

            Text(markdown: "If you're working with large images, consider using the `lazy()` modifier to have them loaded lazily.")

            Text("Icons")
                .font(.title2)
                .margin(.top, .xLarge)

            Text(markdown: "You can also create images from icons. If they are inside `Text`, they will resize with the font:")

            #LiveExample {
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
            }
        }

        let icons = ["airplane", "apple", "arrow-counterclockwise", "award", "balloon", "book", "brightness-high"]

        Text(markdown: "Use the `foregroundStyle()` modifier to recolor your icons, like this:")
            .margin(.top, .xLarge)

        #LiveExample(previewMargin: .large) {
            let colors = [Color.green, .blue, .indigo, .slateGray, .gold, .orange, .tomato, .gray]

            Text {
                InlineForEach(zip(icons, colors)) { icon, color in
                    Image(systemName: icon)
                        .foregroundStyle(color)
                        .margin(.trailing, 20)
                }
            }
            .font(.title1)
        }

        Text(markdown: "**Tip:** Make sure your site configuration options enables the built-in icons.")
            .margin(.bottom, .xLarge)

        Alert {
            Text("In case you hadn't noticed, this page uses a custom theme that places some random content on the right-hand side.")
        }
        .role(.info)

        Text("Remote images")
            .font(.title2)
            .margin(.top, .xLarge)
        
        Text(markdown: "You can also use images stored remotely, but please make sure you receive permission from the site owner first.")
        
        #LiveExample(previewMargin: .large) {
            Image("https://picsum.photos/1280/960", description: "A random public domain image.")
                .resizable()
        }
        
        Text("""
             **Important:** Some sites block remote loading like this. If that's a deliberate choice \
             you should respect that, but if you have spoken to the site owner and they are happy \
             for you to do so, you can often circumvent the problem by adding a tag to the HTML header \
             by adapting the Ignite `MainLayout` struct:
             """)
        
        CodeBlock(.swift) {
            """
            struct MyMainLayout: Layout {
                var body: some Document {
                    Head {
                        MetaTag(name: "referrer", content: "no-referrer")
                    }
                    Body {
                        content
                        IgniteFooter()
                    }
                }
            }
            """
        }
    }
}
