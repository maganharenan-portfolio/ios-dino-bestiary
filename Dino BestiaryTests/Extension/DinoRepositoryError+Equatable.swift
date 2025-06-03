//
//  DinoRepositoryError+Equatable.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

@testable import Dino_Bestiary

extension DinoRepositoryError: @retroactive Equatable {
    
    public static func == (lhs: DinoRepositoryError, rhs: DinoRepositoryError) -> Bool {
        switch (lhs, rhs) {
        case let (.fileNotFound(a), .fileNotFound(b)):
            return a == b
        case (.decodingError, .decodingError):
            return true
        default:
            return false
        }
    }
    
}
