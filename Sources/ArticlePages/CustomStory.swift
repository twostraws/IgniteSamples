//
// CustomStory.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct CustomStory: ArticlePage {
    var body: some HTML {
        if let image = article.image {
            Image(image, description: article.imageDescription)
                .resizable()
        }

        Text(article.title)
            .font(.title1)

        if let tagLinks = article.tagLinks() {
            HStack(spacing: .xSmall) {
                ForEach(tagLinks) { link in
                    link.font(.title3)
                }
            }
        }

        Text(article.text)
    }
}
