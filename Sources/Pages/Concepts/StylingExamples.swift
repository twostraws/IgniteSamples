//
// StylingExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct StylingExamples: StaticLayout {
    var title = "Styling"
    var path = "/custom/path/to/styling"

    var body: some HTML {
        Text("Styling")
            .font(.title1)

        Text("There are lots of ways you can style your page content; this page demonstrates some examples.")
            .class("Wom")
            .font(.lead)

        Grid {
            Section {
                Text("Here's an image with a fixed width and 50% opacity:")

                CodeBlock(.swift) {
                    """
                    Image("/images/photos/dishwasher.jpg", description: "A dishwasher, and not a dog.")
                        .resizable()
                        .frame(width: 300)
                        .opacity(0.5)
                    """
                }

                Image("/images/photos/dishwasher.jpg", description: "A dishwasher, and not a dog.")
                    .resizable()
                    .frame(width: 300)
                    .opacity(0.5)
                    .margin(.bottom, .xLarge)

                Text("The following heading has a background color, foreground style, and inner shadow:")

                CodeBlock(.swift) {
                    """
                    Text("Hello, world!")
                        .font(.title2)
                        .padding(20)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .innerShadow(.black, radius: 20)
                    """
                }

                Text("Hello, world!")
                    .font(.title2)
                    .padding(20)
                    .foregroundStyle(.white)
                    .background(.indigo)
                    .innerShadow(.black, radius: 20)
                    .margin(.bottom, .xLarge)

                Text("The next heading has a tooltip – hover over it to see what it says:")

                CodeBlock(.swift) {
                    """
                    Text {
                        Span("Hover over me")
                            .hint(markdown: "Why, *hello* there!")
                    }
                    .font(.title2)
                    """
                }

                Text {
                    Span("Hover over me")
                        .hint(markdown: "Why, *hello* there!")
                }
                .font(.title2)
            }
            .width(7)
            .margin(.bottom, .xLarge)

            Section {
                CodeBlock(.swift) {
                    """
                    Section {
                        Text("This section is sticky. Try scrolling down!")

                        Image("/images/photos/washing.jpg", description: "A laundry basket.")
                            .resizable()
                    }
                    .position(.stickyTop)
                    .padding(.top, 80)
                    """
                }

                Section {
                    Text("This section is sticky. Try scrolling down!")

                    Image("/images/photos/washing.jpg", description: "A laundry basket.")
                        .resizable()
                }
            }
            .width(5)
            .position(.stickyTop)
            .padding(.top, 80)
        }

        Spacer(size: 300)

        Text("This space left intentionally blank.")

        Spacer(size: 300)

        Text("The section on the right started in its original location, but when it reached the top it stuck there until you scrolled past the end of its section, at which point it scrolled again.")

        CodeBlock(.swift) {
            """
            Text(markdown: "Get this in your own content using `.position(.stickyTop)`.")
            """
        }

        Text(markdown: "Get this in your own content using `.position(.stickyTop)`.")
            .margin(.bottom, .xLarge)

        Text("A note about margin and padding")
            .font(.title2)

        Text(markdown: """
        One significant difference between SwiftUI and Ignite is the `padding()` modifier. \
        On the web we distinguish between *margin*, which is the space between this element and the next one, and *padding*, which is space inside the element.
        """)

        Text("To see the difference in action, the heading below has no padding and 100 pixels of margins on all sides:")

        CodeBlock(.swift) {
            """
            Text("Zero padding, lots of margin")
                .padding(.none)
                .margin(100)
                .background(.purple)
                .foregroundStyle(.white)
            """
        }

        Text("Zero padding, lots of margin")
            .padding(.none)
            .margin(100)
            .background(.purple)
            .foregroundStyle(.white)

        Text("Notice how it's set away from surrounding context, but the purple background fits tightly around it.")

        Text("In comparison, the heading below has 100 pixels of padding on all sides and no margins:")

        CodeBlock(.swift) {
            """
            Text("Lots of padding, zero margin")
                .padding(100)
                .margin(.none)
                .background(.purple)
                .foregroundStyle(.white)
            """
        }

        Text("Lots of padding, zero margin")
            .padding(100)
            .margin(.none)
            .background(.purple)
            .foregroundStyle(.white)

        Text(markdown: "This time the heading has lots of purple space around it – the heading has had extra space added *inside it*, which is colored. However, it runs edge to edge otherwise; this text sits directly below it.")

        Text(markdown: "Although Ignite could easily have followed SwiftUI's meaning of `padding()`, it would cause more problems than it solves because it wouldn't match the way the web works.")

        Alert {
            Text(markdown: """
            **PS:** Did you notice the URL for this page? \
            Static layouts have their URLs generated from their type name, but you can also provide a custom path. \
            If you're using `Link` with a `StaticLayout` target it will ✨Just Work✨.
            """)
        }
        .role(.info)
    }
}
