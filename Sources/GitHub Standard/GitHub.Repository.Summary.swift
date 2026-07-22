extension GitHub.Repository {
    public struct Summary: Equatable, Hashable, Sendable {
        public let id: ID
        public let name: Name
        public let archived: Bool
        public let visibility: Visibility

        public init(
            id: ID,
            name: Name,
            archived: Bool,
            visibility: Visibility
        ) {
            self.id = id
            self.name = name
            self.archived = archived
            self.visibility = visibility
        }
    }
}
