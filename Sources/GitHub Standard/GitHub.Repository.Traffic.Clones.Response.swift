extension GitHub.Repository.Traffic.Clones {
    public struct Response: Equatable, Hashable, Sendable {
        public let count: UInt64
        public let uniques: UInt64
        public let clones: [Clone]

        public init(count: UInt64, uniques: UInt64, clones: [Clone]) {
            self.count = count
            self.uniques = uniques
            self.clones = clones
        }
    }
}
