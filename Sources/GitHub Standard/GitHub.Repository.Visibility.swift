extension GitHub.Repository {
    public enum Visibility: String, Equatable, Hashable, Sendable {
        case `public`
        case `private`
        case `internal`
    }
}
