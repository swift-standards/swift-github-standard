import EmailAddress_Standard
import RFC_3339
import RFC_3986

extension GitHub.User.Authenticated {
    public struct Profile: Equatable, Hashable, Sendable {
        public let id: GitHub.User.ID
        public let login: GitHub.User.Login
        public let name: String?
        public let email: EmailAddress?
        public let avatarURL: RFC_3986.URI
        public let bio: String?
        public let company: String?
        public let blog: String?
        public let location: String?
        public let publicRepos: UInt64
        public let publicGists: UInt64
        public let followers: UInt64
        public let following: UInt64
        public let createdAt: RFC_3339.DateTime
        public let updatedAt: RFC_3339.DateTime

        public init(
            id: GitHub.User.ID,
            login: GitHub.User.Login,
            name: String?,
            email: EmailAddress?,
            avatarURL: RFC_3986.URI,
            bio: String?,
            company: String?,
            blog: String?,
            location: String?,
            publicRepos: UInt64,
            publicGists: UInt64,
            followers: UInt64,
            following: UInt64,
            createdAt: RFC_3339.DateTime,
            updatedAt: RFC_3339.DateTime
        ) {
            self.id = id
            self.login = login
            self.name = name
            self.email = email
            self.avatarURL = avatarURL
            self.bio = bio
            self.company = company
            self.blog = blog
            self.location = location
            self.publicRepos = publicRepos
            self.publicGists = publicGists
            self.followers = followers
            self.following = following
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}
