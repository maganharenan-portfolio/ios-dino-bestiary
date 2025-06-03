//
//  JSONDinoFileRepository.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// A concrete implementation of `DinoFileRepository` that loads dinosaur data from a local JSON file.
///
/// This repository reads and decodes a JSON file bundled with the app into an array of `Dino` objects.
/// It includes a simple caching mechanism to avoid redundant reads.
///
/// Usage:
/// ```swift
/// let repository = JSONDinoFileRepository(resourceName: "dino-files")
/// let dinos = try await repository.getDinosList()
/// ```
///
/// - Note: The JSON file must be included in the app bundle and match the expected format.
/// - Throws: `DinoRepositoryError.fileNotFound` if the resource doesn't exist,
///           `DinoRepositoryError.decodingError` if decoding fails.
final class JSONDinoFileRepository: DinoFileRepository {
    
    private var cache: Array<Dino>? = nil
    private let bundle: Bundle
    private let resourceName: String
    
    /// Initializes a new instance using the specified resource name and bundle.
    ///
    /// - Parameters:
    ///   - resourceName: The name of the JSON resource file (without `.json` extension).
    ///   - bundle: The bundle where the file is located. Defaults to `.main`.
    init(resourceName: String, bundle: Bundle = .main) {
        self.resourceName = resourceName
        self.bundle = bundle
    }
    
    /// Returns the list of dinosaurs loaded from the JSON file.
    ///
    /// This method caches the data after the first load.
    /// - Returns: An array of `Dino` objects.
    /// - Throws: A `DinoRepositoryError` if the file is missing or decoding fails.
    func getDinosList() async throws -> Array<Dino> {
        if cache == nil {
            do {
                try await loadCache()
            } catch {
                throw error
            }
        }
        
        return cache ?? .init()
    }
    
    /// Loads and caches the dinosaur data from the JSON file asynchronously.
    ///
    /// - Throws: `DinoRepositoryError.fileNotFound` or `DinoRepositoryError.decodingError`.
    private func loadCache() async throws {
        guard let url = bundle.url(forResource: self.resourceName, withExtension: "json") else {
            throw DinoRepositoryError.fileNotFound(self.resourceName)
        }
        
        do {
            let dinos = try await Task.detached(priority: .userInitiated) {
                let data = try Data(contentsOf: url)
                return try JSONDecoder().decode(Array<Dino>.self, from: data)
            }.value

            self.cache = dinos
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            throw DinoRepositoryError.decodingError(error)
        }
    }
    
}
