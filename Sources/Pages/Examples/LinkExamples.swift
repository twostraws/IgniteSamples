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
    var description = """
    Create internal and external links with customizable styling, roles, and \
    button appearances. Open links in new tabs and target specific pages directly.
    """

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

        Text(markdown: "Using a `.target(.blank)` modifier opens new tabs:")

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

        Text(markdown: "Use `LinkGroup` when you need to make multiple `HTML` elements clickable as a single link:")

        CodeBlock(.swift) {
            """
            LinkGroup(target: "/") {
                Section {
                    Text("Building Modern Websites")
                        .font(.title3)
                    
                    Text("Learn how to create beautiful, responsive interfaces using Ignite's declarative syntax.")
                        .font(.lead)
                }
                .border(.lightGray)
                .padding()
                .cornerRadius(5)
                .frame(maxWidth: 500)
            }
            """
        }

        LinkGroup(target: "/") {
            Section {
                Text("Building Modern Websites")
                    .font(.title3)

                Text("Learn how to create beautiful, responsive interfaces using Ignite's declarative syntax.")
                    .font(.lead)
            }
            .border(.lightGray)
            .padding()
            .cornerRadius(5)
            .frame(maxWidth: 500)
        }
        .margin(.bottom, .xLarge)

        Text("Link styling")
            .font(.title2)
            .margin(.top, .xLarge)

        Text("Links can have roles to control how they appear:")

        CodeBlock(.swift) {
            """
            ForEach(Role.standardRoles) { role in
                Text {
                    Link("Link with \\(role.rawValue) role.", target: "#")
                        .role(role)
                }
            }
            """
        }

        ForEach(Role.standardRoles) { role in
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
            ForEach(Role.standardRoles) { role in
                Text {
                    Link("Button-style link with \\(role.rawValue) role.", target: "#")
                        .linkStyle(.button)
                        .role(role)
                }
            }
            """
        }

        ForEach(Role.standardRoles) { role in
            Text {
                Link("Button-style link with \(role.rawValue) role.", target: "#")
                    .linkStyle(.button)
                    .role(role)
            }
        }
    }
}
