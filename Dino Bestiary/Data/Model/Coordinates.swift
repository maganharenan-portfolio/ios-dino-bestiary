//
//  Coordinates.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// A value type representing a geographical coordinate with latitude and longitude.
///
/// This struct is used to define precise positions for locations such as fossil discoveries
/// and museums.
///
/// It conforms to `Codable` for easy serialization and deserialization from JSON.
///
/// - Parameters:
///   - latitude: The latitude component of the coordinate.
///   - longitude: The longitude component of the coordinate.
///
/// Example usage:
/// ```swift
/// let location = Coordinates(latitude: 40.7813, longitude: -73.9735)
/// ```
struct Coordinates: Codable {
    
    /// The latitude value in decimal degrees.
    let latitude: Double
    
    /// The longitude value in decimal degrees.
    let longitude: Double
    
}
