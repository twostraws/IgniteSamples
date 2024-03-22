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

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Navigation")
            .font(.title1)

        Text(markdown: "The `NavigationBar` element helps you add clear branding and navigation on every page.")
            .font(.lead)

        Text("A simple navigation bar has a title and some links, like this:")

        CodeBlock(language: "swift", """
        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .backgroundColor(.black)
        .navigationBarStyle(.dark)
        """)

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .backgroundColor(.black)
        .navigationBarStyle(.dark)
        .margin(.bottom, .large)

        Text("All navigation bars automatically adapt to a mobile-friendly layout when horizontal space is restricted. Try it out here!")

        Alert {
            Text("The bar on this site is fixed, which means it will always stay visible at the top.")
            Text("If you also plan to use a fixed bar, make sure you add some top padding to your `Body` object in your theme, so it doesn't start under the navigation bar.")
        }
        .role(.warning)
        .margin(.vertical, .large)

        Text(markdown: "You can also place `Dropdown` elements in there, like this:")

        CodeBlock(language: "swift", """
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
        .backgroundColor(.steelBlue)
        .navigationBarStyle(.dark)
        """)

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
        .backgroundColor(.steelBlue)
        .navigationBarStyle(.dark)
        .margin(.bottom, .extraLarge)

        Text(markdown: "Use the `.navigationItemAlignment()` modifier to align bar items centrally or to the trailing edge:")

        CodeBlock(language: "swift", """
        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .backgroundColor(.antiqueWhite)
        .navigationItemAlignment(.trailing)
        """)

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .backgroundColor(.antiqueWhite)
        .navigationItemAlignment(.trailing)
        .margin(.bottom, .extraLarge)

        Text(markdown: """
        And finally, use the `position()` modifier to adjust where the bar is this placed. \
        This page has a firebrick red bar fixed at the top, and a steel blue bar fixed at the bottom.
        """)

        CodeBlock(language: "swift", """
        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .backgroundColor(.steelBlue)
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .position(.fixedBottom)
        """)

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .backgroundColor(.steelBlue)
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .position(.fixedBottom)

        Text("Just remember: when you used fixed bars, it's really important to add some padding to your body so your content doesn't stay under a fixed bar.")
    }
}
