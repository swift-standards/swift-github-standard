extension GitHub.Repository {
    public struct Name: Equatable, Hashable, Sendable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
