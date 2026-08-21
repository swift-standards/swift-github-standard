extension GitHub {
    public struct LinkHeader: Codable, Equatable, Sendable {
        public let first: URL?
        public let prev: URL?
        public let next: URL?
        public let last: URL?

        public init(
            first: URL? = nil,
            prev: URL? = nil,
            next: URL? = nil,
            last: URL? = nil
        ) {
            self.first = first
            self.prev = prev
            self.next = next
            self.last = last
        }
    }

    public struct PaginationRequest: Codable, Equatable, Sendable {
        public let perPage: Int?
        public let page: Int?

        public init(
            perPage: Int? = nil,
            page: Int? = nil
        ) {
            self.perPage = perPage
            self.page = page
        }

        private enum CodingKeys: String, CodingKey {
            case perPage = "per_page"
            case page
        }
    }
}
