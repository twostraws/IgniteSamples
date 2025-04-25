//
// BadgeExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct BadgeExamples: StaticPage {
    var title = "Badges"
    var description = """
    Create compact, contextual labels with semantic styling. \
    Design badges with different roles, sizes, and visual \
    styles to highlight counts, tags, and status indicators. \
    Supports default, subtle, and bordered variants for each role.
    """

    var body: some HTML {
        Text("Badges")
            .font(.title1)

        Text("Badges are small, capsule-shaped elements that are great for showing counts, tags, and other labels.")
            .font(.lead)

        Text("A simple badge is created like this:")

        CodeBlock(.swift) {
            """
            Text {
                Badge("Unread: 500")
                    .role(.danger)
            }
            .font(.title2)
            """
        }

        Text {
            Badge("Unread: 500")
                .role(.danger)
        }
        .font(.title2)
        .margin(.bottom, .xLarge)

        Text("Each role applies different styling to the badge, as you can see in this example:")

        CodeBlock(.swift) {
            """
            ForEach(Role.standardRoles) { role in
                Text {
                    Badge("This badge has the \\(role.rawValue) role")
                        .role(role)
                }
                .font(.lead)
            }
            """
        }

        ForEach(Role.standardRoles) { role in
            Text {
                Badge("This badge has the \(role.rawValue) role")
                    .role(role)
            }
            .font(.lead)
        }

        Text("Badge sizes")
            .font(.title2)
            .margin(.top, .xLarge)

        Text("Badges automatically adapt to the font of the text element they belong to. For example, here are badges in a range of sizes:")

        CodeBlock(.swift) {
            """
            for font in Font.Style.allCases {
                Text {
                    Badge("This badge uses the \\(font) size")
                        .role(.primary)
                }
                .font(font)
            }
            """
        }

        ForEach(Font.Style.allCases) { font in
            Text {
                Badge("This badge uses the \(font) size")
                    .role(.primary)
            }
            .font(font)
        }

        Text("Badge variants")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "Each badge role comes in three variants: `.default`, `.subtle`, and `subtleBordered`. These are shown below:")

        CodeBlock(.swift) {
            """
            ForEach(Badge.Style.allCases) { style in
                Text(markdown: "`\\(style)` style:")
                    .font(.title3)

                ForEach(Role.standardRoles) { role in
                    Text {
                        Badge("This badge has the \\(style) style and \\(role.rawValue) role")
                            .badgeStyle(style)
                            .role(role)
                    }
                    .font(.lead)
                }

                Spacer(size: 40)
            }
            """
        }

        ForEach(Badge.Style.allCases) { style in
            Text(markdown: "`\(style)` style:")
                .font(.title3)
                .margin(.top, .large)

            ForEach(Role.standardRoles) { role in
                Text {
                    Badge("This badge has the \(style) style and \(role.rawValue) role")
                        .badgeStyle(style)
                        .role(role)
                }
                .font(.lead)
            }
        }
    }
}
