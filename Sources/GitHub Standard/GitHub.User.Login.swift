extension GitHub.User {
    public struct Login: Equatable, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            // swift-linter:disable:next raw value access
            // REASON: brand owner boundary, [LINT-EXCLUDE-001] — the newtype's
            //   own declaration assigns its stored raw value.
            self.rawValue = rawValue
        }
    }
}
