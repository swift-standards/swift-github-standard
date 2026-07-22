extension GitHub.Organization.Repositories {
    public struct Response: Equatable, Sendable {
        public let repositories: [GitHub.Repository.Summary]

        public init(repositories: [GitHub.Repository.Summary]) {
            self.repositories = repositories
        }
    }
}
