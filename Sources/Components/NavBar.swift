//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

/// An example navigation bar, demonstrating how to create reusable components.
struct NavBar: HTML {
    var body: some HTML {
        NavigationBar {
            Dropdown("Key concepts") {
                Link("Grid Layout", target: GridExamples())
                Link("Navigation", target: NavigationExamples())
                Link("Content", target: ContentExamples())
                Link("Text", target: TextExamples())
                Link("Styling", target: StylingExamples())
                Link("Theming", target: ThemeExamples())
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
                Link("Modals", target: ModalExamples())
                Link("Quotes", target: QuoteExamples())
                Link("Tables", target: TableExamples())
            }

            Link("Ignite on GitHub", target: "https://github.com/twostraws/Ignite")
        } logo: {
            Image("/images/logo.svg", description: "ExampleSite logo")
                .frame(width: .custom("min(60vw, 300px)"), height: .percent(100%))
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .background(.firebrick)
        .position(.fixedTop)
    }
}
