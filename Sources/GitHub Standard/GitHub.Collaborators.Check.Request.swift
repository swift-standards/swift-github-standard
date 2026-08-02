extension GitHub.Collaborators.Check {
    public struct Request: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let user: GitHub.User.Login

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            user: GitHub.User.Login
        ) {
            self.owner = owner
            self.repository = repository
            self.user = user
        }
    }
}
