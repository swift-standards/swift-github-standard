extension GitHub.User.Authenticated.Emails.List {
    public struct Request: Equatable, Hashable, Sendable {
        public let accessToken: String

        public init(accessToken: String) {
            self.accessToken = accessToken
        }
    }
}
