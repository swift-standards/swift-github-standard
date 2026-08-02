extension GitHub.Collaborators {
    /// The base-role permissions reported for a collaborator.
    public struct Permissions: Equatable, Hashable, Sendable {
        public let pull: Bool
        public let triage: Bool
        public let push: Bool
        public let maintain: Bool
        public let admin: Bool

        // REASON: GitHub wire booleans; each parameter is a 1:1 provider field.
        public init(
            pull: Bool,  // swift-linter:disable:line bool public parameter
            triage: Bool,  // swift-linter:disable:line bool public parameter
            push: Bool,  // swift-linter:disable:line bool public parameter
            maintain: Bool,  // swift-linter:disable:line bool public parameter
            admin: Bool  // swift-linter:disable:line bool public parameter
        ) {
            self.pull = pull
            self.triage = triage
            self.push = push
            self.maintain = maintain
            self.admin = admin
        }
    }
}
