extension GitHub.Issue {
    public struct State: Codable, Equatable, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension GitHub.Issue.State {
    public static let open = Self(rawValue: "open")
    public static let closed = Self(rawValue: "closed")
}
