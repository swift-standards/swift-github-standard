import RFC_3339
import RFC_3986
import Testing

@testable import GitHub_Standard

extension GitHub.Repository.Stargazers {
    @Suite("GitHub.Repository.Stargazers.Unit")
    struct Unit {
        @Test("Stargazers preserve login and starred-at wire semantics")
        func response() throws {
            let user = GitHub.User.Summary(
                id: .init(rawValue: 42),
                login: .init(rawValue: "octocat"),
                nodeID: "MDQ6VXNlcjE=",
                avatarURL: try RFC_3986.URI("https://avatars.githubusercontent.com/u/1"),
                gravatarID: "",
                url: try RFC_3986.URI("https://api.github.com/users/octocat"),
                htmlURL: try RFC_3986.URI("https://github.com/octocat"),
                type: "User",
                siteAdmin: false
            )
            let starredAt = try RFC_3339.DateTime("2026-07-22T10:00:00Z")
            let stargazer = Stargazer(user: user, starredAt: starredAt)
            let response = Response(stargazers: [stargazer])

            #expect(response.stargazers.first?.user.login.rawValue == "octocat")
            #expect(response.stargazers.first?.starredAt == starredAt)
        }

        @Test("Pagination uses the shared bounded GitHub page vocabulary")
        func request() {
            let request = Request(
                owner: .init(rawValue: "swiftlang"),
                repository: .init(rawValue: "swift"),
                page: .first,
                size: .maximum
            )

            #expect(Operation(request: request).request == request)
            #expect(request.page?.rawValue == 1)
            #expect(request.size?.rawValue == 100)
        }
    }
}
