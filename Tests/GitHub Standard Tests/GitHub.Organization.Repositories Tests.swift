import Tagged
import Testing

@testable import GitHub_Standard

enum `GitHub.Organization.Repositories Tests` {}

extension `GitHub.Organization.Repositories Tests` {
    @Suite("`GitHub.Organization.Repositories Tests`.Unit")
    struct Unit {
        @Test
        func `The request retains semantic organization and pagination values`() {
            let request = GitHub.Organization.Repositories.Request(
                organization: .init("swiftlang"),
                type: .public,
                page: .first,
                size: .maximum
            )

            #expect(request.organization.underlying == "swiftlang")
            #expect(request.type == .public)
            #expect(request.page.rawValue == 1)
            #expect(request.size.rawValue == 100)
        }

        @Test
        func `Page values enforce GitHub's published bounds`() {
            #expect(GitHub.Page.Number(rawValue: 0) == nil)
            #expect(GitHub.Page.Number(rawValue: 1)?.rawValue == 1)
            #expect(GitHub.Page.Size(rawValue: 0) == nil)
            #expect(GitHub.Page.Size(rawValue: 100)?.rawValue == 100)
            #expect(GitHub.Page.Size(rawValue: 101) == nil)
        }

        @Test
        func `Page values and the request type read as the text of their query parameter`() {
            #expect(GitHub.Page.Number.first.description == "1")
            #expect(GitHub.Page.Size.maximum.description == "100")
            let type: GitHub.Organization.Repositories.Request.`Type` = .sources
            #expect(type.description == "sources")
        }

        @Test
        func `The response preserves repository identity and public state`() {
            let repository = GitHub.Repository.Summary(
                id: .init(42),
                name: .init("swift"),
                archived: false,
                disabled: false,
                fork: false,
                visibility: .public
            )
            let response = GitHub.Organization.Repositories.Response(
                repositories: [repository]
            )

            #expect(response.repositories == [repository])
        }
    }
}
