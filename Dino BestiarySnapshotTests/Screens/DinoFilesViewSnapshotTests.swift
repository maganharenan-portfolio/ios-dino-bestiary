//
//  DinoFilesViewSnapshotTests.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//

import Testing
import SnapshotTesting
import SwiftUI
@testable import Dino_Bestiary

@Suite(.snapshots(record: .failed)) @MainActor
struct DinoFilesViewSnapshotTests {
    
    @Test func success_fetch() async throws {
        let repository = MockDinoFileRepository()
        let view = DinoFilesView(viewModel: .init(repository: repository))
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
    @Test func empty_list() async throws {
        let repository = MockDinoFileRepository(dinos: [])
        let view = DinoFilesView(viewModel: .init(repository: repository))
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
    @Test func parse_json_error() async throws {
        let testBundle   = Bundle(for: SnapshotPresets.self)
        let fileName     = TestFileResources.invalidJSONFile.rawValue
        let repository   = JSONDinoFileRepository(resourceName: fileName, bundle: testBundle)
        let viewModel    = DinoFilesViewModel(repository: repository)
        
        await viewModel.fetchDinos()
        
        let view = DinoFilesView(viewModel: viewModel)
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
    @Test func missing_json_error() async throws {
        let fileName     = TestFileResources.missingJSONFile.rawValue
        let repository   = JSONDinoFileRepository(resourceName: fileName)
        let viewModel    = DinoFilesViewModel(repository: repository)
        
        await viewModel.fetchDinos()
        
        let view = DinoFilesView(viewModel: viewModel)
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }

}
