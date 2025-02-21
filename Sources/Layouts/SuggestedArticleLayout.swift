//
// SuggestedArticleLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct SuggestedArticleLayout: Layout {
    @Environment(\.content) private var content

    var body: some HTML {
        Document {
            Body {
                NavBar()

                Grid {
                    Section(page.body)
                        .width(9)
                        .padding(.vertical, 80)

                    Section {
                        Text("Read this next…")
                            .font(.title3)

                        if let latest = content.all.randomElement() {
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
}
