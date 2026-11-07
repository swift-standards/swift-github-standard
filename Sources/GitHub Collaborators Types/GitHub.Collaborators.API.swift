import GitHub_Types_Shared

extension GitHub.Collaborators {
    @Cases
    public enum API: Equatable, Sendable {

        case list(owner: String, repo: String, request: GitHub.Collaborators.List.Request? = nil)

        case check(owner: String, repo: String, username: String)

        case add(
            owner: String,
            repo: String,
            username: String,
            request: GitHub.Collaborators.Add.Request? = nil
        )

        case remove(owner: String, repo: String, username: String)

        case getPermission(owner: String, repo: String, username: String)

        case listInvitations(
            owner: String,
            repo: String,
            request: GitHub.Collaborators.Invitations.List.Request? = nil
        )

        case updateInvitation(
            owner: String,
            repo: String,
            invitationId: Int,
            request: GitHub.Collaborators.Invitations.Update.Request
        )

        case deleteInvitation(owner: String, repo: String, invitationId: Int)
    }
}

extension GitHub.Collaborators.API {
}
