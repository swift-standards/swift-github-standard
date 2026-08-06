extension GitHub.Issue.State {
    public struct Reason: Codable, Equatable, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension GitHub.Issue.State.Reason {
    public static let completed = Self(rawValue: "completed")
    public static let notPlanned = Self(rawValue: "not_planned")
    public static let reopened = Self(rawValue: "reopened")
}
