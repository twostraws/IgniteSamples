//
// MainLayout.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Body {
            NavBar()
                .padding(.bottom, 100)

            content

            Section {
                SocialFooter()
                IgniteFooter()
                VersionInfo()
                    .margin(.bottom, 80)
            }
        }
    }
}
