//
//  MockDinoFileRepository 2.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//

/// A mock implementation of `DinoFileRepository` used for testing purposes.
///
/// This mock provides a configurable list of dinosaurs, allowing snapshot tests,
/// UI previews, and unit tests to run without depending on real file data.
///
/// You can pass a custom list of `Dino` objects, or rely on the default array of mocks.
///
/// Example usage:
/// ```swift
/// let repository = MockDinoFileRepository()
/// let dinos = try await repository.getDinosList()
/// ```
///
/// - Note: This mock always returns immediately without throwing errors.
final class MockDinoFileRepository: DinoFileRepository {
    
    private var dinos: Array<Dino>
    
    /// Creates a new instance of the mock repository with a list of dinosaurs.
    ///
    /// - Parameter dinos: The list of dinos to return in tests. Defaults to 10 `.mock` instances.
    init(dinos: Array<Dino> = Dino.mockArray) {
        self.dinos = dinos
    }
    
    /// Returns the mock list of dinosaurs.
    func getDinosList() async throws -> Array<Dino> {
        return dinos
    }
    
}
