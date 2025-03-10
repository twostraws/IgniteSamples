import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = ExampleSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {
    var name = "My Awesome Site"
    var titleSuffix = " – My Awesome Site"
    var url = URL(static: "https://www.yoursite.com")

    var builtInIconsEnabled = true
    var syntaxHighlighterConfiguration: SyntaxHighlighterConfiguration = .init(languages: [.swift, .python, .ruby])
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://www.yoursite.com/images/icon32.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
    var author = "Paul Hudson"

    var homePage = Home()
    var tagLayout = Tags()
    var layout = MainLayout()

    var pages: [any StaticPage] {
        ContentExamples()
        GridExamples()
        NavigationExamples()
        TextExamples()
        StylingExamples()
        ThemeExamples()

        AccordionExamples()
        AlertExamples()
        BadgeExamples()
        ButtonExamples()
        CardExamples()
        CarouselExamples()
        CodeExamples()
        DropdownExamples()
        EmbedExamples()
        ImageExamples()
        IncludeExamples()
        LinkExamples()
        ListExamples()
        ModalExamples()
        QuoteExamples()
        TableExamples()
    }

    var articlePages: [any ArticlePage] {
        Story()
        CustomStory()
    }
}
