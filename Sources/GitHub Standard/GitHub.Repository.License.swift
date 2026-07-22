import RFC_3986

extension GitHub.Repository {
    public struct License: Equatable, Hashable, Sendable {
        public let key: String
        public let name: String
        public let spdxID: String
        public let url: RFC_3986.URI?
        public let nodeID: String

        public init(
            key: String,
            name: String,
            spdxID: String,
            url: RFC_3986.URI?,
            nodeID: String
        ) {
            self.key = key
            self.name = name
            self.spdxID = spdxID
            self.url = url
            self.nodeID = nodeID
        }
    }
}
