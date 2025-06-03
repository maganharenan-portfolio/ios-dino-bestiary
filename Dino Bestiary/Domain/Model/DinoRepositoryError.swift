//
//  DinoRepositoryError.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import Foundation

/// An error type representing possible failures when loading and decoding dinosaur data.
enum DinoRepositoryError: Error, LocalizedError {
    
    /// Indicates that the expected JSON file was not found in the specified bundle.
    ///
    /// - Parameter name: The name of the missing resource file.
    case fileNotFound(String)
    
    /// Indicates a failure to decode the JSON data into an array of `Dino` objects.
    ///
    /// - Parameter error: The underlying decoding error.
    case decodingError(Error)

    /// A localized message describing what error occurred.
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let name):
            return "Resource file '\(name).json' not found in bundle."
        case .decodingError(let error):
            return "Failed to decode Dino list: \(error.localizedDescription)"
        }
    }
    
}
