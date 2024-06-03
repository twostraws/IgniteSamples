//
//  File.swift
//
//
//  Created by joshua kaunert on 6/2/24.
//
import Foundation
import Ignite

/// Displays a "Social Footer", with each icon opening an external social site in a new browser tab, demonstrating how to create reusable components with builtIn icons and custom attributes.
public struct SocialFooter: Component {
    public func body(context: PublishingContext) -> [any PageElement] {
        
        let icons = [
            Image(systemName: "github"),
            Image(systemName: "twitter"),
            Image(systemName: "youtube"),
            Image(systemName: "mastodon"),
        ]
        
        let urlStrings = [
            "https://github.com/twostraws",
            "https://twitter.com/twostraws",
            "https://youtube.com/@twostraws",
            "https://mastodon.social/@twostraws",
        ]
        
        Text {
            for (icon, urlString) in zip(icons, urlStrings) {
                Link(icon, target: urlString)
                    .margin(.trailing, 20)
                    .role(.secondary)
                    .addCustomAttribute(
                        name: "target",
                        value: "_blank"
                    )
                    .addCustomAttribute(
                        name: "rel",
                        value: "noopener noreferrer"
                    )
            }
        }
        .font(.title2)
        .horizontalAlignment(.center)
        .margin(.top, .extraLarge)
    }
}

