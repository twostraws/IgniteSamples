//
// CarouselExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct CarouselExamples: StaticLayout {
    var title = "Carousels"

    var body: some HTML {
        Text("Carousels")
            .font(.title1)

        Text("""
        Carousels provide slideshows of images, optionally with content overlaid. \
        Images scale to fill available space, even if that means being cropped, so they work best as illustrations.
        """)
            .font(.lead)

        Text("At their simplest, a carousel might just be a slideshow of pictures like this one:")

        CodeBlock(.swift) {
            """
            Carousel {
                Slide(background: "/images/photos/stack.jpg")
                Slide(background: "/images/photos/wind.jpg")
                Slide(background: "/images/photos/washing.jpg")
            }
            """
        }

        Carousel {
            Slide(background: "/images/photos/stack.jpg")
            Slide(background: "/images/photos/wind.jpg")
            Slide(background: "/images/photos/washing.jpg")
        }
        .margin(.bottom, .xLarge)

        Text(markdown: "You can adjust how carousels move from slide to slide using the `carouselStyle()` modifier:")

        CodeBlock(.swift) {
            """
            Carousel {
                Slide(background: "/images/photos/stack.jpg")
                Slide(background: "/images/photos/wind.jpg")
                Slide(background: "/images/photos/washing.jpg")
            }
            .carouselStyle(.crossfade)
            """
        }

        Carousel {
            Slide(background: "/images/photos/stack.jpg")
            Slide(background: "/images/photos/wind.jpg")
            Slide(background: "/images/photos/washing.jpg")
        }
        .carouselStyle(.crossfade)
        .margin(.bottom, .xLarge)

        Text("""
        You can dim background images by setting their opacity to a value lower than 1. \
        This is particularly effective when overlaying content:
        """)

        CodeBlock(.swift) {
            """
            Carousel {
                Slide(background: "/images/photos/stack.jpg") {
                    Text("This is serious.")
                        .font(.title2)

                    Text("This is important information about the first slide.")
                        .font(.lead)

                    Text {
                        Link("Go Home", target: "/")
                            .linkStyle(.button)
                    }
                }
                .backgroundOpacity(0.2)

                Slide(background: "/images/photos/wind.jpg") {
                    Text("Another great point.")
                        .font(.title2)

                    Text("This is a really convincing point to drive home how awesome carousels are.")
                        .font(.lead)
                }
                .backgroundOpacity(0.2)

                Slide(background: "/images/photos/washing.jpg") {
                    Text(markdown: "One more. *Boom*.")
                        .font(.title2)

                    Text("Slides, images, text – these aren't three separate things. Are you getting it?")
                }
                .backgroundOpacity(0.2)
            }
            """
        }

        Carousel {
            Slide(background: "/images/photos/stack.jpg") {
                Text("This is serious.")
                    .font(.title2)

                Text("This is important information about the first slide.")
                    .font(.lead)

                Text {
                    Link("Go Home", target: "/")
                        .linkStyle(.button)
                }
            }
            .backgroundOpacity(0.2)

            Slide(background: "/images/photos/wind.jpg") {
                Text("Another great point.")
                    .font(.title2)

                Text("This is a really convincing point to drive home how awesome carousels are.")
                    .font(.lead)
            }
            .backgroundOpacity(0.2)

            Slide(background: "/images/photos/washing.jpg") {
                Text(markdown: "One more. *Boom*.")
                    .font(.title2)

                Text("Slides, images, text – these aren't three separate things. Are you getting it?")
            }
            .backgroundOpacity(0.2)
        }
    }
}
