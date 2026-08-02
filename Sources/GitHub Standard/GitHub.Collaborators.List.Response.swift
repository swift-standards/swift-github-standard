extension GitHub.Collaborators.List {
    public struct Response: Equatable, Hashable, Sendable {
        public let collaborators: [GitHub.Collaborators.Collaborator]

        public init(collaborators: [GitHub.Collaborators.Collaborator]) {
            self.collaborators = collaborators
        }
    }
}
