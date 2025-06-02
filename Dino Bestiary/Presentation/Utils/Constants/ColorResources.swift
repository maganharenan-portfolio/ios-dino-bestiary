//
//  ColorResources.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import SwiftUI

/// A namespace for all custom color assets used in the app.
///
/// `ColorResources` provides a centralized and type-safe way to access
/// named colors defined in the asset catalog. This promotes consistency
/// across the UI and avoids hardcoding string values.
///
/// To use a color, access the `value` computed property:
///
/// ```swift
/// let background = ColorResources.cellBackground.value
/// ```
///
/// This approach supports SwiftUI theming and makes it easier to manage
/// dark mode and accessibility contrast requirements.
///
/// - Note: Each enum case corresponds to a named color in the asset catalog.
enum ColorResources: String {
    
    case collectionBackground = "CollectionBackground"
    case cellBackground       = "CellBackground"
    case splashBackground     = "SplashScreenBackground"
    
    var value: Color {
        return Color(self.rawValue)
    }
    
}
