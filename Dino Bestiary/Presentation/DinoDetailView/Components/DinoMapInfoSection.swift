//
//  DinoMapInfoSection.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//

import SwiftUI

/// A view that displays a dinosaur-related location section, including a title,
/// a location name (with optional website link), an embedded map, and geographic coordinates.
///
/// This section is commonly used to show discovery sites or fossil locations
/// in the dinosaur detail view.
///
/// Features:
/// - Displays a tappable link if a valid `website` URL is provided.
/// - Shows a `LocationMap` unless the app is running in snapshot testing mode (gray placeholder instead).
/// - Shows the coordinates formatted via localized string.
///
/// Example usage:
/// ```swift
/// DinoMapInfoSection(
///     title: "Discovery Site",
///     place: "Gobi Desert, Mongolia",
///     coordinates: Coordinates(latitude: 44.5, longitude: 103.5),
///     website: "https://example.com"
/// )
/// ```
///
/// > Note: Uses `.environment(\.isSnapshotTesting)` to determine map rendering mode.
struct DinoMapInfoSection: View {
    
    @Environment(\.isSnapshotTesting) var isSnapshotTesting
    let title: String
    let place: String
    let coordinates: Coordinates
    let website: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)

            if let website = website, let locationURL = URL(string: website) {
                Link(destination: locationURL) {
                    HStack {
                        Image(systemName: IconResources.websiteIcon.rawValue)
                            .imageScale(.small)
                        
                        Text(place)
                            .font(.subheadline)
                    }
                }
            } else {
                Text(place)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            LocationMap(coordinate: coordinates)
                .padding(.vertical, 8)
                .environment(\.isSnapshotTesting, isSnapshotTesting)

            Text(StringResources.coordinatesLabel.localized(with:
                coordinates.latitude,
                coordinates.longitude)
            )
            .font(.caption)
            .foregroundColor(.secondary.opacity(0.6))
        }
    }
    
}
