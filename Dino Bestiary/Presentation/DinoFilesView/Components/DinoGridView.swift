//
//  DinoGridView.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

/// A responsive grid layout for displaying a list of `Dino` objects.
///
/// This view uses an adaptive `LazyVGrid` to automatically adjust the number of columns
/// based on available screen width. Ideal for both compact (iPhone) and regular (iPad) size classes.
///
/// Dinosaurs are displayed as tappable cells via `DinoGridCell`, and navigation is handled
/// through `NavigationLink` to the `DinoDetailView`.
///
/// - Parameters:
///   - dinos: An array of `Dino` models to render in the grid.
///   - dinoFileLayout: The shared `Namespace.ID` used for matched geometry effects (e.g. transitions).
///
/// Accessibility identifiers are applied for each cell to aid UI testing.
struct DinoGridView: View {
    
    var dinos: Array<Dino>
    let dinoFileLayout: Namespace.ID
    private let columns = [GridItem(.adaptive(minimum: 170), spacing: 16)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(dinos) { dino in
                    NavigationLink {
                        DinoDetailView(dino: dino)
                    } label: {
                        DinoGridCell(dino: dino, dinoFileLayout: dinoFileLayout)
                    }
                    .accessibilityIdentifier(AccessibilityID.dinoCell(dino.id, displayType: .grid))
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}
