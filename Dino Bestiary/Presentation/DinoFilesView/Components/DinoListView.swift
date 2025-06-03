//
//  DinoListView.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

/// A scrollable list view that displays a collection of dinosaurs using list-style cells.
///
/// Each list item navigates to a `DinoDetailView` when tapped and uses matched geometry
/// for smooth animated transitions between views. The list is automatically populated
/// from the provided array of `Dino` models.
///
/// - Parameters:
///   - dinos: An array of `Dino` models to render in the list.
///   - dinoFileLayout: A `Namespace.ID` used for matched geometry animations.
struct DinoListView: View {
    
    var dinos: Array<Dino>
    let dinoFileLayout: Namespace.ID
    
    var body: some View {
        List {
            ForEach(dinos) { dino in
                NavigationLink {
                    DinoDetailView(dino: dino)
                } label: {
                    DinoListCell(dino: dino, dinoFileLayout: dinoFileLayout)
                }
                .accessibilityIdentifier(AccessibilityID.dinoCell(dino.id, displayType: .list))
            }
        }
    }
    
}

#Preview {
    DinoListView(dinos: [Dino.mock], dinoFileLayout: Namespace().wrappedValue)
}
