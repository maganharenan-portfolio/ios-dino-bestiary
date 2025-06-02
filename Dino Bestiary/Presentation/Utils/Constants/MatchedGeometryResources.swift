//
//  MatchedGeometryResources.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import Foundation

/// A namespace providing identifier strings for matched geometry effects.
///
/// This enum generates unique `String` identifiers based on a dinosaur’s ID,
/// which are used to synchronize animations between different views using
/// `matchedGeometryEffect`.
///
/// Example:
/// ```swift
/// .matchedGeometryEffect(id: MatchedGeometryResources.image(dino.id), in: namespace)
/// ```
enum MatchedGeometryResources {
    
    /// Identifier for the dino's name label.
    static func name(_ id: String) -> String {
        return "name-\(id)"
    }
    
    /// Identifier for the dino's image.
    static func image(_ id: String) -> String {
        return "image-\(id)"
    }
    
    /// Identifier for the metadata section (e.g. size, period).
    static func meta(_ id: String) -> String {
        return "meta-\(id)"
    }
    
    /// Identifier for the aggressiveness indicator.
    static func aggro(_ id: String) -> String {
        return "aggro-\(id)"
    }
    
    /// Identifier for the outer container wrapping the cell or detail view.
    static func container(_ id: String) -> String {
        return "container-\(id)"
    }
    
}
