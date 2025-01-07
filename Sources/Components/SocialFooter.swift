//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Ignite

/// Displays a global "Social Footer", with each social icon linking to an
/// external site in a new browser tab, demonstrating how to create reusable
/// components with builtIn icons, external links and custom attributes.
struct SocialFooter: HTML {
    let icons = [
        Image(systemName: "github"),
        Image(systemName: "twitter"),
        Image(systemName: "youtube"),
        Image(systemName: "mastodon")
    ]

    let urlStrings = [
        "https://github.com/twostraws",
        "https://twitter.com/twostraws",
        "https://youtube.com/@twostraws",
        "https://mastodon.social/@twostraws"
    ]

    var body: some HTML {
        Text {
            ForEach(zip(icons, urlStrings)) { (icon, urlString) in
                Link(icon, target: urlString)
                    .role(.secondary)
                    .target(.blank)
                    .relationship(.noOpener, .noReferrer)
                    .margin(.trailing, 20)
            }
        }
        .horizontalAlignment(.center)
        .margin(.top, .extraLarge)
        .font(.title2)
    }
}
