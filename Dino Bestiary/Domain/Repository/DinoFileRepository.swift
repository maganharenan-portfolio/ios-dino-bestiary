//
//  DinoFileRepository.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// A repository abstraction that provides access to dinosaur data.
///
/// Implementations of this protocol are responsible for retrieving
/// dinosaur lists from a data source, such as a local JSON file, remote API, or mock.
///
/// This abstraction promotes testability and decouples the domain logic
/// from specific data access implementations.
protocol DinoFileRepository {
    
    /// Retrieves the full list of dinosaurs.
    ///
    /// - Returns: An array of `Dino` objects.
    /// - Throws: A `DinoRepositoryError` if loading or decoding fails.
    func getDinosList() async throws -> Array<Dino>
    
}
