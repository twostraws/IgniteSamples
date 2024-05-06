//
// LinkExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct LinkExamples: StaticPage {
    var title = "Links"

    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Links")
            .font(.title1)

        Text("Links direct users to other parts of your site, or to external locations.")
            .font(.lead)

        Text("In the simplest case we can create a link with a string target:")

        CodeBlock(language: "swift", """
        Text {
            Link("Go Home", target: "/")
        }
        """)

        Text {
            Link("Go Home", target: "/")
        }

        Text("Alternatively, you can use page types directly to get their path:")

        CodeBlock(language: "swift", """
        Text {
            Link("Learn about carousels", target: CarouselExamples())
        }
        """)

        Text {
            Link("Learn about carousels", target: CarouselExamples())
        }

        Alert {
            Text(markdown: "**Tip:** Page targets use initialized pages, so you can pass in custom values that adjust the path.")
        }
        .role(.info)

        Text("Link styling")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text("Links can have roles to control how they appear:")

        CodeBlock(language: "swift", """
        for role in Role.allCases {
            Text {
                Link("Link with \\(role.rawValue) role.", target: "#")
                    .role(role)
            }
        }
        """)

        for role in Role.allCases {
            Text {
                Link("Link with \(role.rawValue) role.", target: "#")
                    .role(role)
            }
        }

        Text("Links as buttons")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Use `linkStyle(.button)` to style links as buttons:")

        CodeBlock(language: "swift", """
        for role in Role.allCases {
            // The default role isn't very interesting
            if role != .default {
                Text {
                    Link("Button-style link with \\(role.rawValue) role.", target: "#")
                        .linkStyle(.button)
                        .role(role)
                }
            }
        }
        """)

        for role in Role.allCases {
            // The default role isn't very interesting
            if role != .default {
                Text {
                    Link("Button-style link with \(role.rawValue) role.", target: "#")
                        .linkStyle(.button)
                        .role(role)
                }
            }
        }
    }
}
