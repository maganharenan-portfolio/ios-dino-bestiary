//
//  DiscoverySite.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// Represents the geographic site where a dinosaur fossil was originally discovered.
///
/// This is typically used to provide historical or contextual information
/// in the detail view of a dinosaur.
///
/// - Properties:
///   - location: A descriptive name of the discovery site (e.g., "Gobi Desert, Mongolia").
///   - coordinates: The geographic coordinates of the site.
struct DiscoverySite: Codable {
    
    let location: String
    let coordinates: Coordinates
    
}
