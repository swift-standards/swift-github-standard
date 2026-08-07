import RFC_3339
import RFC_3986

extension GitHub.Repository {
    public struct Invitation: Equatable, Hashable, Sendable {
        public let id: ID
        public let nodeID: String
        public let repository: GitHub.Repository.Summary
        public let invitee: GitHub.User.Summary?
        public let inviter: GitHub.User.Summary?
        public let permission: String
        public let createdAt: RFC_3339.DateTime
        public let expired: Bool?
        public let url: RFC_3986.URI
        public let htmlURL: RFC_3986.URI

        // REASON: `expired` mirrors the nullable GitHub wire field.
        public init(
            id: ID,
            nodeID: String,
            repository: GitHub.Repository.Summary,
            invitee: GitHub.User.Summary?,
            inviter: GitHub.User.Summary?,
            permission: String,
            createdAt: RFC_3339.DateTime,
            expired: Bool?,  // swift-linter:disable:line bool public parameter
            url: RFC_3986.URI,
            htmlURL: RFC_3986.URI
        ) {
            self.id = id
            self.nodeID = nodeID
            self.repository = repository
            self.invitee = invitee
            self.inviter = inviter
            self.permission = permission
            self.createdAt = createdAt
            self.expired = expired
            self.url = url
            self.htmlURL = htmlURL
        }
    }
}
