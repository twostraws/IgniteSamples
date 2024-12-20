//
// ListExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ListExamples: StaticLayout {
    var title = "Lists"

    var body: some HTML {
        Text("Lists")
            .font(.title1)

        Group {
            Text("Lists can be ordered or unordered, and you can customize their bullet styles too.")
                .font(.lead)

            Text("A simple list can be made up just of strings, like this:")

            CodeBlock(.swift) {
                """
                List {
                    "This is a list item"
                    "So is this"
                    "And this"
                }
                """
            }

            List {
                "This is a list item"
                "So is this"
                "And this"
            }
            .margin(.bottom, .extraLarge)

            Text(markdown: "Lists are unordered by default. Use the `listStyle()` modifier to change that:")

            CodeBlock(.swift) {
                """
                List {
                    "This is the first list item"
                    "This is the second one"
                    "And here's one more"
                }
                .listStyle(.ordered(.default))
                """
            }
        }

        List {
            "This is the first list item"
            "This is the second one"
            "And here's one more"
        }
        .listMarkerStyle(.ordered(.automatic))
        .margin(.bottom, .extraLarge)

        Text("You can customize the bullet style by adjusting the list style. For example, here are Roman numerals:")

        CodeBlock(.swift) {
            """
            List {
                "Veni"
                "Vidi"
                "Vici"
            }
            .listStyle(.ordered(.lowerRoman))
            """
        }

        List {
            "Veni"
            "Vidi"
            "Vici"
        }
        .listMarkerStyle(.ordered(.lowerRoman))
        .margin(.bottom, .extraLarge)

        Text("And here is a custom style using emoji:")

        CodeBlock(.swift) {
            """
            List {
                "The players gonna play"
                "Haters gonna hate"
                "Fakers gonna fake"
            }
            .listMarkerStyle(.custom("💃"))
            """
        }

        List {
            "The players gonna play"
            "Haters gonna hate"
            "Fakers gonna fake"
        }
        .listMarkerStyle(.custom("💃"))
    }
}
