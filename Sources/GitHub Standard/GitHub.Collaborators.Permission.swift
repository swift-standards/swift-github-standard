extension GitHub.Collaborators {
    /// A repository role accepted when adding a collaborator.
    ///
    /// GitHub organizations can define custom roles, so unknown wire values are
    /// preserved rather than constrained to the built-in roles.
    public struct Permission: Codable, Equatable, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension GitHub.Collaborators.Permission {
    public static let pull = Self(rawValue: "pull")
    public static let triage = Self(rawValue: "triage")
    public static let push = Self(rawValue: "push")
    public static let maintain = Self(rawValue: "maintain")
    public static let admin = Self(rawValue: "admin")
}
