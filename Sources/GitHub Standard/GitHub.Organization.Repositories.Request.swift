extension GitHub.Organization.Repositories {
    public struct Request: Equatable, Hashable, Sendable {
        public let organization: GitHub.Organization.Name
        public let type: `Type`
        public let page: GitHub.Page.Number
        public let size: GitHub.Page.Size

        public init(
            organization: GitHub.Organization.Name,
            type: `Type`,
            page: GitHub.Page.Number,
            size: GitHub.Page.Size
        ) {
            self.organization = organization
            self.type = type
            self.page = page
            self.size = size
        }
    }
}
