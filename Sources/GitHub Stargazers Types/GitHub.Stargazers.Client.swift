import Dependencies
import GitHub_Types_Shared

extension GitHub.Stargazers.Client {

    public enum Error: Swift.Error, Sendable, Equatable {
        case list(reason: String)
    }
}

extension GitHub.Stargazers {
    @Witness
    public struct Client: Sendable {

        public var list:
            @Sendable (_ owner: String, _ repo: String, _ request: List.Request?)
                async throws(Client.Error) ->
                List.Response
    }
}

extension GitHub.Stargazers.Client {
    public func list(
        owner: String,
        repo: String
    ) async throws(Client.Error)
        -> GitHub.Stargazers.List.Response
    {
        try await self.list(owner, repo, nil)
    }

    public func listAll(
        owner: String,
        repo: String
    ) async throws(Client.Error) -> [GitHub.Stargazers.List.Stargazer] {
        var allStargazers: [GitHub.Stargazers.List.Stargazer] = []
        var page = 1
        let perPage = 100

        while true {
            let request = GitHub.Stargazers.List.Request(perPage: perPage, page: page)
            let response = try await self.list(owner, repo, request)

            if response.isEmpty {
                break
            }

            allStargazers.append(contentsOf: response)

            if response.count < perPage {
                break
            }

            page += 1
        }

        return allStargazers
    }
}
