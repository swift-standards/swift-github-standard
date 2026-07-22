import RFC_3339
import Testing

@testable import GitHub_Standard

extension GitHub.User.Repositories {
    @Suite("GitHub.User.Repositories.Unit")
    struct Unit {
        @Test("Authenticated-user repository filters retain provider wire values")
        func request() throws {
            let since = try RFC_3339.DateTime("2026-07-01T00:00:00Z")
            let request = Request(
                visibility: .private,
                affiliation: "owner,collaborator",
                type: .owner,
                sort: .fullName,
                direction: .descending,
                page: .first,
                size: .maximum,
                since: since
            )

            #expect(request.visibility?.rawValue == "private")
            #expect(request.type?.rawValue == "owner")
            #expect(request.sort?.rawValue == "full_name")
            #expect(request.direction?.rawValue == "desc")
            #expect(Operation(request: request).request == request)
        }
    }
}
