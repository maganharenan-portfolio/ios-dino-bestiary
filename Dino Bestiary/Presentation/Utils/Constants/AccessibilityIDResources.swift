//
//  AccessibilityIDResources.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//

/// A centralized namespace for all accessibility identifiers used throughout the app.
///
/// These identifiers help improve testability and accessibility by assigning stable,
/// readable values to UI elements. Particularly useful for UI tests and VoiceOver support.
///
/// ## Static Identifiers:
/// - `toggleDisplayButton`: The toggle button for switching between grid and list views.
/// - `detailAggressivenessLabel`: The label displaying the aggressiveness value in the detail screen.
/// - `gridCell`: A generic identifier used for a dinosaur cell in grid view.
/// - `listCell`: A generic identifier used for a dinosaur cell in list view.
///
/// ## Dynamic Identifiers:
/// - `dinoCell(_:displayType:)`: Returns a unique identifier for a dinosaur cell,
///   combining the dino's ID with the display type (grid or list).
/// - `dinoDetail(_:)`: Returns a unique identifier for a dinosaur detail view.
///
/// Use these identifiers when writing accessibility tests or configuring `accessibilityIdentifier`
/// properties in views to maintain consistency.
enum AccessibilityID {
    
    static let toggleDisplayButton = "toggleDisplayButton"
    static let detailAggressivenessLabel = "detail-aggressiveness-label"
    static let gridCell = "gridCell"
    static let listCell = "listCell"
    
    static func dinoCell(_ id: String, displayType: DisplayType) -> String {
        return "\(id)-\(displayType == .grid ? gridCell : listCell)"
    }
    
    static func dinoDetail(_ id: String) -> String {
        return "\(id)-details"
    }
    
}
