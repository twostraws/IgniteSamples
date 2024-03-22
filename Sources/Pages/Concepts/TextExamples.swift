//
// TestExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct TextExamples: StaticPage {
    var title = "Text"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Text")
            .font(.title1)

        Text(markdown: "Text can be created in a variety of ways, but the most common is putting a string into a `Text` element.")
            .font(.lead)

        CodeBlock(language: "swift", """
        Text(markdown: \"""
        Although you *can* use elements such as `Strong` and `Italic` to style your text, it's easier to use markdown. \
        To do that, use `Text(markdown:)` then write your Markdown as normal.
        \""")
        """)

        Text(markdown: """
        Although you *can* use elements such as `Strong` and `Italic` to style your text, it's easier to use markdown. \
        To do that, use `Text(markdown:)` then write your Markdown as normal.
        """)

        Text("It's common to place other elements inside text, to gain access to alignment and more. For example, icons, badges, and images are all commonly used inside text.")

        CodeBlock(language: "swift", """
        Text {
            "To do that, pass items into the text using a trailing closure. "

            Strong {
                "Using this approach you can add styling all you want, just by building up elements. "

                Emphasis {
                    "Although Markdown is still easier, to be honest! "
                }
            }

            "Here's an image right inside our text:"

            Image("/images/photos/washing.jpg", description: "A laundry basket.")
                .resizable()
                .frame(maxWidth: 250)
        }
        """)

        Text {
            "To do that, pass items into the text using a trailing closure. "

            Strong {
                "Using this approach you can add styling all you want, just by building up elements. "

                Emphasis {
                    "Although Markdown is still easier, to be honest! "
                }
            }

            "Here's an image right inside our text:"

            Image("/images/photos/washing.jpg", description: "A laundry basket.")
                .resizable()
                .frame(maxWidth: 250)
        }

        Text("Styling your text")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Use the `horizontalAlignment()` modifier to adjust how your text is aligned:")

        CodeBlock(language: "swift", """
        Text("This is left-aligned text.")
            .horizontalAlignment(.leading)

        Text("This is center-aligned text.")
            .horizontalAlignment(.center)

        Text("This is right-aligned text.")
            .horizontalAlignment(.trailing)
        """)

        Text("This is left-aligned text.")
            .horizontalAlignment(.leading)

        Text("This is center-aligned text.")
            .horizontalAlignment(.center)

        Text("This is right-aligned text.")
            .horizontalAlignment(.trailing)

        Text(markdown: "Change your text's color using the `foregroundStyle()` modifier. This can be one of the standard roles, e.g. `.danger`, or can be a regular color.")

        CodeBlock(language: "swift", """
        Text("This is dangerous text.")
            .foregroundStyle(.danger)

        Text("This is steel blue text.")
            .foregroundStyle(.steelBlue)
        """)

        Text("This is dangerous text.")
            .foregroundStyle(.danger)

        Text("This is steel blue text.")
            .foregroundStyle(.steelBlue)
    }
}
