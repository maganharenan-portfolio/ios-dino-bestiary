//
//  StringResources.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import Foundation

/// A centralized namespace for all localized string keys used in the app.
///
/// This enum maps string resource identifiers to keys found in the app’s `.strings` files.
/// It supports both basic and formatted localization, improving consistency and reducing typos.
///
/// Example usage:
/// ```swift
/// Text(StringResources.dinoFilesTitle.localized)
/// Text(StringResources.aggressivenessValue.localized(with: 7))
/// ```
enum StringResources: String {
    
    case dinoFilesTitle       = "dino.files.title"
    case aggressivenessLabel  = "dino.detail.aggressiveness.label"
    case aggressivenessValue  = "dino.detail.aggressiveness.value"
    case descriptionLabel     = "dino.detail.description.label"
    case notableBehaviorLabel = "dino.detail.notable-behavior.label"
    case funFactLabel         = "dino.detail.fun-fact.label"
    case discoverySiteLabel   = "dino.detail.discovery-site.label"
    case fossilLocationLabel  = "dino.detail.fossil-location.label"
    case coordinatesLabel     = "dino.detail.coordinates.label"
    case collectionNotFound   = "error.dino-collection.not-found"
    case collectionUnreadable = "error.dino-collection.unreadable"
    case somethingWentWrong   = "error.something-went-wrong"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    func localized(with arguments: CVarArg...) -> String {
        String(format: self.localized, arguments: arguments)
    }
    
}
