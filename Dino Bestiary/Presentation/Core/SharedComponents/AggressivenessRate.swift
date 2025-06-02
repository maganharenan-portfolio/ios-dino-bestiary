//
//  AggressivenessRate.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

/// A visual component that displays a dinosaur's aggressiveness level.
///
/// This view represents aggressiveness using:
/// - An emoji to visually indicate severity:
///     🍃 for low (0–4), 🔥 for medium (5–8), 💀 for high (9–10).
/// - A progress bar whose fill reflects the value (clamped between 0 and 10).
/// - The bar's color also changes with severity:
///     green for low, orange for medium, red for high.
///
/// Values below 0 are treated as 0; values above 10 are treated as 10.
struct AggressivenessRate: View {
    
    let rate: Int
    private let minRate = 0
    private let maxRate = 10
    
    private var clampedRate: Double {
        Double(min(max(rate, minRate), maxRate))
    }
    
    var aggressivenessEmoji: String {
        switch clampedRate {
        case 0...4: return "🍃"
        case 5...8: return "🔥"
        default: return "💀"
        }
    }
    
    var aggressivenessColor: Color {
        switch clampedRate {
        case 0...4: return .green
        case 5...8: return .orange
        default: return .red
        }
    }
    
    var body: some View {
        HStack {
            Text(aggressivenessEmoji)
                .font(.caption)
            
            ProgressView(
                value: clampedRate,
                total: Double(maxRate)
            )
            .accentColor(aggressivenessColor)
        }
    }
    
}

#Preview {
    AggressivenessRate(rate: 3)
    AggressivenessRate(rate: 6)
    AggressivenessRate(rate: 10)
}
