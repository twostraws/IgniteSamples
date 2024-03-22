//
// SuggestedArticleTheme.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct SuggestedArticleTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                NavBar()

                Section {
                    Group {
                        page.body
                    }
                    .width(9)
                    .padding(.vertical, 80)

                    Group {
                        Text("Read this next…")
                            .font(.title3)

                        if let latest = context.allContent.randomElement() {
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
