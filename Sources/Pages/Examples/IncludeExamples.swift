//
// IncludeExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct IncludeExamples: StaticLayout {
    @Environment(\.decode) private var decode
    var title = "Includes"

    var body: some HTML {
        Text("Includes")
            .font(.title1)

        Text("Includes let you bring in arbitrary HTML from your Includes directory.")
            .font(.lead)

        Text(markdown: "For example, the HTML below was imported from **Includes/important.html**")

        CodeBlock(.swift) {
            """
            Include("important.html")
            """
        }

        Include("important.html")

        Text("Loading arbitrary data")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "If you want to load arbitrary resources for parsing in your Swift code, you should create a folder called **Resources** then you have three options.")

        Text(markdown: "Each option requires you to add `@Environment(\\.decode) var decode` as a property for your page.")

        Text(markdown: "First, `decode.url(forResource:)` tells you the full path to a file in Resources.")

        Text(markdown: "Second, `decode.data(forResource:)` locates a file in Resources and loads it into a `Data` instance. This uses `decode.url(forResource:)` internally.")

        Text(markdown: "And third, `decode(_:as:)` locates a JSON file, loads it into a `Data` instance, then decodes it to a `Decodable` type of your choosing. This uses `decode.data(forResource:)` internally, which in turn uses `decode.url(forResource:)`.")

        Text("For example, this project contains some JSON in Resources/quotes.json, so we can display its contents using the below:")

        CodeBlock(.swift) {
            """
            if let quotes = decode("quotes.json", as: [String].self) {
                ForEach(quotes) { quote in
                    Quote {
                        quote
                    }
                }
            }
            """
        }

        if let quotes = decode("quotes.json", as: [String].self) {
            ForEach(quotes) { quote in
                Quote {
                    quote
                }
            }
        }

        Alert {
            Text(markdown: "**Tip:** This page uses a custom theme, which is dark.")
        }
        .role(.primary)
    }
}
