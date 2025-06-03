//
//  DinoListViewModel.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

/// The view model responsible for managing and exposing dinosaur data to the view layer.
///
/// This class handles:
/// - Fetching dinosaur data from a repository
/// - Managing loading and error states
/// - Toggling between list and grid display modes
///
/// Use this class as the data source for the `DinoFilesView`.
///
/// - Note:
///   This view model is `@MainActor` aware and should be used in SwiftUI views directly.
///
/// - Important:
///   Display mode is exposed as `private(set)` and can be toggled via `toggleDisplayType()`.
final class DinoFilesViewModel: ObservableObject {
    
    @Published var dinoList: Array<Dino> = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published private(set) var displayType: DisplayType = .list
    
    private let repository: DinoFileRepository
    
    init(repository: DinoFileRepository) {
        self.repository = repository
    }
    
    /// Fetches the dinosaur list from the ``DinoFileRepository`` and updates the ``dinoList``.
    ///
    /// Handles repository-specific errors and sets
    /// appropriate localized user-facing error messages.
    ///
    /// Call this method from a `.task` modifier or `onAppear` within the SwiftUI view.
    ///
    /// - Note:
    ///   This function must be called from the main actor.
    @MainActor func fetchDinos() async {
        isLoading = true
        
        do {
            dinoList = try await repository.getDinosList()
        } catch DinoRepositoryError.decodingError(_) {
            errorMessage = StringResources.collectionUnreadable.localized
        } catch DinoRepositoryError.fileNotFound {
            errorMessage = StringResources.collectionNotFound.localized
        } catch {
            errorMessage = StringResources.somethingWentWrong.localized
        }
        
        isLoading = false
    }
    
    /// Toggles between grid and list display modes.
    func toggleDisplayType() {
        displayType = displayType == .grid ? .list : .grid
    }
    
}
