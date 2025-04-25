//
// ContentExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ContentExamples: StaticPage {
    @Environment(\.articles) var articles
    var title = "Content"
    var description = """
    Organize and display Markdown content with YAML front matter, article previews, and tag pages. \
    Create flexible layouts and access content through the @Environment.
    """

    var body: some HTML {
        Text("Working with content")
            .font(.title1)

        Text("Ignite parses Markdown files in in your Content folder, automatically converting them to pages.")
            .font(.lead)

        Text("""
        You should create subfolders inside Content to represent different types of articles. \
        This might be by date, e.g. Content/2023, Content/2024, etc, by type, e.g. Content/posts, Content/tutorials, or whatever other approach you want.
        """)

        Text("When it come to rendering your articles, you have two options:")

        List {
            "You can use YAML front matter to specify the layout to use for your article."
            "You can provide only one layout in your site, and it will be used if nothing else is specified."
        }
        .listMarkerStyle(.ordered(.automatic))

        Text(markdown: """
        This example site contains two types of articles, posts and stories. Some articles requests a specific layout, but others don't.
        """)

        Text(markdown: "[This article uses the default layout](/story/luna-and-arya-come-to-wwdc).")

        Text(markdown: "[And this article uses a custom layout](/story/sam-swift-saves-the-day).")
            .padding(.bottom, .xLarge)

        Text("Listing articles")
            .font(.title2)

        Text(markdown: "You can access Markdown content by adding the property `@Environment(\\.articles) var articles` to your view, which lets you read all articles, or articles with a specific type or tag.")

        Text("For example, we can write code to show a list of all articles right here on this page:")

        CodeBlock(.swift) {
            """
            List {
                ForEach(articles.all) { article in
                    Link(article)
                }
            }
            """
        }

        List {
            ForEach(articles.all) { article in
                Link(article)
            }
        }

        Text(markdown: "Or we could show only articles that matches the type `story`:")

        CodeBlock(.swift) {
            """
            List {
                ForEach(articles.typed("story")) { article in
                    Link(article)
                }
            }
            """
        }

        List {
            ForEach(articles.typed("story")) { article in
                Link(article)
            }
        }

        Text("But there are a handful of helpers available to make things both easier and more attractive.")

        Text(markdown: "First, `ArticlePreview` can be used to make a preview for articles. This automatically includes the articles image, title, description, link, and tags, all in one:")

        CodeBlock(.swift) {
            """
            Grid(articles.all, alignment: .top) { item in
                ArticlePreview(for: item)
                    .width(3)
                    .margin(.bottom)
            }
            """
        }

        Grid(articles.all, alignment: .top) { item in
            ArticlePreview(for: item)
                .width(3)
                .margin(.bottom)
        }
        .margin(.bottom, .xLarge)

        Text("YAML front matter")
            .font(.title1)

        Text(markdown: "Ignite supports [Jekyll-style](https://jekyllrb.com/docs/front-matter/) YAML front matter to specify metadata.")
        Text("Specifically, the following fields are supported:")

        List {
            Text(markdown: "`author`: The author's name or contact details, depending on what you want.")
            Text(markdown: "`date`: Set to an ISO-8601 date for when this article was first published.")
            Text(markdown: "`image`: The main image for this content. Will be used with content previews and social sharing.")
            Text(markdown: "`imageDescription`: Screenreader-friendly text describing your article's main image.")
            Text(markdown: "`lastModified`: Set to an ISO-8601 date for when this article was last changed. If this is not present, the published date will be used instead.")
            Text(markdown: "`layout`: The name of the `ArticlePage` struct in your site to use for this content.")
            Text(markdown: "`published`: Set to false to leave this article unpublished on your site.")
            Text(markdown: "`subtitle`: An optional subheading for your content.")
            Text(markdown: "`tags`: A comma-separated list of tags for this article. If you have enabled tag pages, these will be used to list matching content.")
        }

        Text(markdown: "As well as the predefined fields, you can use the `metadata` dictionary to access any custom properties you have defined in the front matter. Note that the dictionary values are optionals: your page code must be able to deal with the dictionary item not existing!")

        CodeBlock(.swift) {
            """
            Text(article.metadata["CustomValue"] ?? "Not defined")
            """
        }

        Text(markdown: "In addition, you can read properties such as `estimatedWordCount` and `estimatedReadingMinutes` on your content, to provide extra information to users.")

        Text("Tag pages")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "If you make a type that conforms to the `TagPage` protocol, you can use it to display tag pages on your site.")

        Text(markdown: "This protocol passes you one of two types conforming to the `Category` protocol: `TagCategory`, which represents a page dedicated the content of a single tag, or `AllTagsCategory`, which represents a page featuring all tags and their content.")

        Text("This sample site has a small tags page implementation. You can see it in action with these links:")

        List {
            Link("Tag: April Fools", target: "/tags/april-fools")
            Link("Tag: Swift", target: "/tags/swift")
            Link("All tags", target: "/tags")
        }
    }
}
