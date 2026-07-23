import EmailAddress_Standard

extension GitHub.User.Authenticated.Emails.List {
    public struct Email: Equatable, Hashable, Sendable {
        public let email: EmailAddress
        public let primary: Bool
        public let verified: Bool
        public let visibility: String?

        // REASON: GitHub wire boolean; L2 spec-mirroring — the Bool parameters
        //   below are 1:1 transliterations of GitHub REST wire fields, so the
        //   enum rewrite [API-IMPL-003] prescribes would falsify the contract.
        public init(
            email: EmailAddress,
            primary: Bool,  // swift-linter:disable:line bool public parameter
            verified: Bool,  // swift-linter:disable:line bool public parameter
            visibility: String?
        ) {
            self.email = email
            self.primary = primary
            self.verified = verified
            self.visibility = visibility
        }
    }
}
