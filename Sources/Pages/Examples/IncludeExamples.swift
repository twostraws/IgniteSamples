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

        Alert {
            Text(markdown: "**Tip:** This page uses a custom theme, which is dark")
        }
    }
}
