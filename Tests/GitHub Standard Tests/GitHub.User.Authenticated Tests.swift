import EmailAddress_Standard
import RFC_3339
import RFC_3986
import Testing

@testable import GitHub_Standard

extension GitHub.User.Authenticated {
    @Suite("GitHub.User.Authenticated.Unit")
    struct Unit {
        @Test("Profile preserves typed provider values and nullable email")
        func profile() throws {
            let createdAt = try RFC_3339.DateTime("2020-01-01T00:00:00Z")
            let updatedAt = try RFC_3339.DateTime("2026-07-22T00:00:00Z")
            let user = Profile(
                id: .init(rawValue: 1),
                login: .init(rawValue: "octocat"),
                name: "The Octocat",
                email: nil,
                avatarURL: try RFC_3986.URI("https://avatars.githubusercontent.com/u/1"),
                bio: nil,
                company: "@github",
                blog: "https://github.blog",
                location: "San Francisco",
                publicRepos: 8,
                publicGists: 8,
                followers: 100,
                following: 0,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
            let request = Get.Request(accessToken: "access-token")

            #expect(Get.Operation(request: request).request == request)
            #expect(Get.Response(user: user).user.email == nil)
            #expect(user.publicRepos == 8)
        }

        @Test("Email list requires a typed non-null email address")
        func emails() throws {
            let email = try EmailAddress("octocat@github.com")
            let item = Emails.List.Email(
                email: email,
                primary: true,
                verified: true,
                visibility: "public"
            )
            let request = Emails.List.Request(accessToken: "access-token")
            let response = Emails.List.Response(emails: [item])

            #expect(Emails.List.Operation(request: request).request == request)
            #expect(response.emails.first?.email == email)
            #expect(response.emails.first?.verified == true)
        }
    }
}
