//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

/// An example navigation bar, demonstrating how to create reusable components.
struct NavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.svg", description: "ExampleSite logo").frame(width: "min(60vw, 300px)", height: "100%")) {
            Link("Table of Contents", target: "/")

            Dropdown("Key concepts") {
                Link("Grid Layout", target: GridExamples())
                Link("Navigation", target: NavigationExamples())
                Link("Content", target: ContentExamples())
                Link("Text", target: TextExamples())
                Link("Styling", target: StylingExamples())
            }

            Dropdown("Examples") {
                Link("Accordions", target: AccordionExamples())
                Link("Alerts", target: AlertExamples())
                Link("Badges", target: BadgeExamples())
                Link("Buttons", target: ButtonExamples())
                Link("Cards", target: CardExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Code", target: CodeExamples())
                Link("Dropdowns", target: DropdownExamples())
                Link("Embeds", target: EmbedExamples())
                Link("Images", target: ImageExamples())
                Link("Includes", target: IncludeExamples())
                Link("Links", target: LinkExamples())
                Link("Lists", target: ListExamples())
                Link("Quotes", target: QuoteExamples())
                Link("Tables", target: TableExamples())
            }

            Link("Ignite on GitHub", target: "https://github.com/twostraws/Ignite")

            Dropdown("@twostraws") {
                Link("Mastodon", target: "https://mastodon.social/@twostraws")
                Link("Twitter", target: "https://twitter.com/twostraws")
                Link("YouTube", target: "https://youtube.com/@twostraws")
            }
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .backgroundColor(.firebrick)
        .position(.fixedTop)
    }
}
