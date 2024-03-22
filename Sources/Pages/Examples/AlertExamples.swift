//
// AlertExample.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct AlertExamples: StaticPage {
    var title = "Accordions"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Alerts")
            .font(.title1)

        Text("Alerts provide boxed out notifications in a range of styles depending on the role you attach to them.")
            .font(.lead)

        Text("A simple alert is created like this:")

        CodeBlock(language: "swift", """
        Alert {
            Text("Something went really wrong.")
        }
        .role(.danger)
        """)

        Alert {
            Text("Something went really wrong.")
        }
        .role(.danger)
        .margin(.bottom, .extraLarge)

        Text("Each role applies different styling to the alert, as you can see in this example:")

        CodeBlock(language: "swift", """
        for role in Role.allCases {
            // The default role isn't interesting for alerts
            if role != .default {
                Alert {
                    Text("This alert has the \\(role.rawValue) role.")
                }
                .role(role)
            }
        }
        """)

        for role in Role.allCases {
            // The default role isn't interesting for alerts
            if role != .default {
                Alert {
                    Text("This alert has the \(role.rawValue) role.")
                }
                .role(role)
            }
        }
    }
}

