//
//  DinoListViewModelTests.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import Testing
import Foundation
@testable import Dino_Bestiary

@Suite
struct DinoListViewModelTests {
    
    @Test func fetchDinos_success() async throws {
        let fileName   = TestFileResources.dinoFiles.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: .main)
        let viewModel  = DinoFilesViewModel(repository: repository)
        
        await viewModel.fetchDinos()
        
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.dinoList.count > 0)
    }
    
    @Test func fetchDinos_failure_file_not_found() async throws {
        let fileName   = TestFileResources.missingJSONFile.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: .main)
        let viewModel  = DinoFilesViewModel(repository: repository)
        
        await viewModel.fetchDinos()
        
        let expectedError = StringResources.collectionNotFound.localized
        
        #expect(viewModel.errorMessage == expectedError)
        #expect(viewModel.dinoList.isEmpty)
    }
    
    @Test func fetchDinos_failure_invalid_json() async throws {
        let testBundle = Bundle(for: TestBundleLocator.self)
        let fileName   = TestFileResources.invalidJSONFile.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: testBundle)
        let viewModel  = DinoFilesViewModel(repository: repository)
        
        await viewModel.fetchDinos()
        
        let expectedError = StringResources.collectionUnreadable.localized
        
        #expect(viewModel.errorMessage == expectedError)
        #expect(viewModel.dinoList.isEmpty)
    }
    
    @Test func toggleDisplayType_switch_display_type() {
        let fileName   = TestFileResources.dinoFiles.rawValue
        let repository = JSONDinoFileRepository(resourceName: fileName, bundle: .main)
        let viewModel  = DinoFilesViewModel(repository: repository)
        
        #expect(viewModel.displayType == .list)
        
        viewModel.toggleDisplayType()
        
        #expect(viewModel.displayType == .grid)
        
        viewModel.toggleDisplayType()
        
        #expect(viewModel.displayType == .list)
    }
    
}
