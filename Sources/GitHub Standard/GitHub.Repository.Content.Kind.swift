extension GitHub.Repository.Content {
    public enum Kind: String, Equatable, Hashable, Sendable {
        case directory = "dir"
        case file
        case submodule
        case symbolicLink = "symlink"
    }
}
