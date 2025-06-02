//
//  DinoListViewModel.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

final class DinoListViewModel: ObservableObject {
    
    @Published var dinoList: Array<Dino> = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let repository: DinoFileRepository
    
    init(repository: DinoFileRepository) {
        self.repository = repository
    }
    
    @MainActor func fetchDinos() async {
        isLoading = true
        
        do {
            dinoList = try await repository.getDinosList()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
