extension GitHub.Collaborators.Invitations.List {
    public struct Response: Equatable, Hashable, Sendable {
        public let invitations: [GitHub.Repository.Invitation]

        public init(invitations: [GitHub.Repository.Invitation]) {
            self.invitations = invitations
        }
    }
}
