extension GitHub.User.Repositories.Request {
    public enum Sort: String, Equatable, Hashable, Sendable {
        case created
        case updated
        case pushed
        case fullName = "full_name"
    }
}
