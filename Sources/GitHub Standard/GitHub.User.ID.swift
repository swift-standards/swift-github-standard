extension GitHub.User {
    public struct ID: Equatable, Hashable, Sendable {
        public let rawValue: UInt64

        public init(rawValue: UInt64) {
            // swift-linter:disable:next raw value access
            // REASON: brand owner boundary, [LINT-EXCLUDE-001] — the newtype's
            //   own declaration assigns its stored raw value.
            self.rawValue = rawValue
        }
    }
}
