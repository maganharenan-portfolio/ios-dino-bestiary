//
//  DisplayType.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//

import Foundation

/// Represents the available layout styles for displaying dinosaur items.
///
/// Use `DisplayType` to toggle between a list view and a grid view
/// depending on the user’s preference or device layout.
///
/// - `list`: Shows items in a vertical list.
/// - `grid`: Shows items in a multi-column grid.
enum DisplayType {
    case list, grid
}
