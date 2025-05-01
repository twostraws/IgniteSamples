//
// AccordionExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct AccordionExamples: StaticPage {
    var title = "Accordions"
    var description = """
    Create collapsible content sections that users can expand and collapse. \
    Learn how to control whether multiple sections can be open at once, \
    set default open states, and style accordion titles and content.
    """

    var body: some HTML {
        Text("Accordions")
            .font(.title1)

        Text("Accordions are a bit like disclosure groups: users see a group of headings, and can click on one to expand it, revealing its contents.")
            .font(.lead)

        Text("This creates a simple accordion:")

        CodeBlock(.swift) {
            """
            Accordion {
                Item("First item") {
                    Text("This is the first accordion item.")
                }

                Item("Second item") {
                    Text("This is the second accordion item.")
                }

                Item("Third item") {
                    Text("This is the third accordion item.")
                }
            }
            .openMode(.individual)
            .margin(.bottom, .xLarge)
            """
        }

        Accordion {
            Item("First item") {
                Text("This is the first accordion item.")
            }

            Item("Second item") {
                Text("This is the second accordion item.")
            }

            Item("Third item") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        .margin(.bottom, .xLarge)

        Text("This accordion is set to allow multiple items to be open at a time:")

        CodeBlock(.swift) {
            """
            Accordion {
                Item("First") {
                    Text("This is the first accordion item.")
                }

                Item("Second") {
                    Text("This is the second accordion item.")
                }

                Item("Third") {
                    Text("This is the third accordion item.")
                }
            }
            .openMode(.all)
            """
        }

        Accordion {
            Item("First") {
                Text("This is the first accordion item.")
            }

            Item("Second") {
                Text("This is the second accordion item.")
            }

            Item("Third") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.all)
        .margin(.bottom, .xLarge)

        Text("You can configure individual items to be open by default if you want:")

        CodeBlock(.swift) {
            """
            Accordion {
                Item("First", startsOpen: true) {
                    Text("This item will start open by default.")
                }

                Item("Second") {
                    Text("This is the second accordion item.")
                }

                Item("Third") {
                    Text("This is the third accordion item.")
                }
            }
            .openMode(.individual)
            """
        }

        Accordion {
            Item("First", startsOpen: true) {
                Text("This item will start open by default.")
            }

            Item("Second") {
                Text("This is the second accordion item.")
            }

            Item("Third") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        .accordionStyle(.plain)
        .margin(.bottom, .xLarge)

        Text("And you can add more complex elements and styling to your accordion titles and contents if you want:")

        CodeBlock(.swift) {
            """
            Accordion {
                Item(startsOpen: true) {
                    Text {
                        Image("/images/photos/chair.jpg", description: "This is a picture of a chair, and not a dog.")
                            .resizable()
                    }

                    Text("This is the first accordion item.")
                } header: {
                    Emphasis { "This title is italic" }
                        .foregroundStyle(.black)
                }

                Item(Underline { "This title is underlined." }) {
                    Text("This is the second accordion item.")
                }
                .contentBackground(.aliceBlue)

                Item(Strong { "This title is bold." }) {
                    Text("This is the third accordion item.")
                }
            }
            .openMode(.individual)
            .headerBackground(.mintCream, open: .seaGreen)
            .headerForegroundStyle(.darkGreen, open: .white)
            .borderColor(.lightSeaGreen)
            """
        }

        Accordion {
            Item(startsOpen: true) {
                Text {
                    Image("/images/photos/chair.jpg", description: "This is a picture of a chair, and not a dog.")
                        .resizable()
                }

                Text("This is the first accordion item.")
            } header: {
                Emphasis { "This title is italic" }
                    .foregroundStyle(.black)
            }

            Item(Underline { "This title is underlined." }) {
                Text("This is the second accordion item.")
            }
            .contentBackground(.aliceBlue)

            Item(Strong { "This title is bold." }) {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        .headerBackground(.mintCream, open: .seaGreen)
        .headerForegroundStyle(.darkGreen, open: .white)
        .borderColor(.lightSeaGreen)
    }
}
