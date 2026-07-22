extension GitHub.OAuth.Authorization {
    public struct Operation: Equatable, Hashable, Sendable {
        public let request: Request

        public init(request: Request) {
            self.request = request
        }
    }
}
