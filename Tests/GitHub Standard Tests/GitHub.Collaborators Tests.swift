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

        @Test("Invitation update request encodes only its body field")
        func invitationRequests() throws {
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
                permissions: "write"
            )

            #expect(list.page == .first)
            #expect(list.size == .maximum)
            #expect(update.invitationID == .init(1))
            #expect(update.permissions == "write")

            let encoder = Wire.Encoder()
            try update.encode(to: encoder)

            #expect(encoder.keys == ["permissions"])
            #expect(!encoder.keys.contains("owner"))
            #expect(!encoder.keys.contains("repository"))
            #expect(!encoder.keys.contains("invitationID"))
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

        private enum Wire {
            final class Encoder: Swift.Encoder {
                var keys: [String] = []
                var codingPath: [any CodingKey] { [] }
                var userInfo: [CodingUserInfoKey: Any] { [:] }

                func container<Key>(keyedBy: Key.Type) -> KeyedEncodingContainer<Key> {
                    KeyedEncodingContainer(Container(encoder: self))
                }

                func unkeyedContainer() -> UnkeyedEncodingContainer { fatalError("unsupported") }

                func singleValueContainer() -> any SingleValueEncodingContainer {
                    fatalError("unsupported")
                }
            }

            struct Container<Key: CodingKey>: KeyedEncodingContainerProtocol {
                let encoder: Encoder
                var codingPath: [any CodingKey] { [] }

                mutating func encodeNil(forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Bool, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: String, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Double, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Float, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Int, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Int8, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Int16, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Int32, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: Int64, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: UInt, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: UInt8, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: UInt16, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: UInt32, forKey key: Key) throws { encoder.keys.append(key.stringValue) }
                mutating func encode(_ value: UInt64, forKey key: Key) throws { encoder.keys.append(key.stringValue) }

                mutating func encode<Value: Encodable>(_ value: Value, forKey key: Key) throws {
                    encoder.keys.append(key.stringValue)
                }

                mutating func nestedContainer<NestedKey>(
                    keyedBy type: NestedKey.Type,
                    forKey key: Key
                ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
                    fatalError("unsupported")
                }

                mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
                    fatalError("unsupported")
                }

                mutating func superEncoder() -> any Swift.Encoder { fatalError("unsupported") }
                mutating func superEncoder(forKey key: Key) -> any Swift.Encoder { fatalError("unsupported") }
            }
        }
    }
}
