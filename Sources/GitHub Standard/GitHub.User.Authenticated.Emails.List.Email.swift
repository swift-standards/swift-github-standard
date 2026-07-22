import EmailAddress_Standard

extension GitHub.User.Authenticated.Emails.List {
    public struct Email: Equatable, Hashable, Sendable {
        public let email: EmailAddress
        public let primary: Bool
        public let verified: Bool
        public let visibility: String?

        public init(
            email: EmailAddress,
            primary: Bool,
            verified: Bool,
            visibility: String?
        ) {
            self.email = email
            self.primary = primary
            self.verified = verified
            self.visibility = visibility
        }
    }
}
