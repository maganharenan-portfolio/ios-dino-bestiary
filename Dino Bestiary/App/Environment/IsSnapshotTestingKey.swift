private struct IsSnapshotTestingKey: EnvironmentKey {
    static let defaultValue: Bool = ProcessInfo.processInfo.environment["isSnapshotTesting"] == "true"
}

extension EnvironmentValues {
    var isSnapshotTesting: Bool {
        get { self[IsSnapshotTestingKey.self] }
        set { self[IsSnapshotTestingKey.self] = newValue }
    }
}