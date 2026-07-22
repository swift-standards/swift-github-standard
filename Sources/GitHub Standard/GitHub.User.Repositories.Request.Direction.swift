extension GitHub.User.Repositories.Request {
    public enum Direction: String, Equatable, Hashable, Sendable {
        case ascending = "asc"
        case descending = "desc"
    }
}
