//
// ContentExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ContentExamples: StaticLayout {
    @Environment(\.articles) var articles
    var title = "Content"

    var body: some HTML {
        Text("Working with content")
            .font(.title1)

        Text("Ignite parses Markdown files in in your Content folder, automatically converting them to pages.")
            .font(.lead)

        Text("""
        You should create subfolders inside Content to represent different types of content. \
        This might be by date, e.g. Content/2023, Content/2024, etc, by type, e.g. Content/articles, Content/tutorials, or whatever other approach you want.
        """)

        Text("When it come to rendering your articles, you have two options:")

        List {
            "You can use YAML front matter to specify the layout to use for your content."
            "You can provide only one layout in your site, and it will be used if nothing else is specified."
        }
        .listMarkerStyle(.ordered(.automatic))

        Text(markdown: """
        This example site contains two types of content, articles and stories. Some content requests a specific layout, but others don't.
        """)

        Text(markdown: "[This content uses the default layout](/story/luna-and-arya-come-to-wwdc).")

        Text(markdown: "[And this content uses a custom layout](/story/sam-swift-saves-the-day).")
            .padding(.bottom, .xLarge)

        Text("Listing content")
            .font(.title2)

        Text(markdown: "You can access Markdown content by adding the property `@Environment(\\.content) var content` to your view, which lets you read all content, or content with a specific type or tag.")

        Text("For example, we can write code to show a list of all articles right here on this page:")

        CodeBlock(.swift) {
            """
            List {
                ForEach(content.all) { content in
                    Link(content)
                }
            }
            """
        }

        List {
            ForEach(articles.all) { article in
                Link(article)
            }
        }

        Text(markdown: "Or we could show only content that matches the type `story`:")

        CodeBlock(.swift) {
            """
            List {
                ForEach(content.typed("story")) { content in
                    Link(content)
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

        Text(markdown: "First, `ContentPreview` can be used to make a preview for articles. This automatically includes the articles image, title, description, link, and tags, all in one:")

        CodeBlock(.swift) {
            """
            Grid {
                ForEach(content.all) { item in
                    ContentPreview(for: item)
                        .width(3)
                        .margin(.bottom)
                }
            }
            """
        }

        Grid {
            ForEach(articles.all) { item in
                ContentPreview(for: item)
                    .width(3)
                    .margin(.bottom)
            }
        }
        .margin(.bottom, .xLarge)

        Text("YAML front matter")
            .font(.title1)

        Text(markdown: "Ignite supports [Jekyll-style](https://jekyllrb.com/docs/front-matter/) YAML front matter to specify metadata.")
        Text("Specifically, the following fields are supported:")

        List {
            "author: The author's name or contact details, depending on what you want."
            "date: Set to an ISO-8601 date for when this article was first published."
            "image: The main image for this content. Will be used with content previews and social sharing."
            "imageDescription: Screenreader-friendly text describing your article's main image."
            "lastModified: Set to an ISO-8601 date for when this article was last changed. If this is not present, the published date will be used instead."
            "layout: The name of the content page struct in your site to use for this content."
            "published: Set to false to leave this article unpublished on your site."
            "subtitle: An optional subheading for your content."
            "tags: A comma-separated list of tags for this article. If you have enabled tag pages, these will be used to list matching content."
        }

        Text(markdown: "As well as the predefined fields, you can use the `metadata` dictionary to access any custom properties you have defined in the front matter. Note that the dictionary values are optionals: your page code must be able to deal with the dictionary item not existing!")

        CodeBlock(.swift) {
            """
            Text(content.metadata["CustomValue"] ?? "Not defined")
            """
        }

        Text(markdown: "In addition, you can read properties such as `estimatedWordCount` and `estimatedReadingMinutes` on your content, to provide extra information to users.")

        Text("Tag pages")
            .font(.title2)
            .margin(.top, .xLarge)

        Text(markdown: "If you make a type that conforms to the `TagLayout` protocol, you can use it to display tag pages on your site.")

        Text(markdown: "This protocol passes you an optional tag string: if it has a tag you should use it, but if it's nil you should render an \"all tags\" page.")

        Text("This sample site has a small tags page implementation. You can see it in action with these links:")

        List {
            Link("Tag: April Fools", target: "/tags/april-fools")
            Link("Tag: Swift", target: "/tags/swift")
            Link("All tags", target: "/tags")
        }
    }
}
