extension GitHub.Page {
    public struct Number: Equatable, Hashable, Sendable {

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

extension GitHub.Page.Number {
    public static let first = Self(validated: 1)
}
