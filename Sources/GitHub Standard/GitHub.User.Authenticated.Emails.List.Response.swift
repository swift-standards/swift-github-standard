extension GitHub.User.Authenticated.Emails.List {
    public struct Response: Equatable, Hashable, Sendable {
        public let emails: [Email]

        public init(emails: [Email]) {
            self.emails = emails
        }
    }
}
