//
// Version Info.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Ignite

/// Displays the version of Ignite the site was built with and the publishing date.
struct VersionInfo: HTML {
    private let dateFormat = Date.FormatStyle().day(.defaultDigits).month(.defaultDigits).year(.twoDigits)
    var body: some HTML {
        Text("\(Ignite.version) · Updated \(Date.now.formatted(dateFormat))")
            .horizontalAlignment(.center)
            .foregroundStyle(.gray)
    }
}
