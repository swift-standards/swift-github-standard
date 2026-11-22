public import RFC_3339

extension GitHub.Repository.Stargazers {
    public struct Stargazer: Equatable, Hashable, Sendable {
        public let user: GitHub.User.Summary
        public let starredAt: IETF.RFC.`3339`.DateTime

        public init(
            user: GitHub.User.Summary,
            starredAt: IETF.RFC.`3339`.DateTime
        ) {
            self.user = user
            self.starredAt = starredAt
        }
    }
}
