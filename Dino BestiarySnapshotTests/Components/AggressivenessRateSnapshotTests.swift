//
//  AggressivenessRateSnapshotTests.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//

import Testing
import SnapshotTesting
import SwiftUI
@testable import Dino_Bestiary

@Suite(.snapshots(record: .failed)) @MainActor
struct AggressivenessRateSnapshotTests {
    
    @Test func test_aggressivenes_rate_states() async throws {
        let minimumFirstLevel = AggressivenessRate(rate: 0)
        let maximumFirstLevel = AggressivenessRate(rate: 4)
        let minimumSecondLevel = AggressivenessRate(rate: 5)
        let maximumSecondLevel = AggressivenessRate(rate: 8)
        let minimumThirdLevel = AggressivenessRate(rate: 9)
        let maximumThirdLevel = AggressivenessRate(rate: 10)
        
        withSnapshotTesting {
            // Light
            assertSnapshot(of: minimumFirstLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .light)))
            assertSnapshot(of: maximumFirstLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .light)))
            assertSnapshot(of: minimumSecondLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .light)))
            assertSnapshot(of: maximumSecondLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .light)))
            assertSnapshot(of: minimumThirdLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .light)))
            assertSnapshot(of: maximumThirdLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .light)))
            
            // Dark
            assertSnapshot(of: minimumFirstLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
            assertSnapshot(of: maximumFirstLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
            assertSnapshot(of: minimumSecondLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
            assertSnapshot(of: maximumSecondLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
            assertSnapshot(of: minimumThirdLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
            assertSnapshot(of: maximumThirdLevel, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
        }
    }
    
    @Test func test_aggressivenes_wrong_rate_value_dont_crash() {
        let lowerThanZero  = AggressivenessRate(rate: -4)
        let greaterThanTen = AggressivenessRate(rate: 23)
        
        withSnapshotTesting {
            assertSnapshot(of: lowerThanZero, as: .image(layout: .device(config: .iPhone13)))
            assertSnapshot(of: greaterThanTen, as: .image(layout: .device(config: .iPhone13)))
        }
    }
    
}
