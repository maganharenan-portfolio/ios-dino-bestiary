//
//  Dino_BestiaryTests.swift
//  Dino BestiaryTests
//
//  Created by Renan Maganha on 26/05/25.
//

import Testing
import Foundation
@testable import Dino_Bestiary

final class TestBundleLocator {}

@Suite
struct JSONDecodingTests {

    @Test func correct_json_returns_dinossaurs() async throws {
        let fileName   = TestFileResources.dinoFiles.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: .main)
        let dinosList  = try! await repository.getDinosList()
        
        #expect(dinosList.isEmpty == false)
    }
    
    @Test func json_with_null_optionals_returns_dinossaurs() async throws {
        let testBundle = Bundle(for: TestBundleLocator.self)
        let fileName   = TestFileResources.dinoWithOptionals.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: testBundle)
        let dinosList  = try! await repository.getDinosList()
        
        #expect(dinosList.count == 2)
    }
    
    @Test func file_not_found_throws_error() async throws {
        let fileName   = TestFileResources.invalidJSONFile.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: .main)
        
        await #expect(throws: DinoRepositoryError.fileNotFound(fileName)) {
            try await repository.getDinosList()
        }
    }
    
    @Test func invalid_json_format_throws_error() async throws {
        let testBundle   = Bundle(for: TestBundleLocator.self)
        let fileName     = TestFileResources.invalidJSONFile.rawValue
        let repository   = JSONDinoFileRepository(resourceName: fileName, bundle: testBundle)
        let genericError = NSError(domain: "-", code: 999)
        
        await #expect(throws: DinoRepositoryError.decodingError(genericError)) {
            try await repository.getDinosList()
        }
    }

}
