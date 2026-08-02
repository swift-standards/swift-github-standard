extension GitHub.Collaborators.Add {
    public struct Request: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let user: GitHub.User.Login
        public let permission: GitHub.Collaborators.Permission?

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            user: GitHub.User.Login,
            permission: GitHub.Collaborators.Permission? = nil
        ) {
            self.owner = owner
            self.repository = repository
            self.user = user
            self.permission = permission
        }
    }
}
