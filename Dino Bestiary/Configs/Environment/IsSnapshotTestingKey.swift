//
//  IsSnapshotTestingKey.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//

import SwiftUI

/// A custom environment key used to determine whether the app is running snapshot tests.
///
/// This value is resolved from the environment variable `"isSnapshotTesting"`.
/// When launching snapshot tests, pass `-isSnapshotTesting true` as a launch argument.
/// This allows views to conditionally hide or mock UI elements that aren't test-friendly (e.g., maps, animations).
private struct IsSnapshotTestingKey: EnvironmentKey {
    
    /// Resolves to `true` only if the environment variable is explicitly set to `"true"`.
    /// Otherwise, it defaults to `false`.
    static let defaultValue: Bool = ProcessInfo.processInfo.environment["isSnapshotTesting"] == "true"
}

/// Provides a convenient property for views to check whether they're running in a snapshot test context.
///
/// Example usage:
/// ```swift
/// @Environment(\.isSnapshotTesting) var isSnapshotTesting
/// ```
/// This can be used to show placeholder views during snapshot testing.
extension EnvironmentValues {
    var isSnapshotTesting: Bool {
        get { self[IsSnapshotTestingKey.self] }
        set { self[IsSnapshotTestingKey.self] = newValue }
    }
}
