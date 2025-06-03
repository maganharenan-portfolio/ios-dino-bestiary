//
//  Period.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// Represents the geological time periods associated with dinosaur existence.
///
/// The periods are organized chronologically across the main eras where dinosaurs are known to have lived,
/// including Permian, Triassic, Jurassic, and Cretaceous.
///
/// These cases are used to categorize the era in which a specific dinosaur lived.
enum Period: String, Codable {
    // Permian
    case earlyPermian  = "Early Permian"
    case permian       = "Permian"
    case latePermian   = "Late Permian"
    
    // Triassic
    case earlyTriassic  = "Early Triassic"
    case triassic       = "Triassic"
    case lateTriassic   = "Late Triassic"
    
    // Jurassic
    case earlyJurassic  = "Early Jurassic"
    case jurassic       = "Jurassic"
    case lateJurassic   = "Late Jurassic"
    
    // Cretaceous
    case earlyCretaceous  = "Early Cretaceous"
    case cretaceous       = "Cretaceous"
    case lateCretaceous   = "Late Cretaceous"
}
