//
//  DinoListCell.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

/// A list-style cell view that displays concise information about a single dinosaur.
///
/// This component presents the dinosaur’s image, name, classification and period,
/// along with an aggressiveness indicator. It uses matched geometry for smooth transitions
/// when navigating to the detail screen.
///
/// - Layout:
///   - Left: Dino image
///   - Right (VStack): Name, metadata, and aggressiveness
///
/// - Parameters:
///   - dino: The `Dino` model to display.
///   - dinoFileLayout: The shared namespace used for geometry matching in animations.
struct DinoListCell: View {
    
    var dino: Dino
    let dinoFileLayout: Namespace.ID
    
    var body: some View {
        HStack {
            SafeAsyncImage(urlString: dino.imageURL, size: 60)
                .frame(width: 80)
                .matchedGeometryEffect(
                    id: MatchedGeometryResources.image(dino.id),
                    in: dinoFileLayout
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(dino.name)
                    .font(.title3.bold())
                    .lineLimit(1)
                    .matchedGeometryEffect(
                        id: MatchedGeometryResources.name(dino.id),
                        in: dinoFileLayout
                    )
                
                Text(dino.classificationAndPeriodText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .matchedGeometryEffect(
                        id: MatchedGeometryResources.meta(dino.id),
                        in: dinoFileLayout
                    )
                
                AggressivenessRate(rate: dino.aggressiveness)
                    .matchedGeometryEffect(
                        id: MatchedGeometryResources.aggro(dino.id),
                        in: dinoFileLayout
                    )
            }
            .padding(.leading)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ColorResources.cellBackground.value)
        .listRowBackground(ColorResources.cellBackground.value)
        .matchedGeometryEffect(
            id: MatchedGeometryResources.container(dino.id),
            in: dinoFileLayout
        )
    }
    
}
