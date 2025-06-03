//
//  Dino.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// A model representing a dinosaur entity with rich descriptive data.
///
/// `Dino` encapsulates various properties to describe a dinosaur, including its biological
/// classification, time period, size, and additional facts. It conforms to `Codable`
/// for JSON parsing and `Identifiable` for use in SwiftUI lists.
///
/// JSON keys are mapped to Swift-style property names via the `CodingKeys` enum.
///
/// - Properties:
///   - id: A unique identifier for the dinosaur.
///   - name: The dinosaur's display name.
///   - classification: Its dietary classification (e.g., herbivore, carnivore).
///   - size: General body size (e.g., small, medium, large).
///   - period: The historical period when this dinosaur lived.
///   - aggressiveness: A scale from 0 to 10 indicating how dangerous it was.
///   - description: A general description of the dinosaur.
///   - notableBehaviour: Optional unique or standout behavior.
///   - funFact: An optional fun or surprising fact.
///   - discoverySite: Optional site where fossils were discovered.
///   - fossilLocation: Optional current location of the fossil.
///   - imageURL: Optional image link for illustration purposes.
struct Dino: Codable, Identifiable {
    
    let id: String
    let name: String
    let classification: DinoClassification
    let size: DinoSize
    let period: Period
    let aggressiveness: Int
    let description: String
    let notableBehaviour: String?
    let funFact: String?
    let discoverySite: DiscoverySite?
    let fossilLocation: FossilLocation?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, classification, size, period, aggressiveness, description
        case notableBehaviour = "notable_behavior"
        case funFact = "fun_fact"
        case discoverySite = "discovery_site"
        case fossilLocation = "fossil_location"
        case imageURL = "image_url"
    }
    
}
