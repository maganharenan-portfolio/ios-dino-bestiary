//
//  JSONDinoFileRepository 2.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//


final class JSONDinoFileRepository: DinoFileRepository {
    
    private var cache: Array<Dino>? = nil
    private let bundle: Bundle
    private let resourceName: String
    
    init(resourceName: String, bundle: Bundle = .main) {
        self.resourceName = resourceName
        self.bundle = bundle
    }
    
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