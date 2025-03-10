//
// Story.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Story: ArticlePage {
    var body: some HTML {
        Text(article.title)
            .font(.title1)

        if let image = article.image {
            Image(image, description: article.imageDescription)
                .resizable()
                .cornerRadius(20)
                .frame(maxHeight: 300)
        }

        if let tags = article.tags {
            Section {
                Text("Tagged with: \(tags.joined(separator: ", "))")

                Text("\(article.estimatedWordCount) words; \(article.estimatedReadingMinutes) minutes to read.")
            }
        }

        Text(article.text)
    }
}
