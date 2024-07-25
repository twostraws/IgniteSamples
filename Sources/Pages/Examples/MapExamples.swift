//
// MapExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MapExamples: StaticPage {
    var title = "Maps"

    func body(context: PublishingContext) async -> [BlockElement] {
        Script(code: """
        src="https://cdn.apple-mapkit.com/mk/5.x.x/mapkit.core.js"
               crossorigin async
               data-callback="initMapKit"
               data-libraries="map"
               data-token="eyJraWQiOiJSNzgzRjNIOE05IiwidHlwIjoiSldUIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiIyTVA4UVdLN1I2IiwiaWF0IjoxNzIxODU1OTU0LCJleHAiOjE3MjI0OTU1OTl9.ViD505SG9QW54fv5h3iv9lQsY328OlHF-1mEPdFeNzRmqrRI137IaXlGXr2W5lR9brWG7Luej1SoEyr8beXsjw">
        
        """)
        
        Script(code: """
        // Wait for MapKit JS to be ready to use.
        const setupMapKitJs = async() => {
        // If MapKit JS is not yet loaded...
        if (!window.mapkit || window.mapkit.loadedLibraries.length === 0) {
        // ...await <script>'s data-callback (window.initMapKit).
        await new Promise(resolve => { window.initMapKit = resolve });
        // Clean up.
        delete window.initMapKit;
        }
        };
        
        const main = async() => {
        await setupMapKitJs();
        
        // Create the Map and Geocoder.
        const map = new mapkit.Map("map-container");
        const geocoder = new mapkit.Geocoder({ language: "en-US" });
        
        // Create the "Event" annotation, setting properties in the constructor.
        const event = new mapkit.Coordinate(37.7831, -122.4041);
        const eventAnnotation = new mapkit.MarkerAnnotation(event, {
        color: "#4eabe9",
        title: "Event",
        glyphText: "\u{1F37F}" // Popcorn Emoji
        });
        
        // Create the "Work" annotation, setting properties after construction.
        const work = new mapkit.Coordinate(37.3349, -122.0090);
        const workAnnotation = new mapkit.MarkerAnnotation(work);
        workAnnotation.color = "#969696";
        workAnnotation.title = "Work";
        workAnnotation.subtitle = "Apple Park";
        workAnnotation.selected = "true";
        workAnnotation.glyphText = "\u{F8FF}"; // Apple Symbol
        
        // Add and show both annotations on the map.
        map.showItems([eventAnnotation, workAnnotation]);
        
        // This contains the user-set single-tap annotation.
        let clickAnnotation = null;
        
        // Add or move an annotation when a user single-taps an empty space.
        map.addEventListener("single-tap", event => {
        if (clickAnnotation) {
            map.removeAnnotation(clickAnnotation);
        }
        
        // Get the clicked coordinate and add an annotation there.
        const point = event.pointOnPage;
        const coordinate = map.convertPointOnPageToCoordinate(point);
        
        clickAnnotation = new mapkit.MarkerAnnotation(coordinate, {
            title: "Loading...",
            color: "#c969e0"
        });
        
        map.addAnnotation(clickAnnotation);
        
        // Look up the address with the Geocoder's Reverse Lookup Function.
        geocoder.reverseLookup(coordinate, (error, data) => {
            const first = (!error && data.results) ? data.results[0] : null;
            clickAnnotation.title = (first && first.name) || "";
        });
        });
        
        };
        
        main();
        """).addCustomAttribute(name: "type", value: "module")
        
        
        Text("Maps")
            .font(.title1)

        Text("Maps let you place map content onto your page")
            .font(.lead)

        Alert {
            Text(markdown: "**Important:** Always attach an `aspectRatio()` modifier to embeds, so they scale correctly.")
        }
        .role(.warning)

        Text("For example, here's a YouTube video:")

        CodeBlock(language: "swift", """
        Embed(youTubeID: "dQw4w9WgXcQ", title: "There was only ever going to be one video used here.")
            .aspectRatio(.r16x9)
        """)

        
            .aspectRatio(.r16x9)
            .margin(.bottom, .extraLarge)
        
//        Include("embeded.html")
        
//        Include("annotations.html")
        
//        Include("calloutAccessory.html")
        
//        Include("customCallout.html")
        
//        Include("details.html") // messes up whole page
        
//        Include("limits.html")
        
//        Include("searchFiltering.html")
        
//        Include("polylines.html") // works but needs polyline
 
        
//        Include("usPop.html") // works but needs data
        

        Text("here's a Map of The Family Farm")

        CodeBlock(language: "swift", """
        Map(title: "My Map", url: "https://embed.apple-mapkit.com/v1/place?place=I2FEB0F2FB4D7B0EE&token=eyJraWQiOiJSNzgzRjNIOE05IiwidHlwIjoiSldUIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiIyTVA4UVdLN1I2IiwiaWF0IjoxNzIxODU1OTU0LCJleHAiOjE3MjI0OTU1OTl9.ViD505SG9QW54fv5h3iv9lQsY328OlHF-1mEPdFeNzRmqrRI137IaXlGXr2W5lR9brWG7Luej1SoEyr8beXsjw")
            .aspectRatio(.r16x9)
        """)

        Map(title: "My Map", url: "https://embed.apple-mapkit.com/v1/place?place=I2FEB0F2FB4D7B0EE&token=eyJraWQiOiJSNzgzRjNIOE05IiwidHlwIjoiSldUIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiIyTVA4UVdLN1I2IiwiaWF0IjoxNzIxODU1OTU0LCJleHAiOjE3MjI0OTU1OTl9.ViD505SG9QW54fv5h3iv9lQsY328OlHF-1mEPdFeNzRmqrRI137IaXlGXr2W5lR9brWG7Luej1SoEyr8beXsjw")
            .aspectRatio(.r16x9)
    }
}
