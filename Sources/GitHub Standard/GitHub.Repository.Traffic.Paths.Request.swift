extension GitHub.Repository.Traffic.Paths {
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
