import RFC_3986

extension GitHub.OAuth.Authorization {
    public struct Request: Equatable, Hashable, Sendable {
        public let clientID: String
        public let redirectURI: RFC_3986.URI
        public let scopes: [String]
        public let state: String

        public init(
            clientID: String,
            redirectURI: RFC_3986.URI,
            scopes: [String],
            state: String
        ) {
            self.clientID = clientID
            self.redirectURI = redirectURI
            self.scopes = scopes
            self.state = state
        }
    }
}
