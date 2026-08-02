extension GitHub.Collaborators.Permission.Get {
    public struct Response: Equatable, Hashable, Sendable {
        public let permission: String
        public let roleName: String
        public let user: GitHub.User.Summary

        public init(permission: String, roleName: String, user: GitHub.User.Summary) {
            self.permission = permission
            self.roleName = roleName
            self.user = user
        }
    }
}
