extension GitHub.Collaborators.Invitations.Update {
    public struct Response: Equatable, Hashable, Sendable {
        public let invitation: GitHub.Repository.Invitation

        public init(invitation: GitHub.Repository.Invitation) {
            self.invitation = invitation
        }
    }
}
