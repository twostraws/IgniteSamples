//
// QuoteExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct QuoteExamples: StaticLayout {
    var title = "Quotes"

    var body: some HTML {
        Text("Quotes")
            .font(.title1)

        Text("Quotes let you mark out important pieces of text, optionally with a source.")
            .font(.lead)

        Text("This is a plain quote:")

        CodeBlock(.swift) {
            """
            Quote {
                Text("It is a truth universally acknowledged that all good Swift projects must be in need of result builders.")
            }
            """
        }

        Quote {
            Text("It is a truth universally acknowledged that all good Swift projects must be in need of result builders.")
        }
        .margin(.bottom, .xLarge)

        Text("And this is a quote with a caption provided:")

        CodeBlock(.swift) {
            """
            Quote {
                Text("Programming is an art. Don't spend all your time sharpening your pencil when you should be drawing.")
            } caption: {
                "Paul Hudson"
            }
            """
        }

        Quote {
            Text("Programming is an art. Don't spend all your time sharpening your pencil when you should be drawing.")
        } caption: {
            "Paul Hudson"
        }
    }
}
