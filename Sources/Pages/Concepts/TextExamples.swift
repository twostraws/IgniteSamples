//
// TextExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct TextExamples: StaticLayout {
    var title = "Text"

    var body: some HTML {
        Text("Text")
            .font(.title1)

        Text(markdown: "Text can be created in a variety of ways, but the most common is putting a string into a `Text` element.")
            .font(.lead)

        CodeBlock(.swift) {
            """
            Text(markdown: \"""
            Although you *can* use elements such as `Strong` and `Italic` to style your text, it's easier to use markdown. \
            To do that, use `Text(markdown:)` then write your Markdown as normal.
            \""")
            """
        }

        Text(markdown: """
        Although you *can* use elements such as `Strong` and `Italic` to style your text, it's easier to use markdown. \
        To do that, use `Text(markdown:)` then write your Markdown as normal.
        """)

        Text("It's common to place other elements inside text, to gain access to alignment and more. For example, icons, badges, and images are all commonly used inside text.")

        CodeBlock(.swift) {
            """
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
            """
        }

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
            .margin(.top, .xLarge)

        Text(markdown: "You can adjust the weight of text using the `fontWeight()` modifier, like this:")

        CodeBlock(.swift) {
            """
            Text("Hello, world!")
                .font(.title3)
                .fontWeight(.black)
            """
        }

        Text("Hello, world!")
            .font(.title3)
            .fontWeight(.black)
            .margin(.bottom, .xLarge)

        Text(markdown: "There are a variety of available weights available, from `.black` down to `.ultraThin`:")

        CodeBlock(.swift) {
            """
            Text("Hello, world: Black")
                .font(.title3)
                .fontWeight(.black)

            Text("Hello, world: Heavy")
                .font(.title3)
                .fontWeight(.heavy)

            Text("Hello, world: Bold")
                .font(.title3)
                .fontWeight(.bold)

            Text("Hello, world: Semibold")
                .font(.title3)
                .fontWeight(.semibold)

            Text("Hello, world: Medium")
                .font(.title3)
                .fontWeight(.medium)

            Text("Hello, world: Regular")
                .font(.title3)
                .fontWeight(.regular)

            Text("Hello, world: Light")
                .font(.title3)
                .fontWeight(.light)

            Text("Hello, world: Thin")
                .font(.title3)
                .fontWeight(.thin)

            Text("Hello, world: Ultra Light")
                .font(.title3)
                .fontWeight(.ultraLight)
            """
        }

        Text("Hello, world: Black")
            .font(.title3)
            .fontWeight(.black)

        Text("Hello, world: Heavy")
            .font(.title3)
            .fontWeight(.heavy)

        Text("Hello, world: Bold")
            .font(.title3)
            .fontWeight(.bold)

        Text("Hello, world: Semibold")
            .font(.title3)
            .fontWeight(.semibold)

        Text("Hello, world: Medium")
            .font(.title3)
            .fontWeight(.medium)

        Text("Hello, world: Regular")
            .font(.title3)
            .fontWeight(.regular)

        Text("Hello, world: Light")
            .font(.title3)
            .fontWeight(.light)

        Text("Hello, world: Thin")
            .font(.title3)
            .fontWeight(.thin)

        Text("Hello, world: Ultra Light")
            .font(.title3)
            .fontWeight(.ultraLight)
            .margin(.bottom, .xLarge)

        Text(markdown: "Use the `horizontalAlignment()` modifier to adjust how your text is aligned:")

        CodeBlock(.swift) {
            """
            Text("This is left-aligned text.")
                .horizontalAlignment(.leading)

            Text("This is center-aligned text.")
                .horizontalAlignment(.center)

            Text("This is right-aligned text.")
                .horizontalAlignment(.trailing)
            """
        }

        Text("This is left-aligned text.")
            .horizontalAlignment(.leading)

        Text("This is center-aligned text.")
            .horizontalAlignment(.center)

        Text("This is right-aligned text.")
            .horizontalAlignment(.trailing)
            .margin(.bottom, .xLarge)

        Text(markdown: "Change your text's color using the `foregroundStyle()` modifier. This can be one of the standard roles, e.g. `.danger`, or can be a regular color.")

        CodeBlock(.swift) {
            """
            Text("This is dangerous text.")
                .foregroundStyle(.danger)

            Text("This is steel blue text.")
                .foregroundStyle(.steelBlue)
            """
        }

        Text("This is dangerous text.")
            .foregroundStyle(.danger)

        Text("This is steel blue text.")
            .foregroundStyle(.steelBlue)
    }
}
