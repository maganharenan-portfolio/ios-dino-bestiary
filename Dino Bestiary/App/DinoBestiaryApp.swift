//
//  Dino_BestiaryApp.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

/// The main entry point for the Dino_Bestiary app.
///
/// This is the root scene that bootstraps the app by injecting
/// the initial view (`DinoFilesView`) with its `DinoFilesViewModel`,
/// using the `JSONDinoFileRepository` to load dinosaur data
/// from a local JSON file.
///
/// The app adheres to MVVM and dependency injection principles,
/// and this struct defines the scene lifecycle using SwiftUI's `App` protocol.
///
/// - SeeAlso: ``DinoFilesView``, ``DinoFilesViewModel``, ``DinoFileRepository``
@main
struct DinoBestiaryApp: App {
    var body: some Scene {
        WindowGroup {
            DinoFilesView(
                viewModel: DinoFilesViewModel(
                    repository: JSONDinoFileRepository(
                        resourceName: FileResources.dinoFiles
                    )
                )
            )
        }
    }
}
