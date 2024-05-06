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

    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Badges")
            .font(.title1)

        Text("Badges are small, capsule-shaped elements that are great for showing counts, tags, and other labels.")
            .font(.lead)

        Text("A simple badge is created like this:")

        CodeBlock(language: "swift", """
        Text {
            Badge("Unread: 500")
                .role(.danger)
        }
        .font(.title2)
        """)

        Text {
            Badge("Unread: 500")
                .role(.danger)
        }
        .font(.title2)
        .margin(.bottom, .extraLarge)

        Text("Each role applies different styling to the badge, as you can see in this example:")

        CodeBlock(language: "swift", """
        for role in Role.allCases {
            if role != .default {
                Text {
                    Badge("This badge has the \\(role.rawValue) role")
                        .role(role)
                }
                .font(.lead)
            }
        }
        """)

        for role in Role.allCases {
            if role != .default {
                Text {
                    Badge("This badge has the \(role.rawValue) role")
                        .role(role)
                }
                .font(.lead)
            }
        }

        Text("Badge sizes")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text("Badges automatically adapt to the font of the text element they belong to. For example, here are badges in a range of sizes:")

        CodeBlock(language: "swift", """
        for font in Font.allCases {
            Text {
                Badge("This badge uses the \\(font) size")
                    .role(.primary)
            }
            .font(font)
        }
        """)

        for font in Font.allCases {
            Text {
                Badge("This badge uses the \(font) size")
                    .role(.primary)
            }
            .font(font)
        }


        Text("Badge variants")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Each badge role comes in three variants: `.default`, `.subtle`, and `subtleBordered`. These are shown below:")

        CodeBlock(language: "swift", """
        for style in Badge.BadgeStyle.allCases {
            Text(markdown: "`\\(style)` style:")
                .font(.title3)

            for role in Role.allCases {
                if role != .default {
                    Text {
                        Badge("This badge has the \\(style) style and \\(role.rawValue) role")
                            .badgeStyle(style)
                            .role(role)
                    }
                    .font(.lead)
                }
            }

            Spacer(size: 40)
        }
        """)

        for style in Badge.BadgeStyle.allCases {
            Text(markdown: "`\(style)` style:")
                .font(.title3)
                .margin(.top, .large)

            for role in Role.allCases {
                if role != .default {
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
}
