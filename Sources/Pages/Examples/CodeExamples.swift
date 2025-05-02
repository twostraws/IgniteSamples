//
// CodeExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct CodeExamples: StaticPage {
    var title = "Code"
    var description = """
    Display code snippets with syntax highlighting and language-specific formatting. \
    Create inline code with Code or multi-line blocks with CodeBlock, \
    supporting multiple programming languages.
    """

    var body: some HTML {
        Text("Code")
            .font(.title1)

        Section {
            Text(markdown: "Code comes in two forms: `Code` is for inline code snippets, and `CodeBlock` for larger chunks.")
                .font(.lead)

            Text(markdown: "You can also create code with Markdown, alongside other text: `NavigationSplitView`.")

            Text(markdown: """
            When using `CodeBlock`, you can specify a language for your code. \
            If you also include that language in your site's syntax highlighters, that code will be colored automatically.
            """)

            Text("For example, here's some Swift code:")

            CodeBlock(.swift) {
                """
                CodeBlock(.swift) {
                    \"""
                    struct ContentView: View {
                        var body: some View {
                            Text("Hello, Swift!")
                        }
                    }
                    \"""
                }
                """
            }

            CodeBlock(.swift) {
                """
                struct ContentView: View {
                    var body: some View {
                        Text("Hello, Swift!")
                    }
                }
                """
            }
            .margin(.bottom, .xLarge)
        }

        Text("Here's some Python:")

        CodeBlock(.python) {
            """
            CodeBlock(.python) {
                \"""
                def find_primes_up_to_100():
                    primes = []
                    for possible_prime in range(2, 101):
                        is_prime = True
                        for num in range(2, int(possible_prime ** 0.5) + 1):
                            if possible_prime % num == 0:
                                is_prime = False
                                break
                        if is_prime:
                            primes.append(possible_prime)
                    return primes
                \"""
            }
            """
        }

        CodeBlock(.python) {
            """
            def find_primes_up_to_100():
                primes = []
                for possible_prime in range(2, 101):
                    is_prime = True
                    for num in range(2, int(possible_prime ** 0.5) + 1):
                        if possible_prime % num == 0:
                            is_prime = False
                            break
                    if is_prime:
                        primes.append(possible_prime)
                return primes
            """
        }
        .margin(.bottom, .xLarge)

        Text("And here's some Ruby for good luck:")

        CodeBlock(.swift) {
            """
            CodeBlock(.ruby) {
                \"""
                def print_mean_average(numbers)
                  sum = numbers.sum
                  count = numbers.length
                  mean = count > 0 ? (sum.to_f / count) : 0
                  puts "The mean average is: #{mean}"
                end
                \"""
            }
            """
        }

        CodeBlock(.ruby) {
            """
            def print_mean_average(numbers)
              sum = numbers.sum
              count = numbers.length
              mean = count > 0 ? (sum.to_f / count) : 0
              puts "The mean average is: #{mean}"
            end
            """
        }
        .margin(.bottom, .xLarge)

        Alert {
            Text(markdown: "**Important:** When using syntax highlighting in articles, your site's `syntaxHighlighterConfiguration` must include those languages.")
        }
        .role(.warning)

        Text(markdown: "Use the `highlightedLines()` and `lineNumberVisibility()` modifiers to style your code blocks:")

        CodeBlock(.swift) {
            """
            CodeBlock(.swift) {
                \"""
                struct User {
                    let name: String
                    let age: Int
                    let email: String
                    let isActive: Bool
                }
                \"""
            }
            .highlightedLines(2, 4)
            .lineNumberVisibility(.visible) 
            """
        }

        CodeBlock(.swift) {
            """
            struct User {
                let name: String
                let age: Int
                let email: String
                let isActive: Bool
            }
            """
        }
        .highlightedLines(2, 4)
        .lineNumberVisibility(.visible)
        .margin(.bottom, .xLarge)
    }
}
