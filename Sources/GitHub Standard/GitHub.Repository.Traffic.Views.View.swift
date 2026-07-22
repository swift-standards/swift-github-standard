import RFC_3339

extension GitHub.Repository.Traffic.Views {
    public struct View: Equatable, Hashable, Sendable {
        public let timestamp: RFC_3339.DateTime
        public let count: UInt64
        public let uniques: UInt64

        public init(
            timestamp: RFC_3339.DateTime,
            count: UInt64,
            uniques: UInt64
        ) {
            self.timestamp = timestamp
            self.count = count
            self.uniques = uniques
        }
    }
}
