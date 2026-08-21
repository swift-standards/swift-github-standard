import GitHub_Types_Shared

extension GitHub.Collaborators.Client {

    public enum Error: Swift.Error, Sendable, Equatable {
        case list(reason: String)
        case check(reason: String)
        case add(reason: String)
        case remove(reason: String)
        case getPermission(reason: String)
        case listInvitations(reason: String)
        case updateInvitation(reason: String)
        case deleteInvitation(reason: String)
    }
}

extension GitHub.Collaborators {
    @Witness
    public struct Client: Sendable {

        public var list:
            @Sendable (_ owner: String, _ repo: String, _ request: List.Request?)
                async throws(Client.Error) ->
                List.Response

        public var check:
            @Sendable (_ owner: String, _ repo: String, _ username: String)
                async throws(Client.Error) -> Void

        public var add:
            @Sendable (_ owner: String, _ repo: String, _ username: String, _ request: Add.Request?)
                async throws(Client.Error) -> Add.Response

        public var remove:
            @Sendable (_ owner: String, _ repo: String, _ username: String)
                async throws(Client.Error) -> Void

        public var getPermission:
            @Sendable (_ owner: String, _ repo: String, _ username: String)
                async throws(Client.Error) ->
                GetPermission.Response

        public var listInvitations:
            @Sendable (_ owner: String, _ repo: String, _ request: Invitations.List.Request?)
                async throws(Client.Error)
                -> Invitations.List.Response

        public var updateInvitation:
            @Sendable (
                _ owner: String, _ repo: String, _ invitationId: Int,
                _ request: Invitations.Update.Request
            ) async throws(Client.Error) -> Invitations.Update.Response

        public var deleteInvitation:
            @Sendable (_ owner: String, _ repo: String, _ invitationId: Int)
                async throws(Client.Error) -> Void
    }
}

extension GitHub.Collaborators.Client {
    public func list(
        owner: String,
        repo: String
    ) async throws(Client.Error)
        -> GitHub.Collaborators.List.Response
    {
        try await self.list(owner: owner, repo: repo, request: nil)
    }

    public func add(
        owner: String,
        repo: String,
        username: String
    ) async throws(Client.Error) -> GitHub.Collaborators.Add.Response {
        try await self.add(owner: owner, repo: repo, username: username, request: nil)
    }

    public func add(
        owner: String,
        repo: String,
        username: String,
        permission: GitHub.Collaborators.Permission
    ) async throws(Client.Error) -> GitHub.Collaborators.Add.Response {
        try await self.add(
            owner: owner,
            repo: repo,
            username: username,
            request: .init(permission: permission)
        )
    }

    public func listInvitations(
        owner: String,
        repo: String
    ) async throws(Client.Error) -> GitHub.Collaborators.Invitations.List.Response {
        try await self.listInvitations(owner: owner, repo: repo, request: nil)
    }
}
