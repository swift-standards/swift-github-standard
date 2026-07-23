import RFC_3339
import RFC_3986

extension GitHub.Repository {
    public struct Metadata: Equatable, Hashable, Sendable {
        public let id: ID
        public let nodeID: String
        public let name: Name
        public let fullName: String
        public let owner: GitHub.Owner.Summary
        public let htmlURL: RFC_3986.URI
        public let url: RFC_3986.URI
        public let homepage: RFC_3986.URI?
        public let description: String?
        public let isPrivate: Bool
        public let isFork: Bool
        public let isArchived: Bool
        public let isDisabled: Bool
        public let isTemplate: Bool
        public let hasIssues: Bool
        public let hasProjects: Bool
        public let hasDownloads: Bool
        public let hasWiki: Bool
        public let hasPages: Bool
        public let allowForking: Bool
        public let language: String?
        public let visibility: Visibility
        public let defaultBranch: String
        public let topics: [String]
        public let license: License?
        public let stargazersCount: UInt64
        public let forksCount: UInt64
        public let openIssuesCount: UInt64
        public let watchersCount: UInt64
        public let size: UInt64
        public let createdAt: RFC_3339.DateTime
        public let updatedAt: RFC_3339.DateTime
        public let pushedAt: RFC_3339.DateTime?

        // REASON: GitHub wire boolean; L2 spec-mirroring — the Bool parameters
        //   below are 1:1 transliterations of GitHub REST wire fields, so the
        //   enum rewrite [API-IMPL-003] prescribes would falsify the contract.
        public init(
            id: ID,
            nodeID: String,
            name: Name,
            fullName: String,
            owner: GitHub.Owner.Summary,
            htmlURL: RFC_3986.URI,
            url: RFC_3986.URI,
            homepage: RFC_3986.URI?,
            description: String?,
            isPrivate: Bool,  // swift-linter:disable:line bool public parameter
            isFork: Bool,  // swift-linter:disable:line bool public parameter
            isArchived: Bool,  // swift-linter:disable:line bool public parameter
            isDisabled: Bool,  // swift-linter:disable:line bool public parameter
            isTemplate: Bool,  // swift-linter:disable:line bool public parameter
            hasIssues: Bool,  // swift-linter:disable:line bool public parameter
            hasProjects: Bool,  // swift-linter:disable:line bool public parameter
            hasDownloads: Bool,  // swift-linter:disable:line bool public parameter
            hasWiki: Bool,  // swift-linter:disable:line bool public parameter
            hasPages: Bool,  // swift-linter:disable:line bool public parameter
            allowForking: Bool,  // swift-linter:disable:line bool public parameter
            language: String?,
            visibility: Visibility,
            defaultBranch: String,
            topics: [String],
            license: License?,
            stargazersCount: UInt64,
            forksCount: UInt64,
            openIssuesCount: UInt64,
            watchersCount: UInt64,
            size: UInt64,
            createdAt: RFC_3339.DateTime,
            updatedAt: RFC_3339.DateTime,
            pushedAt: RFC_3339.DateTime?
        ) {
            self.id = id
            self.nodeID = nodeID
            self.name = name
            self.fullName = fullName
            self.owner = owner
            self.htmlURL = htmlURL
            self.url = url
            self.homepage = homepage
            self.description = description
            self.isPrivate = isPrivate
            self.isFork = isFork
            self.isArchived = isArchived
            self.isDisabled = isDisabled
            self.isTemplate = isTemplate
            self.hasIssues = hasIssues
            self.hasProjects = hasProjects
            self.hasDownloads = hasDownloads
            self.hasWiki = hasWiki
            self.hasPages = hasPages
            self.allowForking = allowForking
            self.language = language
            self.visibility = visibility
            self.defaultBranch = defaultBranch
            self.topics = topics
            self.license = license
            self.stargazersCount = stargazersCount
            self.forksCount = forksCount
            self.openIssuesCount = openIssuesCount
            self.watchersCount = watchersCount
            self.size = size
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.pushedAt = pushedAt
        }
    }
}
