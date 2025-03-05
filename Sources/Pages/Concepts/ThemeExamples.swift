//
// ThemeExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ThemeExamples: StaticLayout {
    var title = "Themes"

    @Environment(\.themes) private var themes

    private var themeSwitcher: some HTML {
        Section {
            ForEach(themes) { theme in
                Button(theme.name.capitalized) {
                    SwitchTheme(theme)
                }
                .role(.light)
                .margin(.horizontal, .xSmall)
            }
        }
        .position(.fixedBottom)
        .background(.firebrick)
        .frame(height: 50)
        .frame(maxWidth: .percent(100%), alignment: .center)
    }

    var body: some HTML {
        Text("Themes")
            .font(.title1)

        Text("Themes let you customize the appearance of your site, with built-in support for light and dark modes.")
            .font(.lead)

        Text("Creating themes")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        Themes conform to the `Theme` protocol, which provides sensible defaults for both \
        light and dark appearances. When creating a theme, you specify its `colorScheme` to \
        determine whether it uses light or dark variants of Ignite's default styles.
        """)

        CodeBlock(.swift) {
            """
            struct MyTheme: Theme {
                static var colorScheme: ColorScheme = .light // or .dark
                
                // Override any theme properties you want to customize
                var syntaxHighlighterTheme: HighlighterTheme = .githubLight
            }
            """
        }

        Text("Theme composition")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        You can create a base theme protocol that provides common values for multiple themes. This allows you to share styling \
        between themes while still having color scheme specific values for properties you haven't explicitly set.
        """)

        CodeBlock(.swift) {
            """
            // Base protocol with shared theme values
            protocol BaseTheme: Theme {}

            // Default implementation for shared values
            extension BaseTheme {
                var accent: Color { Color(hex: "#FF0000") }
                var secondaryAccent: Color { Color(hex: "#00FF00") }
            }

            // Light theme implementation
            struct LightTheme: BaseTheme {
                static var colorScheme: ColorScheme = .light
                // Uses shared accent/secondaryAccent colors
                // Other values default to stock light theme colors
            }

            // Dark theme implementation
            struct DarkTheme: BaseTheme {
                static var colorScheme: ColorScheme = .dark
                // Uses shared accent/secondaryAccent colors
                // Other values default to stock dark theme colors
            }
            """
        }

        Text(markdown: "To enable themes in your site, add them to your site configuration:")

        CodeBlock(.swift) {
            """
            struct ExampleSite: Site {
                var lightTheme: (any Theme)? = LightTheme()
                var darkTheme: (any Theme)? = DarkTheme()
                var alternateThemes: [any Theme] = [
                    SeaTheme(),
                    DesertTheme(),
                    ForestTheme()
                ]
            }
            """
        }

        Alert {
            Text(markdown: "**Note:**  You can add additional themes through `Site`'s `alternateThemes` property.")
        }
        .role(.info)

        Text(markdown: "You can disable either light or dark mode by setting the corresponding theme to `nil`:")

        CodeBlock(.swift) {
            """
            struct DarkOnlySite: Site {
                var lightTheme: (any Theme)? = nil  // Disable light mode
                var darkTheme: (any Theme)? = DarkTheme()
            }

            struct LightOnlySite: Site {
                var lightTheme: (any Theme)? = LightTheme()
                var darkTheme: (any Theme)? = nil   // Disable dark mode
            }
            """
        }

        Alert {
            Text(markdown: """
            **Note:** You must provide at least one theme (either light or dark). Setting both `lightTheme` \
            and `darkTheme` to `nil` will result in a build error.
            """)
        }
        .role(.info)

        Text("Theme switching")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        You can access all available themes through the environment, making it easy to create a theme switcher. \
        The `SwitchTheme()` action lets users change themes dynamically.
        """)

        CodeBlock(.swift) {
            """
            struct ThemeSwitcher: HTML {
                @Environment(\\.themes) private var themes

                var body: some HTML {
                    ForEach(themes) { theme in
                        Button(theme.name) {
                            SwitchTheme(theme)
                        }
                    }
                }
            }
            """
        }

        Text("Give the theme switcher at the bottom of this page a whirl to see this all in action. 👇")

        themeSwitcher

        Text("Materials")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: """
        When using `Material`, the correct variant (light or dark) will automatically be selected \
        based on your theme's `colorScheme` value.
        """)

        Text(markdown: """
        You can override the default `Material` variant using the `colorScheme()` method, \
        which is useful when you want components to always use a specific appearance:
        """)

        CodeBlock(.swift) {
            """
            ZStack {
                Image("/images/photos/dishwasher.jpg")
                    .resizable()
                Text("Always Dark Material")
                    .font(.title3)
                    .frame(width: .percent(100%), height: .percent(100%), alignment: .center)
                    .background(.thinMaterial.colorScheme(.dark))
            }
            .clipped()
            .cornerRadius(12)
            """
        }

        Text(markdown: "Here's an example using `Material`:")

        Grid {
            ZStack {
                Image("/images/photos/dishwasher.jpg")
                    .resizable()
                Text("Adaptive Material")
                    .font(.title3)
                    .frame(width: .percent(100%), height: .percent(100%), alignment: .center)
                    .background(.thinMaterial)
            }
            .clipped()
            .cornerRadius(12)

            ZStack {
                Image("/images/photos/dishwasher.jpg")
                    .resizable()
                Text("Always Dark Material")
                    .font(.title3)
                    .frame(width: .percent(100%), height: .percent(100%), alignment: .center)
                    .background(.thinMaterial.colorScheme(.dark))
            }
            .clipped()
            .cornerRadius(12)
        }
        .margin(.vertical, .large)
    }
}
