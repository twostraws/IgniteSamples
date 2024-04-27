//
// IncludeExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct IncludeExamples: StaticPage {
    var title = "Includes"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Includes")
            .font(.title1)

        Text("Includes let you bring in arbitrary HTML from your Includes directory.")
            .font(.lead)

        Text(markdown: "For example, the HTML below was imported from **Includes/important.html**")

        CodeBlock(language: "swift", """
        Include("important.html")
        """)

        Include("important.html")

        Text("Loading arbitrary data")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "If you want to load arbitrary resources for parsing in your Swift code, you should create a folder called **Resources** then you have three options.")

        Text(markdown: "First, `context.url(forResource:)` tells you the full path to a file in Resources.")

        Text(markdown: "Second, `context.data(forResource:)` locates a file in Resources and loads it into a `Data` instance. This uses `context.url(forResource:)` internally.")

        Text(markdown: "And third, `context.decode(resource:as:)` locates a JSON file, loads it into a `Data` instance, then decodes it to a `Decodable` type of your choosing. This uses `context.data(forResource:)` internally, which in turn uses `context.url(forResource:)`.")

        Text("For example, this project contains some JSON in Resources/quotes.json, so we can display its contents using the below:")

        CodeBlock(language: "swift", """
        if let quotes = context.decode(resource: "quotes.json", as: [String].self) {
            for quote in quotes {
                Quote {
                    quote
                }
            }
        }
        """)

        if let quotes = context.decode(resource: "quotes.json", as: [String].self) {
            for quote in quotes {
                Quote {
                    quote
                }
            }
        }


        Alert {
            Text(markdown: "**Tip:** This page uses a custom theme, which is dark")
        }
        .role(.primary)
    }
}
