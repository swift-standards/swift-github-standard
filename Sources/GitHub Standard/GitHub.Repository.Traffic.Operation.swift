extension GitHub.Repository.Traffic {
    public enum Operation: Equatable, Hashable, Sendable {
        case views(Views.Request)
        case clones(Clones.Request)
        case paths(Paths.Request)
        case referrers(Referrers.Request)
    }
}
