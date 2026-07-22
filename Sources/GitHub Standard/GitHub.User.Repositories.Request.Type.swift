extension GitHub.User.Repositories.Request {
    public enum `Type`: String, Equatable, Hashable, Sendable {
        case all
        case owner
        case `public`
        case `private`
        case member
    }
}
