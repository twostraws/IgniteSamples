//
// MainLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainLayout: Layout {
    @Environment(\.siteConfiguration) private var siteConfiguration

    var body: some HTML {
        HTMLDocument {
            HTMLHead(for: page, with: siteConfiguration)

            HTMLBody {
                NavBar()

                Section(page.body)

                Section {
                    SocialFooter()
                    IgniteFooter()
                }
            }
            .padding(.vertical, 80)
        }
    }
}
