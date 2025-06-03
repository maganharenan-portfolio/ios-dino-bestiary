//
//  DinoDetailViewSnapshotTests.swift.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//

import Testing
import SnapshotTesting
import SwiftUI
@testable import Dino_Bestiary

@Suite(.snapshots(record: .failed)) @MainActor
struct DinoDetailViewSnapshotTests {
    
    @Test func common_text() async throws {
        let view = DinoDetailView(dino: Dino.mock)
            .environment(\.isSnapshotTesting, true)
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
    @Test func verbose_text() async throws {
        let view = DinoDetailView(dino: Dino.mockVerbose)
            .environment(\.isSnapshotTesting, true)
        
        assertSnapshots(of: view, as: SnapshotPresets.all())
    }
    
    @Test func whole_screen_common_text() async throws {
        let view = DinoDetailView(dino: Dino.mock)
            .environment(\.isSnapshotTesting, true)
            .frame(width: 390, height: 1500)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
    }
    
    @Test func whole_screen_verbose_text() async throws {
        let view = DinoDetailView(dino: Dino.mockVerbose)
            .environment(\.isSnapshotTesting, true)
            .frame(width: 390, height: 2000)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
    }
    
    @Test func whole_screen_null_optionals() async throws {
        let view = DinoDetailView(dino: Dino.mockNullOptionals)
            .environment(\.isSnapshotTesting, true)
            .frame(width: 390, height: 1300)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
    }
    
}
