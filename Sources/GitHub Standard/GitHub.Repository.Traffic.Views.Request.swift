extension GitHub.Repository.Traffic.Views {
    public struct Request: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let interval: GitHub.Repository.Traffic.Interval?

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            interval: GitHub.Repository.Traffic.Interval? = nil
        ) {
            self.owner = owner
            self.repository = repository
            self.interval = interval
        }
    }
}
