//
// SuggestedArticlePage.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct SuggestedArticlePage: Layout {
    @Environment(\.articles) private var articles

    var body: some HTML {
        Body {
            NavBar()

            Grid {
                content
                    .width(9)
                    .padding(.vertical, 80)

                Section {
                    Text("Read this next…")
                        .font(.title3)

                    if let latest = articles.all.randomElement() {
                        ContentPreview(for: latest)
                    }
                }
                .width(3)
                .position(.stickyTop)
                .padding(.top, 80)
            }

            IgniteFooter()
        }
    }
}
