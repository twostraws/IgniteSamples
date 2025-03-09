//
// TagLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Tags: TagLayout {
    var body: some HTML {

        Text(tag.name)
            .font(.title1)

        List {
            ForEach(tag.articles) { article in
                Link(article)
            }
        }
    }
}
