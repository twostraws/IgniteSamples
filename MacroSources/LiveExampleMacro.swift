//
// LiveExampleMacro.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

public enum LiveExampleMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let closure = node.trailingClosure else {
            throw LiveExampleMacroError.missingTrailingClosure
        }

        let source = normalizedSource(from: closure.statements.description)
        let previewMargin = node.arguments.first { $0.label?.text == "previewMargin" }?.expression

        if let previewMargin {
            return """
            RenderedCodeExample(source: \(literal: source), previewMargin: \(previewMargin)) \(raw: closure.description)
            """
        }

        return """
        RenderedCodeExample(source: \(literal: source)) \(raw: closure.description)
        """
    }

    private static func normalizedSource(from source: String) -> String {
        var lines = source.components(separatedBy: .newlines)

        while lines.first?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            lines.removeFirst()
        }

        while lines.last?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            lines.removeLast()
        }

        let minimumIndentation = lines
            .filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false }
            .map(indentationWidth)
            .min() ?? 0

        return lines
            .map { removeIndentation(minimumIndentation, from: $0) }
            .joined(separator: "\n")
    }

    private static func indentationWidth(of line: String) -> Int {
        line.prefix { $0 == " " || $0 == "\t" }.count
    }

    private static func removeIndentation(_ indentation: Int, from line: String) -> String {
        let width = min(indentation, indentationWidth(of: line))
        return String(line.dropFirst(width))
    }
}

private enum LiveExampleMacroError: Error, CustomStringConvertible {
    case missingTrailingClosure

    var description: String {
        switch self {
        case .missingTrailingClosure:
            "#LiveExample requires a trailing closure containing the Swift code to render and run."
        }
    }
}

@main
struct IgniteSampleMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LiveExampleMacro.self
    ]
}
