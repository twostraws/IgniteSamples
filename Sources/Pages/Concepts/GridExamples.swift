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
    var description = """
    Create flexible, responsive layouts using Ignite's 12-column grid system. \
    Learn how to subdivide space, set explicit widths, and handle wrapping content automatically.
    """

    var body: some HTML {
        Text("Grid Layout")
            .font(.title1)

        Text("""
        All layout in Ignite is handled using an invisible 12-column grid layout. \
        You can subdivide those columns however you want, or let Ignite do it for you.
        """)
            .font(.lead)

        Text(markdown: """
        To create a grid, use the `Grid` element. Items placed inside a `GridRow` will be distributed evenly throughout the row, taking up one column each.
        """)

        Text("For example, these pictures all take up one third of the available space:")

        CodeBlock(.swift) {
            """
            Grid {
                GridRow {
                    Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                        .resizable()

                    Image("/images/photos/stack.jpg", description: "A door partly open.")
                        .resizable()


                    Image("/images/photos/wind.jpg", description: "A windy day.")
                        .resizable()
                }
            }
            """
        }

        Grid {
            GridRow {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()

                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()

                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
        }
        .margin(.bottom, .xLarge)

        Text(markdown: "Elements that aren't wrapped in a `GridRow` will span an entire row:")

        CodeBlock(.swift) {
            """
            Grid {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
            }
            """
        }

        Grid {
            Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                .resizable()
        }
        .margin(.bottom, .xLarge)

        Text(markdown: "The width of the grid is determined by the row with the most columns:")

        CodeBlock(.swift) {
            """
            Grid {
                GridRow {
                    Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                        .resizable()

                    Image("/images/photos/stack.jpg", description: "A door partly open.")
                        .resizable()
                }
                
                GridRow {
                    Image("/images/photos/wind.jpg", description: "A windy day.")
                        .resizable()
                }
            }
            """
        }

        Grid {
            GridRow {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()

                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()
            }

            GridRow {
                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
        }
        .margin(.bottom, .xLarge)

        Text(markdown: """
        By default, when space is restricted, your views will rearrange to take up an entire row. To control how grid items scale
        at small screen sizes, use the `gridItemSizing()` modifier.
        """)

        Text("For example, these pictures all remain in the same row:")

        CodeBlock(.swift) {
            """
            Grid {
                GridRow {
                    Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                        .resizable()

                    Image("/images/photos/stack.jpg", description: "A door partly open.")
                        .resizable()


                    Image("/images/photos/wind.jpg", description: "A windy day.")
                        .resizable()
                }
            }
            .gridItemSizing(.adaptive(minimum: 0))
            """
        }

        Grid {
            GridRow {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()

                Image("/images/photos/stack.jpg", description: "A door partly open.")
                    .resizable()


                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
        }
        .gridItemSizing(.adaptive(minimum: 0))
        .margin(.bottom, .xLarge)

        Text("Although 12 columns is the default, you can adjust it downwards if needed. For example, this uses a 3-column grid:")

        CodeBlock(.swift) {
            """
            Grid(columns: 3, alignment: .top) {
                GridRow {
                    Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                        .resizable()
                        .gridCellColumns(2)

                    Image("/images/photos/wind.jpg", description: "A windy day.")
                        .resizable()
                }
            }
            """
        }

        Grid(columns: 3, alignment: .top) {
            GridRow {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
                    .gridCellColumns(2)

                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
            }
        }
        .margin(.bottom, .xLarge)

        Text(markdown: "You can explicitly set a width for each element using the `gridCellColumns()` modifier:")

        CodeBlock(.swift) {
            """
            Grid(columns: 2) {
                Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                    .resizable()
                    .gridCellColumns(1)

                Image("/images/photos/wind.jpg", description: "A windy day.")
                    .resizable()
                    .gridCellColumns(1)
            }
            """
        }

        Grid(columns: 2) {
            Image("/images/photos/shades.jpg", description: "A pair of sunglasses.")
                .resizable()
                .gridCellColumns(1)

            Image("/images/photos/wind.jpg", description: "A windy day.")
                .resizable()
                .gridCellColumns(1)
        }
        .margin(.bottom, .xLarge)
    }
}
