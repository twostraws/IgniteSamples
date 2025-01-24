// CustomModifierExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.

import Foundation
import Ignite

struct BlueTextModifier: HTMLModifier {
    func body(content: some HTML) -> any HTML {
        content.style(.color, "#0066cc")
    }
}

extension HTML {
    func blueText() -> some HTML {
        modifier(BlueTextModifier())
    }
}

struct CustomModifierExamples: StaticLayout {
    var title = "Modifiers"

    var body: some HTML {
        Text("Modifiers")
            .font(.title1)

        Text("Custom modifiers allow you to create reusable styling and behavior modifications for your HTML elements.")
            .font(.lead)

        Text("Creating a Custom Modifier")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        To create a custom modifier, follow these steps:
        1. Create a struct that conforms to `HTMLModifier`
        2. Implement the required `body(content: some HTML) -> any HTML` method
        3. Create an extension on `HTML` to make your modifier easily accessible
        """)

        Text("Here's a simple example that makes text blue:")

        CodeBlock(.swift) {
            """
            struct BlueTextModifier: HTMLModifier {
                func body(content: some HTML) -> any HTML {
                    content.style("color: #0066cc")
                }
            }

            extension HTML {
                func blueText() -> some HTML {
                    modifier(BlueTextModifier())
                }
            }
            """
        }

        Text("You can then use your custom modifier like this:")

        CodeBlock(.swift) {
            """
            Text("This text will be blue!")
                .blueText()
            """
        }

        Text("This text will be blue!")
            .blueText()
            .margin(.bottom, .xLarge)

        Text("Advanced Modifiers")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        Custom modifiers can also accept parameters to make them more flexible. Here's how you would create a modifier that accepts a custom color:
        """)

        CodeBlock(.swift) {
            """
            struct ColorModifier: HTMLModifier {
                let color: String
                
                func body(content: some HTML) -> any HTML {
                    content.style("color: \\(color)")
                }
            }

            extension HTML {
                func textColor(_ color: String) -> some HTML {
                    modifier(ColorModifier(color: color))
                }
            }

            // Usage:
            Text("Custom colored text!")
                .textColor("#ff6b6b")
            """
        }

        Alert {
            Text(markdown: """
                **Important:** Some result builders in Ignite specifically require `InlineHTML` or `BlockHTML`. In these cases, you'll need to create additional extensions for these specific types:
                ```swift
                extension InlineHTML {
                    func textColor(_ color: String) -> some InlineHTML {
                        modifier(ColorModifier(color: color))
                    }
                }

                extension BlockHTML {
                    func textColor(_ color: String) -> some BlockHTML {
                        modifier(ColorModifier(color: color))
                    }
                }
                ```
                This ensures your modifiers can be used in all contexts where they make sense.
                """)
        }
        .role(.warning)
        .margin(.top, .large)
    }
} 
