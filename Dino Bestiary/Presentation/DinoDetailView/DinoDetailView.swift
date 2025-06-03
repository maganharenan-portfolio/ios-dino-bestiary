//
//  DinoDetailView.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI
import MapKit

/// A detailed view that presents rich, structured information about a specific dinosaur.
///
/// `DinoDetailView` showcases:
/// - A header image (with placeholder fallback)
/// - The dinosaur's name and basic metadata (classification, size, period)
/// - A visual aggressiveness meter with emoji and color-coded progress
/// - Sections for description, notable behavior, and fun facts
/// - Discovery and fossil map locations, conditionally rendered
///
/// The view supports:
/// - Snapshot testing mode via `@Environment(\.isSnapshotTesting)`
/// - Accessibility identifiers for UI testing
/// - Dynamic layout using `ScrollView` and flexible vertical stacking
///
/// - Parameters:
///   - dino: The `Dino` instance to display in detail.
///
/// Example usage:
/// ```swift
/// DinoDetailView(dino: myDino)
/// ```
struct DinoDetailView: View {
    
    @Environment(\.isSnapshotTesting) var isSnapshotTesting
    let dino: Dino

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                SafeAsyncImage(urlString: dino.imageURL, size: 240)
                    .frame(maxWidth: .infinity, alignment: .center)

                VStack(alignment: .leading, spacing: 4) {
                    Text(dino.name)
                        .font(.largeTitle)
                        .bold()

                    Text("\(dino.classification.rawValue.capitalized) • \(dino.size.rawValue.capitalized) • \(dino.period.rawValue.capitalized)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(StringResources.aggressivenessLabel.localized)
                        .font(.headline)

                    AggressivenessRate(rate: dino.aggressiveness)
                    
                    Text(StringResources.aggressivenessValue.localized(
                        with: dino.aggressiveness)
                    )
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Divider()

                if !dino.description.isEmpty {
                    DinoInfoSection(
                        title: StringResources.descriptionLabel.localized,
                        text: dino.description
                    )
                }

                if let behavior = dino.notableBehaviour {
                    DinoInfoSection(
                        title: StringResources.notableBehaviorLabel.localized,
                        text: behavior
                    )
                }

                if let fact = dino.funFact {
                    DinoInfoSection(
                        title: StringResources.funFactLabel.localized,
                        text: fact
                    )
                }

                if let site = dino.discoverySite {
                    DinoMapInfoSection(
                        title: StringResources.discoverySiteLabel.localized,
                        place: site.location,
                        coordinates: site.coordinates,
                        website: nil
                    )
                    .environment(\.isSnapshotTesting, isSnapshotTesting)
                }

                if let fossil = dino.fossilLocation {
                    DinoMapInfoSection(
                        title: StringResources.fossilLocationLabel.localized,
                        place: fossil.name,
                        coordinates: fossil.coordinates,
                        website: fossil.website
                    )
                    .environment(\.isSnapshotTesting, isSnapshotTesting)
                }
            }
            .padding()
        }
        .accessibilityIdentifier(AccessibilityID.dinoDetail(dino.id))
        .navigationTitle(dino.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DinoDetailView(dino: Dino.mock)
}
