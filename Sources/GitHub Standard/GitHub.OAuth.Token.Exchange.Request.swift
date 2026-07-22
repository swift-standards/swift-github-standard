import RFC_3986

extension GitHub.OAuth.Token.Exchange {
    public struct Request: Equatable, Hashable, Sendable {
        public let clientID: String
        public let clientSecret: String
        public let code: String
        public let redirectURI: RFC_3986.URI?

        public init(
            clientID: String,
            clientSecret: String,
            code: String,
            redirectURI: RFC_3986.URI? = nil
        ) {
            self.clientID = clientID
            self.clientSecret = clientSecret
            self.code = code
            self.redirectURI = redirectURI
        }
    }
}
