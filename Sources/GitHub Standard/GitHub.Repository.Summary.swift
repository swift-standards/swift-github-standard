extension GitHub.Repository {
    public struct Summary: Equatable, Hashable, Sendable {
        public let id: ID
        public let name: Name
        public let archived: Bool
        public let disabled: Bool
        public let fork: Bool
        public let visibility: Visibility

        public init(
            id: ID,
            name: Name,
            archived: Bool,
            disabled: Bool,
            fork: Bool,
            visibility: Visibility
        ) {
            self.id = id
            self.name = name
            self.archived = archived
            self.disabled = disabled
            self.fork = fork
            self.visibility = visibility
        }
    }
}
