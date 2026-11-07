import RFC_3339
import Tagged
import Testing

@testable import GitHub_Standard

enum `GitHub.User.Repositories Tests` {
    typealias Operation = GitHub.User.Repositories.Operation
    typealias Request = GitHub.User.Repositories.Request
}

extension `GitHub.User.Repositories Tests` {
    @Suite("`GitHub.User.Repositories Tests`.Unit")
    struct Unit {
        @Test
        func `Authenticated-user repository filters retain provider wire values`() throws(RFC_3339.DateTime.Error) {
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
