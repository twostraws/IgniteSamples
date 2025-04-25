//
// AlertExample.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct AlertExamples: StaticPage {
    var title = "Alerts"
    var description = """
    Display prominent, contextual notifications with semantic styling. \
    Create alerts with different roles for success, warning, error, \
    and information messages, each with distinct visual styling and icons.
    """

    var body: some HTML {
        Text("Alerts")
            .font(.title1)

        Text("Alerts provide boxed out notifications in a range of styles depending on the role you attach to them.")
            .font(.lead)

        Text("A simple alert is created like this:")

        CodeBlock(.swift) {
            """
            Alert {
                Text("Something went really wrong.")
            }
            .role(.danger)
            """
        }

        Alert {
            Text("Something went really wrong.")
        }
        .role(.danger)
        .margin(.bottom, .xLarge)

        Text("Each role applies different styling to the alert, as you can see in this example:")

        CodeBlock(.swift) {
            """
            ForEach(Role.semanticRoles) { role in
                Alert {
                    Text("This alert has the \\(role.rawValue) role.")
                }
                .role(role)
            }
            """
        }

        ForEach(Role.standardRoles) { role in
            Alert {
                Text("This alert has the \(role.rawValue) role.")
            }
            .role(role)
        }
    }
}
