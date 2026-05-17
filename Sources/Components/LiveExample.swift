//
// LiveExample.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Ignite

/// Renders a Swift code example followed by the result of running that same code.
///
/// - Important: This file is designed specifically for Ignite Samples. Without it,
/// every code sample would need to be written twice: once as a string for display,
/// and once as Swift code to run. Unless we're very careful, that creates drift as
/// the API changes. Although this macro might be useful in other projects, it is not
/// required in regular Ignite sites.
@freestanding(expression)
macro LiveExample<Content: HTML>(
    previewMargin: SpacingAmount? = nil,
    @HTMLBuilder _ content: () -> Content
) -> RenderedCodeExample<Content> = #externalMacro(
    module: "IgniteSampleMacrosImplementation",
    type: "LiveExampleMacro"
)

/// A Swift code example that is rendered from the same source used to produce its preview.
struct RenderedCodeExample<Content: HTML>: HTML {
    private let source: String
    private let previewMargin: SpacingAmount?
    private let content: Content

    var body: some HTML {
        CodeBlock(.swift) {
            source
        }

        if let previewMargin {
            content.margin(.bottom, previewMargin)
        } else {
            content
        }
    }

    init(source: String, previewMargin: SpacingAmount? = nil, @HTMLBuilder content: () -> Content) {
        self.source = source
        self.previewMargin = previewMargin
        self.content = content()
    }
}
