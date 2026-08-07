extension GitHub.Collaborators {
    public struct Collaborator: Equatable, Hashable, Sendable {
        public let user: GitHub.User.Summary
        public let permissions: Permissions
        public let roleName: String

        public init(
            user: GitHub.User.Summary,
            permissions: Permissions,
            roleName: String
        ) {
            self.user = user
            self.permissions = permissions
            self.roleName = roleName
        }
    }
}
