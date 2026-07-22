extension GitHub.Repository.Content {
    public struct Request: Equatable, Hashable, Sendable {
        public let organization: GitHub.Organization.Name
        public let repository: GitHub.Repository.Name
        public let path: Path

        public init(
            organization: GitHub.Organization.Name,
            repository: GitHub.Repository.Name,
            path: Path
        ) {
            self.organization = organization
            self.repository = repository
            self.path = path
        }
    }
}
