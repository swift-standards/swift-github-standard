extension GitHub.Collaborators.List {
    public struct Request: Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let affiliation: GitHub.Collaborators.Affiliation?
        public let permission: GitHub.Collaborators.Permission?
        public let page: GitHub.Page.Number?
        public let size: GitHub.Page.Size?

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            affiliation: GitHub.Collaborators.Affiliation? = nil,
            permission: GitHub.Collaborators.Permission? = nil,
            page: GitHub.Page.Number? = nil,
            size: GitHub.Page.Size? = nil
        ) {
            self.owner = owner
            self.repository = repository
            self.affiliation = affiliation
            self.permission = permission
            self.page = page
            self.size = size
        }
    }
}
