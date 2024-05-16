//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

/// An example navigation bar, demonstrating how to create reusable components.
struct NavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo.svg", description: "ExampleSite logo").frame(width: "min(60vw, 300px)", height: "100%")) {
            Link("Table of Contents", target: "/")

            Link("Ignite on GitHub", target: "https://github.com/twostraws/Ignite")

            Dropdown("@twostraws") {
                Link("Mastodon", target: "https://mastodon.social/@twostraws")
                Link("Twitter", target: "https://twitter.com/twostraws")
                Link("YouTube", target: "https://youtube.com/@twostraws")
            }
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .background(.firebrick)
        .position(.fixedTop)
    }
}
