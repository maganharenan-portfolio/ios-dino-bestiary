//
//  LocationMap.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI
import MapKit

/// A reusable map view that displays a given coordinate using SwiftUI's `Map`.
///
/// During snapshot testing (`isSnapshotTesting == true`), it displays a gray placeholder
/// instead of rendering the map to avoid flaky or inconsistent snapshots.
///
/// - Parameters:
///   - coordinate: The location to center the map on.
///   - height: The height of the map or placeholder. Defaults to `150`.
struct LocationMap: View {
    
    @Environment(\.isSnapshotTesting) var isSnapshotTesting
    let coordinates: CLLocationCoordinate2D
    let height: CGFloat

    /// The visible region shown in the map.
    /// Initialized based on the input coordinate with a fixed zoom level.
    @State private var region: MKCoordinateRegion

    init(coordinate: Coordinates, height: CGFloat = 150) {
        self.coordinates = CLLocationCoordinate2D(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )
        
        self.height = height
        self._region = State(initialValue: MKCoordinateRegion(
            center: self.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        ))
    }

    var body: some View {
        if isSnapshotTesting {
            Color.gray
                .frame(height: height)
                .cornerRadius(8)
        } else {
            Map(position: .constant(.region(region))) {
                Annotation(String(), coordinate: coordinates) {
                    MapPinShape()
                        .fill(.red)
                        .frame(width: 30, height: 44)
                }
            }
            .allowsHitTesting(false)
            .frame(height: height)
            .cornerRadius(8)
        }
    }

}

#Preview {
    LocationMap(coordinate: Coordinates(latitude: 65.8, longitude: -73.008), height: 200)
}
