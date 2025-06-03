//
//  FossilLocation.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// Represents the current location where a dinosaur fossil is displayed or stored.
///
/// Useful for showing museum or exhibition info in the app UI, along with geographic and web references.
///
/// - Properties:
///   - name: The name of the location (e.g., museum or institution).
///   - coordinates: The geographic coordinates of the location.
///   - website: A URL string pointing to the official website or page of the location.
struct FossilLocation: Codable {
    
    let name: String
    let coordinates: Coordinates
    let website: String
    
}
