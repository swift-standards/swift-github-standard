import Dependencies
import GitHub_Types_Shared

extension GitHub.OAuth.Client {

    public enum Error: Swift.Error, Sendable, Equatable {
        case exchangeCode(reason: String)
        case getAuthenticatedUser(reason: String)
        case getUserEmails(reason: String)
    }
}

extension GitHub.OAuth {
    @Witness
    public struct Client: @unchecked Sendable {

        public var exchangeCode:
            (
                _ clientId: String,
                _ clientSecret: String,
                _ code: String,
                _ redirectUri: String?
            ) async throws(Client.Error) -> GitHub.OAuth.TokenResponse

        public var getAuthenticatedUser:
            (
                _ accessToken: String
            ) async throws(Client.Error) -> GitHub.OAuth.User

        public var getUserEmails:
            (
                _ accessToken: String
            ) async throws(Client.Error) -> [Email]

        public struct Email: Codable, Sendable {
            public let email: String
            public let primary: Bool
            public let verified: Bool
            public let visibility: String?
        }
    }
}
