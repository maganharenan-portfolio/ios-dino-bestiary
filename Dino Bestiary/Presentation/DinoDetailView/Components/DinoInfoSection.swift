//
//  DinoInfoSection.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//

import SwiftUI

/// A reusable UI component that displays a labeled section of dinosaur-related text information.
///
/// Commonly used in detail views to show descriptions, behaviors, and fun facts
/// about each dinosaur in a structured and visually distinct block.
///
/// Features:
/// - A bolded `title` as a header.
/// - A secondary-colored `text` below it.
/// - A `Divider` at the bottom to visually separate sections.
///
/// Example usage:
/// ```swift
/// DinoInfoSection(
///     title: "Fun Fact",
///     text: "Velociraptors were only about the size of a turkey!"
/// )
/// ```
struct DinoInfoSection: View {
    
    let title: String
    let text:  String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
            
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Divider()
                .padding(.top, 12)
        }
    }
    
}
