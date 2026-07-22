extension GitHub.Repository.Traffic.Referrers {
    public struct Response: Equatable, Hashable, Sendable {
        public let referrers: [Referrer]

        public init(referrers: [Referrer]) {
            self.referrers = referrers
        }
    }
}
