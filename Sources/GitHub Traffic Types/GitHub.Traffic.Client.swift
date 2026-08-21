import GitHub_Types_Shared

extension GitHub.Traffic.Client {

    public enum Error: Swift.Error, Sendable, Equatable {
        case views(reason: String)
        case clones(reason: String)
        case paths(reason: String)
        case referrers(reason: String)
    }
}

extension GitHub.Traffic {
    @Witness
    public struct Client: Sendable {

        public var views:
            @Sendable (_ owner: String, _ repo: String, _ per: Per?) async throws(Client.Error)
                -> Views.Response

        public var clones:
            @Sendable (_ owner: String, _ repo: String, _ per: Per?) async throws(Client.Error)
                -> Clones.Response

        public var paths:
            @Sendable (_ owner: String, _ repo: String) async throws(Client.Error) ->
                Paths.Response

        public var referrers:
            @Sendable (_ owner: String, _ repo: String) async throws(Client.Error) ->
                Referrers.Response
    }
}
