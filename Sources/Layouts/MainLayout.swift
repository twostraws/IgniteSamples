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
        Body {
            NavBar()
                .padding(.bottom, 80)

            content

            Section {
                SocialFooter()
                IgniteFooter()
            }
        }
    }
}
