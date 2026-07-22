extension GitHub.Repository.Traffic.Paths {
    public struct Response: Equatable, Hashable, Sendable {
        public let paths: [Path]

        public init(paths: [Path]) {
            self.paths = paths
        }
    }
}
