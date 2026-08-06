extension GitHub.Issue.State {
    // swift-linter:disable:next untyped throws
    // REASON: Decodable's protocol witness fixes an untyped error boundary.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(rawValue: try container.decode(String.self))
    }

    // swift-linter:disable:next untyped throws
    // REASON: Encodable's protocol witness fixes an untyped error boundary.
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
