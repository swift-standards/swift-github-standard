public import Tagged

extension GitHub.Repository {

    /// `owner/name`: how GitHub writes a repository, and what its REST paths and `full_name` hold.
    public struct Slug: Sendable, Hashable {

        public let owner: GitHub.Owner.Login

        public let name: GitHub.Repository.Name

        public init(owner: GitHub.Owner.Login, name: GitHub.Repository.Name) {
            self.owner = owner
            self.name = name
        }

        /// The slug `text` spells, or `nil` when it isn't exactly two non-empty parts.
        public init?(_ text: some StringProtocol) {
            let parts = text.split(separator: "/", omittingEmptySubsequences: false)
            guard parts.count == 2, !parts[0].isEmpty, !parts[1].isEmpty else { return nil }
            self.init(owner: .init(_unchecked: String(parts[0])), name: .init(_unchecked: String(parts[1])))
        }
    }
}

extension GitHub.Repository.Slug: CustomStringConvertible {

    public var description: String { "\(owner.underlying)/\(name.underlying)" }
}

extension GitHub.Repository.Slug: Codable {

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let text = try container.decode(String.self)
        guard let slug = Self(text) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "not an owner/name slug: \(text)")
        }
        self = slug
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}
