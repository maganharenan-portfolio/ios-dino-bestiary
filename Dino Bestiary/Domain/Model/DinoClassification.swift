//
//  DinoClassification.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// Represents the dietary classification of a dinosaur.
///
/// This enum helps categorize dinosaurs by the primary type of food they consumed.
///
/// Used throughout the app for filtering, displaying icons, or applying color-coded dietary tags.
enum DinoClassification: String, Codable {
    
    case herbivore     = "Herbivore"
    case carnivore     = "Carnivore"
    case omnivore      = "Omnivore"
    case piscivore     = "Piscivore"
    case insectivore   = "Insectivore"
    
}
