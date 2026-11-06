extension GitHub.Repository.Slug: ExpressibleByStringInterpolation {

    /// The slug a literal spells. A literal that isn't `owner/name` is a programmer error, as an invalid `Path` literal is;
    /// text from outside goes through ``init(_:)``, which answers `nil`.
    public init(stringLiteral value: String) {
        guard let slug = Self(value) else { fatalError("not an owner/name slug: \(value)") }
        self = slug
    }
}
