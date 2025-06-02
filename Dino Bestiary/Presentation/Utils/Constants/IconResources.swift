//
//  IconResources.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

/// A collection of system icon names used across the Dino Bestiary app.
///
/// This enum helps to centralize and standardize the usage of SF Symbols,
/// such as display type toggles and external link indicators.
///
/// - Note: The values refer to SF Symbol names.
///
/// Example:
/// ```swift
/// Image(systemName: IconResources.displayTypeGrid.rawValue)
/// ```
enum IconResources: String {
    
    case displayTypeGrid = "square.grid.2x2"
    case displayTypeList = "list.bullet"
    case websiteIcon     = "globe"
    
    /// Returns the appropriate icon based on the current `DisplayType`.
    ///
    /// - Parameter type: The current display mode.
    /// - Returns: The system icon name representing the opposite layout (used to toggle).
    static func getDisplayTypeIcon(type: DisplayType) -> String {
        return type == .grid ? displayTypeList.rawValue : displayTypeGrid.rawValue
    }
    
}
