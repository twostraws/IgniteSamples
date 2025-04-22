//
// User.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//
import Foundation

struct User {
    var name: String
    var address: String
    var city: String
    var state: String

    static let examples = [
        User(name: "Taylor Swift", address: "555, Swiftie Avenue", city: "Nashville", state: "Tennessee"),
        User(name: "Adele Adkins", address: "Caesars Palace", city: "Las Vegas", state: "Nevada"),
        User(name: "Tim Cook", address: "Apple Park", city: "Cupertino", state: "California")
    ]
}
