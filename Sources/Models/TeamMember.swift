//
// TeamMember.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation

struct TeamMember {
    var name: String
    var occupation: String
    var favoriteFood: String
    var secretHobby: String

    static let examples = [
        TeamMember(name: "Bob Blob", occupation: "Underwater Baker", favoriteFood: "Seaweed Scones", secretHobby: "Collecting Rubber Ducks"),
        TeamMember(name: "Sally Sizzle", occupation: "Firefighter Chef", favoriteFood: "Spicy Ice Cream", secretHobby: "Volcano Surfing"),
        TeamMember(name: "Greg Grumble", occupation: "Grumpy Florist", favoriteFood: "Thorny Roses Salad", secretHobby: "Whispering to Snails")
    ]
}
