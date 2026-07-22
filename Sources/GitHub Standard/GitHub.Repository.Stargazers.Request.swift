extension GitHub.Repository.Stargazers {
    public struct Request: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let page: GitHub.Page.Number?
        public let size: GitHub.Page.Size?

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            page: GitHub.Page.Number? = nil,
            size: GitHub.Page.Size? = nil
        ) {
            self.owner = owner
            self.repository = repository
            self.page = page
            self.size = size
        }
    }
}
