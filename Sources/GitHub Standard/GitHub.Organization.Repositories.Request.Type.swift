extension GitHub.Organization.Repositories.Request {
    public enum `Type`: String, Equatable, Hashable, Sendable {
        case all
        case `public`
        case `private`
        case forks
        case sources
        case member
    }
}

extension GitHub.Organization.Repositories.Request.`Type`: CustomStringConvertible {
    public var description: String { self.rawValue }
}
