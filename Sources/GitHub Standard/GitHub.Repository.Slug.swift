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

extension GitHub.Repository.Slug {

    /// The repository on github.com that a git remote names, or `nil` when it names none.
    ///
    /// Five forms name one, each with an optional `.git` and then an optional `/` at the end:
    /// `https://github.com/owner/name`, `http://github.com/owner/name`, `ssh://git@github.com/owner/name`,
    /// `git://github.com/owner/name` and the scp-like `git@github.com:owner/name`.
    ///
    /// - The host is `github.com`, in any letter case and without a port. A remote on any other host names no
    ///   repository of GitHub's, whatever its path; a slug holds no host, so one from a GitHub Enterprise host
    ///   would read as a repository on github.com.
    /// - The scheme is read in any letter case. Over SSH, in either form, the user is `git`, the only one GitHub
    ///   serves. Over HTTP a user or a credential before the host is dropped. `git://` takes none.
    /// - The path is exactly `owner/name`, validated as ``init(_:)`` does and kept in the case it was written in.
    ///   A longer or shorter path, a query or a fragment is refused.
    public init?(remote: some StringProtocol) {
        let text = Substring(remote)
        var authority: Substring
        var path: Substring
        if let separator = text.firstRange(of: "://") {
            let rest = text[separator.upperBound...]
            guard let slash = rest.firstIndex(of: "/") else { return nil }
            authority = rest[..<slash]
            path = rest[rest.index(after: slash)...]
            switch text[..<separator.lowerBound].lowercased() {
            case "https", "http":
                if let at = authority.lastIndex(of: "@") { authority = authority[authority.index(after: at)...] }

            case "ssh":
                guard authority.hasPrefix("git@") else { return nil }
                authority = authority.dropFirst(4)

            case "git":
                break

            default:
                return nil
            }
        } else {
            guard let colon = text.firstIndex(of: ":"), text.hasPrefix("git@") else { return nil }
            authority = text[..<colon].dropFirst(4)
            path = text[text.index(after: colon)...]
        }
        guard authority.lowercased() == "github.com" else { return nil }
        if path.hasSuffix("/") { path = path.dropLast() }
        if path.hasSuffix(".git") { path = path.dropLast(4) }
        guard !path.contains(where: { $0 == "?" || $0 == "#" }) else { return nil }
        self.init(path)
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
