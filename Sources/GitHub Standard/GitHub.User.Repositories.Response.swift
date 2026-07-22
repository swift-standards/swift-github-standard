extension GitHub.User.Repositories {
    public struct Response: Equatable, Hashable, Sendable {
        public let repositories: [GitHub.Repository.Metadata]

        public init(repositories: [GitHub.Repository.Metadata]) {
            self.repositories = repositories
        }
    }
}
