extension GitHub.Repository.Content {
    public struct Response: Equatable, Hashable, Sendable {
        public let kind: Kind

        public init(kind: Kind) {
            self.kind = kind
        }
    }
}
