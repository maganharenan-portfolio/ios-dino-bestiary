//
//  Dino+Presentation.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

extension Dino {
    
    /// A short text describing the dinosaur’s classification and the historical period it lived in.
    ///
    /// Useful for subtitle or metadata labels in list/grid views.
    ///
    /// Example: `"Carnivore • Late Cretaceous"`
    var classificationAndPeriodText: String {
        "\(classification.rawValue.capitalized) • \(period.rawValue.capitalized)"
    }
    
    /// A descriptive string combining the dinosaur's classification, size, and historical period.
    ///
    /// This provides a more complete summary, often used in detail views or compact metadata displays.
    ///
    /// Example: `"Carnivore • Medium • Late Cretaceous"`
    var dinoMetaDataText: String {
        "\(classification.rawValue.capitalized) • \(size.rawValue.capitalized) • \(period.rawValue.capitalized)"
    }
    
}
