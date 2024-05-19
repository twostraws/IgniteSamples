//
//  MediaExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MediaExamples: StaticPage {
    var title = "Media"
    
    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Media")
            .font(.title1)
        
        Text(markdown: "Media can be either audio from your **/Assets/audio** folder or video from your **/Assets/video** folder.")
            .font(.lead)
        
        Alert {
            Text(markdown: "**Important:** Always attach an `aspectRatio()` modifier to videos, so they scale correctly.")
        }
        .role(.warning)
        
        Text("For example, here's a video:")
        
        CodeBlock(language: "swift", """
        Media("/videos/cow grazing.mp4", "video/mp4")
        .aspectRatio(.r16x9)
        """)
        
        Media("/videos/cow grazing.mp4", "video/mp4")
            .aspectRatio(.r16x9)
            .margin(.bottom, .extraLarge)
        
        Text("Here's some audio:")
        
        CodeBlock(language: "swift", """
        Media("/audio/bark.mp3", "audio/mp3")
        """)
        
        Media("/audio/bark.mp3", "audio/mp3")
            .margin(.bottom, .extraLarge)
    }
}
