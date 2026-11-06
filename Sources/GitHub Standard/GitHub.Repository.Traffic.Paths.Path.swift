public import RFC_3986

extension GitHub.Repository.Traffic.Paths {
    public struct Path: Equatable, Hashable, Sendable {
        public let path: RFC_3986.URI.Path
        public let title: String
        public let count: UInt64
        public let uniques: UInt64

        public init(
            path: RFC_3986.URI.Path,
            title: String,
            count: UInt64,
            uniques: UInt64
        ) {
            self.path = path
            self.title = title
            self.count = count
            self.uniques = uniques
        }
    }
}
