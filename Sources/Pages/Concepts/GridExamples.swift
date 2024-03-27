//
// GridExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct GridExamples: StaticPage {
    var title = "Grid Layout"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Grid Layout")
            .font(.title1)

        Text("""
        All layout in Ignite is handled using an invisible 12-column grid layout. \
        You can subdivide those columns however you want, or let Ignite do it for you.
        """)
            .font(.lead)

        Text(markdown: "To create a new page section, use the `Section` element. Your columns will be subdivided to make space for each item you've placed.")

        Text("For example, these pictures all take up one third of the available space:")

        CodeBlock(language: "swift", """
        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }

            Text {
                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
        }
        """)

        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }

            Text {
                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
        }
        .margin(.bottom, .extraLarge)

        Text(markdown: "You can also explicitly set a width for each element using the `width()` modifier.")

        Text("""
        This modifier automatically causes your views to rearrange themselves when horizontal space is restricted.
        For example, these pictures all take up one third of the available space when the browser window is wide, but all the space when the window is narrow:
        """)

        CodeBlock(language: "swift", """
        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
            .width(4)
        }
        """)

        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
            .width(4)
        }
        .margin(.bottom, .extraLarge)

        Text("Wrapping items")
            .font(.title1)

        Text("""
        If you place more than 12 columns of items in a section, they will wrap automatically. \
        For example, this uses four pictures of width 4, causing one to wrap to the next line:
        """)

        CodeBlock(language: "swift", """
        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/rug.jpg", description: "A nice rug.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/car.jpg", description: "The window of a car.")
                    .resizable()
            }
            .width(4)
        }
        """)

        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/rug.jpg", description: "A nice rug.")
                    .resizable()
            }
            .width(4)

            Text {
                Image("/images/photos/car.jpg", description: "The window of a car.")
                    .resizable()
            }
            .width(4)
        }
        .margin(.bottom, .extraLarge)

        Text("Although 12 columns is the default, you can adjust it downwards if needed. For example, this uses a 2-column grid:")

        CodeBlock(language: "swift", """
        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }

            Text {
                Image("/images/photos/rug.jpg", description: "A nice rug.")
                    .resizable()
            }

            Text {
                Image("/images/photos/car.jpg", description: "The window of a car.")
                    .resizable()
            }
        }
        .columns(2)
        """)

        Section {
            Text {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }

            Text {
                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }

            Text {
                Image("/images/photos/rug.jpg", description: "A nice rug.")
                    .resizable()
            }

            Text {
                Image("/images/photos/car.jpg", description: "The window of a car.")
                    .resizable()
            }
        }
        .columns(2)
    }
}
