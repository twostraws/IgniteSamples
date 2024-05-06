//
// QuoteExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct QuoteExamples: StaticPage {
    var title = "Quotes"

    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Quotes")
            .font(.title1)

        Text("Quotes let you mark out important pieces of text, optionally with a source.")
            .font(.lead)

        Text("This is a plain quote:")

        CodeBlock(language: "swift", """
        Quote {
            Text("It is a truth universally acknowledged that all good Swift projects must be in need of result builders.")
        }
        """)

        Quote {
            Text("It is a truth universally acknowledged that all good Swift projects must be in need of result builders.")
        }
        .margin(.bottom, .extraLarge)

        Text("And this is a quote with a caption provided:")

        CodeBlock(language: "swift", """
        Quote {
            Text("Programming is an art. Don't spend all your time sharpening your pencil when you should be drawing.")
        } caption: {
            "Paul Hudson"
        }
        """)

        Quote {
            Text("Programming is an art. Don't spend all your time sharpening your pencil when you should be drawing.")
        } caption: {
            "Paul Hudson"
        }
    }
}
