extension GitHub.OAuth.Token.Exchange {
    public struct Response: Equatable, Hashable, Sendable {
        public let accessToken: String
        public let tokenType: String
        public let scope: String

        public init(
            accessToken: String,
            tokenType: String,
            scope: String
        ) {
            self.accessToken = accessToken
            self.tokenType = tokenType
            self.scope = scope
        }
    }
}
