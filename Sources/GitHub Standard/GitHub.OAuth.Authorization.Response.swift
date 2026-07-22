import RFC_3986

extension GitHub.OAuth.Authorization {
    public struct Response: Equatable, Hashable, Sendable {
        public let uri: RFC_3986.URI

        public init(uri: RFC_3986.URI) {
            self.uri = uri
        }
    }
}
