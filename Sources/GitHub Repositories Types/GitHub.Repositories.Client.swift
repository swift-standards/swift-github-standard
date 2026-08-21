import GitHub_Types_Shared

extension GitHub.Repositories.Client {

    public enum Error: Swift.Error, Sendable, Equatable {
        case list(reason: String)
        case get(reason: String)
        case create(reason: String)
        case update(reason: String)
        case delete(reason: String)
    }
}

extension GitHub.Repositories {
    @Witness
    public struct Client: Sendable {

        public var list:
            @Sendable (_ request: List.Request?) async throws(Client.Error) -> List.Response

        public var get:
            @Sendable (_ owner: String, _ repo: String) async throws(Client.Error) ->
                GitHub.Repository

        public var create:
            @Sendable (_ request: Create.Request) async throws(Client.Error) -> GitHub.Repository

        public var update:
            @Sendable (_ owner: String, _ repo: String, _ request: Update.Request)
                async throws(Client.Error) ->
                GitHub.Repository

        public var delete:
            @Sendable (_ owner: String, _ repo: String) async throws(Client.Error) ->
                Delete.Response
    }
}

extension GitHub.Repositories.Client {
    public func list() async throws(Client.Error) -> GitHub.Repositories.List.Response {
        try await self.list(request: nil)
    }
}
