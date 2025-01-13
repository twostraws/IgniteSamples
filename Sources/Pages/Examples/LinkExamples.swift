//
// LinkExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct LinkExamples: StaticLayout {
    var title = "Links"

    var body: some HTML {
        Text("Links")
            .font(.title1)

        Text("Links direct users to other parts of your site, or to external locations.")
            .font(.lead)

        Text("In the simplest case we can create a link with a string target:")

        CodeBlock(.swift) {
            """
            Text {
                Link("Go Home", target: "/")
            }
            """
        }

        Text {
            Link("Go Home", target: "/")
        }

        Text("Alternatively, you can use page types directly to get their path:")

        CodeBlock(.swift) {
            """
            Text {
                Link("Learn about carousels", target: CarouselExamples())
            }
            """
        }

        Text {
            Link("Learn about carousels", target: CarouselExamples())
        }

        Text("Using a `.target(.blank)` modifier opens new tabs")

        CodeBlock(.swift) {
            """
            Text {
                Link("Another tab of links", target: LinkExamples())
                    .target(.blank)
            }
            """
        }

        Text {
            Link("Another tab of links", target: LinkExamples())
                .target(.blank)
        }

        Alert {
            Text(markdown: "**Tip:** Page targets use initialized pages, so you can pass in custom values that adjust the path.")
        }
        .role(.info)

        Text("Link styling")
            .font(.title2)
            .margin(.top, .xLarge)

        Text("Links can have roles to control how they appear:")

        CodeBlock(.swift) {
            """
            ForEach(Role.badgeRoles) { role in
                Text {
                    Link("Link with \\(role.rawValue) role.", target: "#")
                        .role(role)
                }
            }
            """
        }

        ForEach(Role.badgeRoles) { role in
            Text {
                Link("Link with \(role.rawValue) role.", target: "#")
                    .role(role)
            }
        }

        Text("Links as buttons")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "Use `linkStyle(.button)` to style links as buttons:")

        CodeBlock(.swift) {
            """
            ForEach(Role.badgeRoles) { role in
                Text {
                    Link("Button-style link with \\(role.rawValue) role.", target: "#")
                        .linkStyle(.button)
                        .role(role)
                }
            }
            """
        }

        ForEach(Role.badgeRoles) { role in
            Text {
                Link("Button-style link with \(role.rawValue) role.", target: "#")
                    .linkStyle(.button)
                    .role(role)
            }
        }
    }
}
