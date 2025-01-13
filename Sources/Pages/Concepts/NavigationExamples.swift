//
// NavigationExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct NavigationExamples: StaticLayout {
    var title = "Navigation"

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
            Text("The bar on this site is fixed, which means it will always stay visible at the top.")
            Text("If you also plan to use a fixed bar, make sure you add some top padding to your `Body` object in your theme, so it doesn't start under the navigation bar.")
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
            .navigationBarStyle(.dark)
            .background(.steelBlue)
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
        .navigationBarStyle(.dark)
        .background(.steelBlue)
        .margin(.bottom, .xLarge)

        Text(markdown: "Use the `.navigationItemAlignment()` modifier to align bar items centrally or to the trailing edge:")

        CodeBlock(.swift) {
            """
            NavigationBar(logo: "My Awesome Site") {
                Link("Accordions", target: AccordionExamples())
                Link("Carousels", target: CarouselExamples())
                Link("Tables", target: TableExamples())
            }
            .navigationItemAlignment(.trailing)
            .navigationBarStyle(.light)
            .background(.antiqueWhite)
            """
        }

        NavigationBar(logo: "My Awesome Site") {
            Link("Accordions", target: AccordionExamples())
            Link("Carousels", target: CarouselExamples())
            Link("Tables", target: TableExamples())
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.light)
        .background(.antiqueWhite)
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
            .navigationItemAlignment(.trailing)
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
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .position(.fixedBottom)
        .background(.steelBlue)

        Text("Just remember: when you used fixed bars, it's really important to add some padding to your body so your content doesn't stay under a fixed bar.")
    }
}
