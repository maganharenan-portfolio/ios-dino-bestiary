//
//  Dino_BestiaryApp.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

@main
struct DinoBestiaryApp: App {
    var body: some Scene {
        WindowGroup {
            DinoFilesView(
                viewModel: DinoFilesViewModel(
                    repository: JSONDinoFileRepository(
                        resourceName: FileResources.dinoFiles.rawValue
                    )
                )
            )
        }
    }
}
