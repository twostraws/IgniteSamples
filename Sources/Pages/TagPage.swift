//
// TagLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Ignite

struct Tags: TagLayout {
    var body: some HTML {

        if let tag {
            Text(tag)
                .font(.title1)
        } else {
            Text("All tags")
                .font(.title1)
        }

        List {
            ForEach(content) { article in
                Link(article)
            }
        }
    }
}
