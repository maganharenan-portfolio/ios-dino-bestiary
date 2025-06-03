//
//  DinoListCellSnapshotTests.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 30/05/25.
//

import Testing
import SnapshotTesting
import SwiftUI
@testable import Dino_Bestiary

@Suite(.snapshots(record: .failed)) @MainActor
struct DinoListCellSnapshotTests {
    
    @Test func common_strings() async throws {
        let view = NamespaceWrapper { namespace in
            DinoListCell(dino: Dino.mock, dinoFileLayout: namespace)
        }
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
    @Test func verbose_strings() async throws {
        let view = NamespaceWrapper { namespace in
            DinoListCell(dino: Dino.mockVerbose, dinoFileLayout: namespace)
        }
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
}
