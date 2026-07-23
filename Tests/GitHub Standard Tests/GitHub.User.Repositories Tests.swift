import RFC_3339
import Testing

@testable import GitHub_Standard

extension GitHub.User.Repositories {
    @Suite("GitHub.User.Repositories.Unit")
    struct Unit {
        @Test("Authenticated-user repository filters retain provider wire values")
        func request() throws(RFC_3339.DateTime.Error) {
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

            // swift-linter:disable:next raw value access
            // REASON: the test's purpose is the newtype's raw wire boundary —
            //   each filter must retain GitHub's exact wire spelling.
            #expect(request.visibility?.rawValue == "private")
            // swift-linter:disable:next raw value access
            // REASON: raw wire boundary — see above.
            #expect(request.type?.rawValue == "owner")
            // swift-linter:disable:next raw value access
            // REASON: raw wire boundary — see above.
            #expect(request.sort?.rawValue == "full_name")
            // swift-linter:disable:next raw value access
            // REASON: raw wire boundary — see above.
            #expect(request.direction?.rawValue == "desc")
            #expect(Operation(request: request).request == request)
        }
    }
}
