//
// NavigationExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct NavigationExamples: StaticPage {
    var title = "Navigation"
    var description = """
    Create responsive navigation bars with logos, links, and dropdowns. \
    Customize with menu icons, sticky positioning, and persistent \
    action controls that stay visible on mobile.
    """

    var body: some HTML {
        Text("Navigation")
            .font(.title1)

        Text(markdown: "The `NavigationBar` element helps you add clear branding and navigation on every page.")
            .font(.lead)

        Text("A simple navigation bar has a title and some links, like this:")

        CodeBlock(.swift) {
            """
            NavigationBar(logo: "My Awesome Site") {
                Link("Accordions", target: AccordionExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Tables", target: TableExamples())
            }
            .background(.black)
            .navigationBarStyle(.dark)
            """
        }

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .navigationBarStyle(.dark)
        .margin(.bottom, .large)
        .background(.black)

        Text("All navigation bars automatically adapt to a mobile-friendly layout when horizontal space is restricted. Try it out here!")

        Alert {
            Text(markdown: "If you plan to use a fixed bar like the one on this site, make sure you add some top padding to your `Body` object in your theme, so it doesn't start under the navigation bar.")
        }
        .role(.warning)
        .margin(.vertical, .large)

        Text(markdown: "You can also place `Dropdown` elements in there, like this:")

        CodeBlock(.swift) {
            """
            NavigationBar(logo: "My Awesome Site") {
                Link("Accordions", target: AccordionExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Tables", target: TableExamples())

                Dropdown("More") {
                    Link("Cards", target: CardExamples())
                    Link("Images", target: ImageExamples())
                    Link("Lists", target: ListExamples())
                }
            }
            .navigationBarStyle(.light)
            .background(.antiqueWhite)
            """
        }

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())

            Dropdown("More") {
                Link("Cards", target: CardExamples())
                Link("Images", target: ImageExamples())
                Link("Lists", target: ListExamples())
            }
        }
        .navigationBarStyle(.light)
        .background(.antiqueWhite)
        .margin(.bottom, .xLarge)

        Text(markdown: "Use modifiers like `navigationItemAlignment()`, `navigationMenuIcon()`, and `navigationMenuStyle()` to customize the appearance of the navigation bar:")

        CodeBlock(.swift) {
            """
            NavigationBar(logo: "My Awesome Site") {
                Link("Accordions", target: AccordionExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Tables", target: TableExamples())
            }
            .navigationItemAlignment(.leading)
            .navigationMenuIcon(.ellipsis)
            .navigationMenuStyle(.plain)
            .background(.steelBlue)
            """
        }

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .navigationItemAlignment(.leading)
        .navigationMenuIcon(.ellipsis)
        .navigationMenuStyle(.plain)
        .background(.steelBlue)
        .margin(.bottom, .xLarge)

        Text(markdown: "Show buttons, forms, and other controls at all screen sizes using `navigationBarVisibility()`. These items will remain visible even when the navigation menu is collapsed:")

        CodeBlock(.swift) {
            """
            NavigationBar(logo: "My Awesome Site") {
                Link("Accordions", target: AccordionExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Tables", target: TableExamples())

                Link("GitHub", target: "https://github.com/twostraws/Ignite")
                    .target(.newWindow)
                    .linkStyle(.button)
                    .role(.danger)
                    .navigationBarVisibility(.always)
            }
            .navigationBarStyle(.dark)
            .background(.paleVioletRed)
            """
        }

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())

            Link("GitHub", target: "https://github.com/twostraws/Ignite")
                .target(.newWindow)
                .linkStyle(.button)
                .role(.danger)
                .navigationBarVisibility(.always)
        }
        .navigationBarStyle(.dark)
        .background(.paleVioletRed)
        .margin(.bottom, .xLarge)

        Text(markdown: """
        And finally, use the `position()` modifier to adjust where the bar is this placed. \
        This page has a firebrick red bar fixed at the top, and a steel blue bar fixed at the bottom.
        """)

        CodeBlock(.swift) {
            """
            NavigationBar(logo: "My Awesome Site") {
                Link("Accordions", target: AccordionExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Tables", target: TableExamples())
            }
            .navigationBarStyle(.dark)
            .position(.fixedBottom)
            .background(.steelBlue)
            """
        }

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .navigationBarStyle(.dark)
        .position(.fixedBottom)
        .background(.steelBlue)

        Text("Just remember: when you used fixed bars, it's really important to add some padding to your body so your content doesn't stay under a fixed bar.")
    }
}
