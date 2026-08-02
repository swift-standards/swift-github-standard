extension GitHub.Issue {
    public struct Key: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let number: Number

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            number: Number
        ) {
            self.owner = owner
            self.repository = repository
            self.number = number
        }
    }
}
