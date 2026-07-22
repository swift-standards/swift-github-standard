extension GitHub.User.Repositories.Request {
    public enum Visibility: String, Equatable, Hashable, Sendable {
        case all
        case `public`
        case `private`
    }
}
