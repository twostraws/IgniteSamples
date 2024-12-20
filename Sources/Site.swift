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
//    var titleSuffix = " – My Awesome Site"
    var url = URL(string: "https://www.yoursite.com")!

//    var builtInIconsEnabled = true
    var syntaxHighlighters = [HighlighterLanguage.swift, .python, .ruby]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://www.yoursite.com/images/icon32.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
//    var author = "Paul Hudson"

    var homePage = Home()
    var tagLayout = Tags()
    var layout = MainLayout()

    var staticLayouts: [any StaticLayout] {
        ContentExamples()
        GridExamples()
        NavigationExamples()
        TextExamples()

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
        QuoteExamples()
        StylingExamples()
        TableExamples()
    }

    var contentLayouts: [any ContentLayout] {
        Story()
        CustomStory()
    }
}
