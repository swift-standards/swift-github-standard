extension GitHub.Repository.Stargazers {
    public struct Response: Equatable, Hashable, Sendable {
        public let stargazers: [Stargazer]

        public init(stargazers: [Stargazer]) {
            self.stargazers = stargazers
        }
    }
}
