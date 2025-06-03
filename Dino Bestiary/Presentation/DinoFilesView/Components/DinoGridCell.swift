//
//  DinoGridCell.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

/// A visual representation of a single dinosaur in a grid cell layout.
///
/// This cell showcases the dinosaur's name, image, classification/period metadata,
/// and an `AggressivenessRate` indicator. It's styled with rounded corners and
/// uses matched geometry effects to enable smooth transitions to detail views.
///
/// The layout is layered using a `ZStack`:
/// - Top: Name
/// - Center: Image
/// - Bottom: Metadata and aggressiveness bar
///
/// - Parameters:
///   - dino: The `Dino` model containing display information.
///   - dinoFileLayout: The shared `Namespace.ID` used for `matchedGeometryEffect`.
///
/// Each subview is associated with a unique matched geometry ID to enable fluid animations.
struct DinoGridCell: View {
    
    let dino: Dino
    let dinoFileLayout: Namespace.ID
    
    var body: some View {
        ZStack {
            Text(dino.name)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 5)
                .matchedGeometryEffect(
                    id: MatchedGeometryResources.name(dino.id),
                    in: dinoFileLayout
                )
            
            SafeAsyncImage(urlString: dino.imageURL, size: 120)
                .matchedGeometryEffect(
                    id: MatchedGeometryResources.image(dino.id),
                    in: dinoFileLayout
                )
            
            VStack {
                Text(dino.classificationAndPeriodText)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .matchedGeometryEffect(
                        id: MatchedGeometryResources.meta(dino.id),
                        in: dinoFileLayout
                    )
                
                AggressivenessRate(rate: dino.aggressiveness)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
                    .matchedGeometryEffect(
                        id: MatchedGeometryResources.aggro(dino.id),
                        in: dinoFileLayout
                    )
                    
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
        .frame(height: 240)
        .frame(minWidth: 170, maxWidth: 200)
        .background(ColorResources.cellBackground.value)
        .cornerRadius(8)
        .clipped()
        .matchedGeometryEffect(
            id: MatchedGeometryResources.container(dino.id),
            in: dinoFileLayout
        )
    }
    
}

#Preview {
    @Previewable @Namespace var previewNamespace
    
    ZStack {
        DinoGridCell(dino: Dino.mock, dinoFileLayout: previewNamespace)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray)
}
