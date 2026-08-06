extension GitHub.Issue {
    public struct Number: Equatable, Hashable, Sendable {
        public let rawValue: UInt

        public init?(rawValue: UInt) {
            guard rawValue > 0 else { return nil }
            self.rawValue = rawValue
        }
    }
}
