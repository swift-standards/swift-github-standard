extension GitHub.Repository.Traffic.Views {
    public struct Response: Equatable, Hashable, Sendable {
        public let count: UInt64
        public let uniques: UInt64
        public let views: [View]

        public init(count: UInt64, uniques: UInt64, views: [View]) {
            self.count = count
            self.uniques = uniques
            self.views = views
        }
    }
}
