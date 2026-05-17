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

            #LiveExample(previewMargin: .xLarge) {
                List {
                    "This is a list item"
                    "So is this"
                    "And this"
                }
            }

            Text(markdown: "Alternatively, you can pass in an array like this:")

            #LiveExample(previewMargin: .xLarge) {
                List(User.examples) { user in
                    user.name
                }
            }

            Text(markdown: "Lists are unordered by default. Use the `listMarkerStyle()` modifier to change that:")

            #LiveExample(previewMargin: .xLarge) {
                List {
                    "This is the first list item"
                    "This is the second one"
                    "And here's one more"
                }
                .listMarkerStyle(.ordered(.automatic))
            }
        }

        Text("You can customize the bullet style by adjusting the list marker style. For example, here are Roman numerals:")

        #LiveExample(previewMargin: .xLarge) {
            List {
                "Veni"
                "Vidi"
                "Vici"
            }
            .listMarkerStyle(.ordered(.lowerRoman))
        }

        Text("And here is a custom style using emoji:")

        #LiveExample {
            List {
                "The players gonna play"
                "Haters gonna hate"
                "Fakers gonna fake"
            }
            .listMarkerStyle(.custom("💃"))
        }

        Text("List Styles")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "Lists can be styled in different ways using the `listStyle()` modifier:")

        #LiveExample(previewMargin: .medium) {
            List {
                "Default list item"
                "Another default item"
            }
        }

        #LiveExample(previewMargin: .xLarge) {
            List {
                "Plain list item"
                "Another plain list item"
            }
            .listStyle(.plain)
        }

        #LiveExample(previewMargin: .medium) {
            List {
                "Group list item"
                "Another group item"
                    .badge(Badge("1").role(.primary))
            }
            .listStyle(.group)
        }

        #LiveExample(previewMargin: .xLarge) {
            List {
                "Horizontal group item"
                "Another horizontal item"
            }
            .listStyle(.horizontalGroup)
        }

        Text("List Items")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "When using `List` with `listStyle(.group)`, you can add roles via `ListItem`:")

        #LiveExample(previewMargin: .xLarge) {
            List {
                ForEach(Role.standardRoles) { role in
                    ListItem {
                        "A simple \(role.rawValue) list group item"
                    }
                    .role(role)
                }
            }
            .listStyle(.group)
        }
    }
}
