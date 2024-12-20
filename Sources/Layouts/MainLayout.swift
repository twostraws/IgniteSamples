//
// MainLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainLayout: Layout {
    @Environment(\.siteConfiguration) var siteConfiguration

    var body: some HTML {
        HTMLDocument {
            HTMLHead(for: page, with: siteConfiguration)

            HTMLBody {
                NavBar()

                Group(page.body)

                Group {
                    SocialFooter()
                    IgniteFooter()
                }
            }
            .padding(.vertical, 80)
            .class("container")
        }
    }
}
