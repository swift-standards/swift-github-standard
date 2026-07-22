import RFC_3986

extension GitHub.OAuth.Token.Exchange {
    public struct Error: Equatable, Swift.Error, Sendable {
        public let error: String
        public let errorDescription: String?
        public let errorURI: RFC_3986.URI?

        public init(
            error: String,
            errorDescription: String?,
            errorURI: RFC_3986.URI?
        ) {
            self.error = error
            self.errorDescription = errorDescription
            self.errorURI = errorURI
        }
    }
}
