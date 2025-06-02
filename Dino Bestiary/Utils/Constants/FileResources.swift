//
//  FileResources.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//

/// An enumeration of bundled file resources used in the app.
///
/// This enum provides a type-safe way to reference internal resource files,
/// such as JSON files for loading dinosaur data.
///
/// Example usage:
/// ```swift
/// let fileName = FileResources.dinoFiles
/// ```
enum FileResources {
    /// The main JSON file containing the list of dinosaurs.
    static let dinoFiles = "dino-files"
}
