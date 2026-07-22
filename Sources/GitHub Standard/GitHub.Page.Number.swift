extension GitHub.Page {
    public struct Number: Equatable, Hashable, Sendable {
        public static let first = Self(validated: 1)

        public let rawValue: UInt

        public init?(rawValue: UInt) {
            guard rawValue > 0 else { return nil }
            self.rawValue = rawValue
        }

        private init(validated rawValue: UInt) {
            self.rawValue = rawValue
        }
    }
}
