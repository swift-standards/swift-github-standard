import RFC_3339
import RFC_3986
import Testing

@testable import GitHub_Standard

extension GitHub.Collaborators {
    @Suite("GitHub.Collaborators.Unit")
    struct Unit {
        @Test("Requests reuse the established repository and user identities")
        func requests() {
            let request = List.Request(
                owner: .init("swift-standards"),
                repository: .init("swift-github-standard"),
                affiliation: .direct,
                permission: .maintain,
                page: .first,
                size: .maximum
            )
            let check = Check.Request(
                owner: request.owner,
                repository: request.repository,
                user: .init("octocat")
            )

            #expect(request.owner == .init("swift-standards"))
            #expect(request.repository == .init("swift-github-standard"))
            #expect(request.permission == .maintain)
            #expect(check.user == .init("octocat"))
        }

        @Test("Permission and affiliation values preserve known and custom wire spellings")
        func wireValues() {
            #expect(Permission.pull.rawValue == "pull")
            #expect(Permission.admin.rawValue == "admin")
            #expect(Affiliation.outside.rawValue == "outside")
            #expect(Permission(rawValue: "custom-role").rawValue == "custom-role")
        }

        @Test("Collaborator and invitation responses compose existing payload owners")
        func responses() throws(RFC_3986.Error) {
            let user = try Self.user()
            let collaborator = Collaborator(
                user: user,
                permissions: .init(pull: true, triage: true, push: true, maintain: false, admin: false),
                roleName: "write"
            )
            let invitation: GitHub.Repository.Invitation
            do throws(RFC_3339.DateTime.Error) {
                invitation = try Self.invitation(user: user)
            } catch {
                Issue.record("invalid RFC 3339 fixture: \(error)")
                return
            }
            let list = List.Response(collaborators: [collaborator])
            let invitations = Invitations.List.Response(invitations: [invitation])

            #expect(list.collaborators.first?.user == user)
            #expect(list.collaborators.first?.permissions.push == true)
            #expect(invitations.invitations.first?.repository.name == .init("swift"))
            #expect(invitations.invitations.first?.permission == "write")
        }

        @Test("Invitation requests retain pagination and update values")
        func invitationRequests() {
            let list = Invitations.List.Request(
                owner: .init("swiftlang"),
                repository: .init("swift"),
                page: .first,
                size: .maximum
            )
            let update = Invitations.Update.Request(
                owner: list.owner,
                repository: list.repository,
                invitationID: .init(1),
                permission: "write"
            )

            #expect(list.page == .first)
            #expect(list.size == .maximum)
            #expect(update.invitationID == .init(1))
            #expect(update.permission == "write")
        }

        private static func user() throws(RFC_3986.Error) -> GitHub.User.Summary {
            GitHub.User.Summary(
                id: .init(1),
                login: .init("octocat"),
                nodeID: "MDQ6VXNlcjE=",
                avatarURL: try RFC_3986.URI("https://avatars.githubusercontent.com/u/1"),
                gravatarID: "",
                url: try RFC_3986.URI("https://api.github.com/users/octocat"),
                htmlURL: try RFC_3986.URI("https://github.com/octocat"),
                type: "User",
                siteAdmin: false
            )
        }

        private static func invitation(
            user: GitHub.User.Summary
        ) throws(RFC_3339.DateTime.Error) -> GitHub.Repository.Invitation {
            GitHub.Repository.Invitation(
                id: .init(1),
                nodeID: "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
                repository: .init(
                    id: .init(2), name: .init("swift"), archived: false, disabled: false,
                    fork: false, visibility: .public
                ),
                invitee: user,
                inviter: user,
                permission: "write",
                createdAt: try RFC_3339.DateTime("2026-07-22T10:00:00Z"),
                expired: false,
                url: user.url,
                htmlURL: user.htmlURL
            )
        }
    }
}
