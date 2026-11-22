public import RFC_3986

extension GitHub.Owner {
    public struct Summary: Equatable, Hashable, Sendable {
        public let id: ID
        public let login: Login
        public let nodeID: String
        public let avatarURL: IETF.RFC.`3986`.URI
        public let gravatarID: String
        public let url: IETF.RFC.`3986`.URI
        public let htmlURL: IETF.RFC.`3986`.URI
        public let type: String
        public let siteAdmin: Bool

        public init(
            id: ID,
            login: Login,
            nodeID: String,
            avatarURL: IETF.RFC.`3986`.URI,
            gravatarID: String,
            url: IETF.RFC.`3986`.URI,
            htmlURL: IETF.RFC.`3986`.URI,
            type: String,
            siteAdmin: Bool
        ) {
            self.id = id
            self.login = login
            self.nodeID = nodeID
            self.avatarURL = avatarURL
            self.gravatarID = gravatarID
            self.url = url
            self.htmlURL = htmlURL
            self.type = type
            self.siteAdmin = siteAdmin
        }
    }
}
