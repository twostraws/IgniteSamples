//
// SuggestedArticleLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct SuggestedArticleLayout: Layout {
    @Environment(\.articles) private var articles

    var body: some Document {
        Body {
            NavBar()

            Grid(columns: 12, alignment: .top) {
                GridRow {
                    content
                        .gridCellColumns(9)

                    Section {
                        Text("Read this next…")
                            .font(.title3)

                        if let latest = articles.all.randomElement() {
                            ArticlePreview(for: latest)
                        }
                    }
                    .gridCellColumns(3)
                    .position(.stickyTop)
                }
                .padding(.top, 80)
            }

            IgniteFooter()
        }
    }
}
