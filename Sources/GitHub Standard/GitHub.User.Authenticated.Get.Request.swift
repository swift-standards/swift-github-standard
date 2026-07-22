extension GitHub.User.Authenticated.Get {
    public struct Request: Equatable, Hashable, Sendable {
        public let accessToken: String

        public init(accessToken: String) {
            self.accessToken = accessToken
        }
    }
}
