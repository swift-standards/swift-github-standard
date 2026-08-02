extension GitHub.Collaborators.Invitations.Update {
    public struct Request: Codable, Equatable, Hashable, Sendable {
        public let owner: GitHub.Owner.Login
        public let repository: GitHub.Repository.Name
        public let invitationID: GitHub.Repository.Invitation.ID
        public let permissions: String

        public init(
            owner: GitHub.Owner.Login,
            repository: GitHub.Repository.Name,
            invitationID: GitHub.Repository.Invitation.ID,
            permissions: String
        ) {
            self.owner = owner
            self.repository = repository
            self.invitationID = invitationID
            self.permissions = permissions
        }
    }
}
