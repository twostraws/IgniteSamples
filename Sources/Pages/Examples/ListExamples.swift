//
// ListExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ListExamples: StaticPage {
    var title = "Lists"
    var description = """
    Create ordered and unordered lists with customizable markers. \
    Support both static items and dynamic content from arrays.
    """

    var body: some HTML {
        Text("Lists")
            .font(.title1)

        Section {
            Text("Lists can be ordered or unordered, and you can customize their bullet styles too.")
                .font(.lead)

            Text("A simple list can be made up just of hard-coded strings, like this:")

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
            .margin(.bottom, .xLarge)

            Text(markdown: "Alternatively, you can pass in an array like this:")

            CodeBlock(.swift) {
                """
                List(User.examples) { user in
                    user.name
                }
                """
            }

            List(User.examples) { user in
                user.name
            }
            .margin(.bottom, .xLarge)

            Text(markdown: "Lists are unordered by default. Use the `listStyle()` modifier to change that:")

            CodeBlock(.swift) {
                """
                List {
                    "This is the first list item"
                    "This is the second one"
                    "And here's one more"
                }
                .listStyle(.ordered)
                """
            }
        }

        List {
            "This is the first list item"
            "This is the second one"
            "And here's one more"
        }
        .listMarkerStyle(.ordered(.automatic))
        .margin(.bottom, .xLarge)

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
        .margin(.bottom, .xLarge)

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

        Text("List Styles")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "Lists can be styled in different ways using the `listStyle()` modifier:")

        CodeBlock(.swift) {
            """
            List {
                "Default list item"
                "Another default item"
            }
            """
        }

        List {
            "Default list item"
            "Another default item"
        }
        .margin(.bottom, .medium)

        CodeBlock(.swift) {
            """
            List {
                "Plain list item"
                "Another plain list item"
            }
            .listStyle(.plain)
            """
        }

        List {
            "Plain list item"
            "Another plain list item"
        }
        .listStyle(.plain)
        .margin(.bottom, .xLarge)

        CodeBlock(.swift) {
            """
            List {
                "Group list item"
                "Another group item"
                    .badge(Badge("1").role(.primary))
            }
            .listStyle(.group)
            """
        }

        List {
            "Group list item"
            "Another group item"
                .badge(Badge("1").role(.primary))
        }
        .listStyle(.group)
        .margin(.bottom, .medium)

        CodeBlock(.swift) {
            """
            List {
                "Horizontal group item"
                "Another horizontal item"
            }
            .listStyle(.horizontalGroup)
            """
        }

        List {
            "Horizontal group item"
            "Another Horizontal item"
        }
        .listStyle(.horizontalGroup)
        .margin(.bottom, .xLarge)

        Text("List Items")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "When using `List` with `listStyle(.group)`, you can add roles via `ListItem`:")

        CodeBlock(.swift) {
            """
            List {
                ForEach(Role.standardRoles) { role in
                    ListItem { 
                        "A simple \\(role.rawValue) list group item" 
                    }
                    .role(role)
                }
            }
            .listStyle(.group)
            """
        }

        List {
            ForEach(Role.standardRoles) { role in
                ListItem { "A simple \(role.rawValue) list group item" }
                    .role(role)
            }
        }
        .listStyle(.group)
        .margin(.bottom, .xLarge)
    }
}
