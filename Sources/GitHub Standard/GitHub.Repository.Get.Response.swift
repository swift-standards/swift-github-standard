extension GitHub.Repository.Get {
    public struct Response: Equatable, Hashable, Sendable {
        public let repository: GitHub.Repository.Metadata

        public init(repository: GitHub.Repository.Metadata) {
            self.repository = repository
        }
    }
}
