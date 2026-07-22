extension GitHub.Page {
    public struct Size: Equatable, Hashable, Sendable {
        public static let maximum = Self(validated: 100)

        public let rawValue: UInt

        public init?(rawValue: UInt) {
            guard (1...100).contains(rawValue) else { return nil }
            self.rawValue = rawValue
        }

        private init(validated rawValue: UInt) {
            self.rawValue = rawValue
        }
    }
}
