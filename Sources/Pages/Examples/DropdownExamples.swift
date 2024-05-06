//
// DropdownExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct DropdownExamples: StaticPage {
    var title = "Dropdowns"

    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Dropdowns")
            .font(.title1)

        Text("Dropdowns are buttons with links inside, and optionally also text and dividers to break things up.")
            .font(.lead)

        CodeBlock(language: "swift", """
        Dropdown("Click Me") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Divider()
            Text("Or you can just…")
            Link("Go back home", target: "/")
        }
        .role(.primary)
        """)

        Dropdown("Click Me") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Divider()
            Text("Or you can just…")
            Link("Go back home", target: "/")
        }
        .role(.primary)

        Text("Styling dropdowns")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text("Like other buttons, dropdowns can have roles and sizes:")

        CodeBlock(language: "swift", """
        for role in Role.allCases {
            for size in ButtonSize.allCases {
                Dropdown("\\(size.rawValue.capitalized) \\(role.rawValue) dropdown") {
                    Link("Example Link", target: "#")
                }
                .dropdownSize(size)
                .role(role)
                .margin(.bottom, .extraSmall)
            }

            Spacer(size: .medium)
        }
        """)

        for role in Role.allCases {
            for size in ButtonSize.allCases {
                Dropdown("\(size.rawValue.capitalized) \(role.rawValue) dropdown") {
                    Link("Example Link", target: "#")
                }
                .dropdownSize(size)
                .role(role)
                .margin(.bottom, .extraSmall)
            }

            Spacer(size: .medium)
        }

        Text(markdown: "Dropdowns in `NavigationBar`")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Dropdowns also work great in `NavigationBar` elements – there's one up there right now.")
    }
}
