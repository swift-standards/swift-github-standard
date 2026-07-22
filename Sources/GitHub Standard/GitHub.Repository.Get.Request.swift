extension GitHub.Repository.Get {
    public struct Request: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name
        ) {
            self.owner = owner
            self.repository = repository
        }
    }
}
