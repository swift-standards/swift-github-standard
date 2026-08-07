extension GitHub.Collaborators {
    public struct Affiliation: Codable, Equatable, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension GitHub.Collaborators.Affiliation {
    public static let outside = Self(rawValue: "outside")
    public static let direct = Self(rawValue: "direct")
    public static let all = Self(rawValue: "all")
}
