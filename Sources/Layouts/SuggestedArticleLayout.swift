//
// SuggestedArticleLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Ignite

struct SuggestedArticleLayout: Layout {
    @Environment(\.siteConfiguration) private var siteConfiguration
    @Environment(\.content) private var content

    var body: some HTML {
        HTMLDocument {
            HTMLHead(for: page, with: siteConfiguration)

            HTMLBody {
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
            .class("container")
        }
    }
}
