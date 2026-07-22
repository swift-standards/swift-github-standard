import RFC_3339

extension GitHub.Repository.Stargazers {
    public struct Stargazer: Equatable, Hashable, Sendable {
        public let user: GitHub.User.Summary
        public let starredAt: RFC_3339.DateTime

        public init(
            user: GitHub.User.Summary,
            starredAt: RFC_3339.DateTime
        ) {
            self.user = user
            self.starredAt = starredAt
        }
    }
}
