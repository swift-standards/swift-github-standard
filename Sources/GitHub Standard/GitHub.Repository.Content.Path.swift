extension GitHub.Repository.Content {
    public struct Path: Equatable, Hashable, Sendable {
        public let segments: [String]

        public init?(segments: [String]) {
            guard
                !segments.isEmpty,
                segments.allSatisfy({ !$0.isEmpty && $0 != "." && $0 != ".." })
            else { return nil }
            self.segments = segments
        }
    }
}
