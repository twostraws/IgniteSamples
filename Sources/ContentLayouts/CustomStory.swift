//
// CustomStory.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct CustomStory: ContentLayout {
    var body: some HTML {
        if let image = content.image {
            Image(image, description: content.imageDescription)
                .resizable()
        }

        Text(content.title)
            .font(.title1)

        if content.hasTags {
            Text {
                content.tagLinks()
            }
            .font(.title3)
        }

        Text(content.body)
    }
}
