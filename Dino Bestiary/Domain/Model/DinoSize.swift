//
//  DinoSize.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// Represents the approximate physical size category of a dinosaur.
///
/// This enum is used to help classify dinosaurs based on their general body size.
/// It can influence layout decisions, icon representation, and display styling.
///
/// - Note: The size is symbolic and not based on strict measurements.
enum DinoSize: String, Codable {
    
    case tiny       = "Tiny"
    case small      = "Small"
    case medium     = "Medium"
    case large      = "Large"
    case extraLarge = "Extra Large"
    
}
