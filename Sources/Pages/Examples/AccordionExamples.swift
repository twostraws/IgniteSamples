//
// AccordionExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct AccordionExamples: StaticLayout {
    var title = "Accordions"

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
        .margin(.bottom, .xLarge)

        Text("And you can add more complex elements and styling to your accordion titles and contents if you want:")

        CodeBlock(.swift) {
            """
            Accordion {
                Item(Emphasis { "This title is italic" }, startsOpen: true) {
                    Text {
                        Image("/images/photos/chair.jpg", description: "This is a picture of a chair, and not a dog.")
                            .resizable()
                    }

                    Text("This is the first accordion item.")
                }

                Item(Underline { "This title is underlined." }) {
                    Text("This is the second accordion item.")
                }

                Item(Strong { "This title is bold." }) {
                    Text("This is the third accordion item.")
                }
            }
            .openMode(.individual)
            """
        }

        Accordion {
            Item(Emphasis { "This title is italic" }, startsOpen: true) {
                Text {
                    Image("/images/photos/chair.jpg", description: "This is a picture of a chair, and not a dog.")
                        .resizable()
                }

                Text("This is the first accordion item.")
            }

            Item(Underline { "This title is underlined." }) {
                Text("This is the second accordion item.")
            }

            Item(Strong { "This title is bold." }) {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
    }
}
