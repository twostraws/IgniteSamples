//
// ThemeExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

private struct ThemeSwitcher: HTML {
    @Environment(\.themes) private var themes

    var body: some HTML {
        ForEach(themes) { theme in
            Button(theme.name.capitalized) {
                SwitchTheme(theme)
            }
            .role(.light)
            .margin(.trailing, .small)
        }
    }
}

struct ThemeExamples: StaticLayout {
    var title = "Themes"

    var body: some HTML {
        Text("Themes")
            .font(.title1)

        Text("Themes let you customize the appearance of your site, with built-in support for light and dark modes.")
            .font(.lead)

        Text("Creating themes")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: """
        Themes conform to the `Theme` protocol, but it's recommended to use either `LightTheme` or `DarkTheme` \
        as your base – these provide sensible defaults matching Bootstrap's light and dark themes respectively.
        """)

        CodeBlock(.swift) {
            """
            struct MyLightTheme: LightTheme {
                static var name: String = "light"
                var syntaxHighlighterTheme: HighlighterTheme = .xcodeLight
            }

            struct MyDarkTheme: DarkTheme {
                static var name: String = "dark"
                var syntaxHighlighterTheme: HighlighterTheme = .xcodeDark
            }
            """
        }

        Text(markdown: "To enable themes in your site, add them to your site configuration:")

        CodeBlock(.swift) {
            """
            struct ExampleSite: Site {
                var lightTheme: (any Theme)? = MyLightTheme()
                var darkTheme: (any Theme)? = MyDarkTheme()
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

        Text("Theme switching")
            .font(.title2)
            .margin(.top, .extraLarge)

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

        Section {
            ThemeSwitcher()
                .background(.firebrick)
                .frame(width: 300, height: 50)
                .frame(maxWidth: .percent(100%), alignment: .trailing)
                .padding(.trailing, 25)
        }
        .position(.fixedBottom)

        Text("Materials")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: """
        When using `Material`, the correct variant (light or dark) will automatically be selected \
        based on whether your theme conforms to `LightTheme` or `DarkTheme`.
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
                    .frame(maxWidth: .percent(100%), maxHeight: .percent(100%))
                    .background(.thinMaterial.colorScheme(.dark))
            }
            .clipped()
            .cornerRadius(12)
            """
        }

        Text(markdown: "Here's an example using `Material`:")

        Grid {
            ZStack(alignment: .top) {
                Image("/images/photos/dishwasher.jpg")
                    .resizable()
                Text("Adaptive Material")
                    .font(.title3)
                    .margin(0)
                    .frame(maxWidth: .percent(100%), maxHeight: .percent(100%))
                    .background(.thinMaterial)
            }
            .cornerRadius(12)
            .clipped()

            ZStack {
                Image("/images/photos/dishwasher.jpg")
                    .resizable()
                Text("Always Dark Material")
                    .font(.title3)
                    .margin(0)
                    .frame(maxWidth: .percent(100%), maxHeight: .percent(100%))
                    .background(.thinMaterial.colorScheme(.dark))
            }
            .clipped()
            .cornerRadius(12)
        }
        .margin(.vertical, .large)
    }
}
