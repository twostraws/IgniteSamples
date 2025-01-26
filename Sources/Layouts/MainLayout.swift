//
// MainLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some HTML {
        HTMLDocument {
            HTMLHead(for: page)

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
