import RFC_3339

extension GitHub.User.Repositories {
    public struct Request: Equatable, Hashable, Sendable {
        public let visibility: Visibility?
        public let affiliation: String?
        public let type: `Type`?
        public let sort: Sort?
        public let direction: Direction?
        public let page: GitHub.Page.Number?
        public let size: GitHub.Page.Size?
        public let since: RFC_3339.DateTime?
        public let before: RFC_3339.DateTime?

        public init(
            visibility: Visibility? = nil,
            affiliation: String? = nil,
            type: `Type`? = nil,
            sort: Sort? = nil,
            direction: Direction? = nil,
            page: GitHub.Page.Number? = nil,
            size: GitHub.Page.Size? = nil,
            since: RFC_3339.DateTime? = nil,
            before: RFC_3339.DateTime? = nil
        ) {
            self.visibility = visibility
            self.affiliation = affiliation
            self.type = type
            self.sort = sort
            self.direction = direction
            self.page = page
            self.size = size
            self.since = since
            self.before = before
        }
    }
}
