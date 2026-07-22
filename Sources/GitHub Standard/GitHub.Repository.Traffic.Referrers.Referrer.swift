extension GitHub.Repository.Traffic.Referrers {
    public struct Referrer: Equatable, Hashable, Sendable {
        public let referrer: String
        public let count: UInt64
        public let uniques: UInt64

        public init(referrer: String, count: UInt64, uniques: UInt64) {
            self.referrer = referrer
            self.count = count
            self.uniques = uniques
        }
    }
}
