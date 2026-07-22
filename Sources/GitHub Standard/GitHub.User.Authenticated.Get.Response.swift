extension GitHub.User.Authenticated.Get {
    public struct Response: Equatable, Hashable, Sendable {
        public let user: GitHub.User.Authenticated.Profile

        public init(user: GitHub.User.Authenticated.Profile) {
            self.user = user
        }
    }
}
