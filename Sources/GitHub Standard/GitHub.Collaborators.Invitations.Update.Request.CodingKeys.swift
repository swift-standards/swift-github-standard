extension GitHub.Collaborators.Invitations.Update.Request {
    enum CodingKeys: String, CodingKey {
        case owner
        case repository
        case invitationID
        case permissions
    }
}
