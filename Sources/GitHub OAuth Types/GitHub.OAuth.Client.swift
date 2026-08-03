//
//  GitHub.OAuth.Client.swift
//  swift-github-types
//
//  Created by Coen ten Thije Boonkkamp on 10/09/2025.
//

import Dependencies
import GitHub_Types_Shared

extension GitHub.OAuth.Client {
    /// Leaf error for `GitHub.OAuth.Client` operations. Concrete, per-client, and typed per
    /// the L3 client-modularization leaf-error doctrine — replaces the prior
    /// `throws(any Swift.Error)` existential (issue #19).
    public enum Error: Swift.Error, Sendable, Equatable {
        case exchangeCode(reason: String)
        case getAuthenticatedUser(reason: String)
        case getUserEmails(reason: String)
    }
}

extension GitHub.OAuth {
    @Witness
    public struct Client: @unchecked Sendable {
        /// Exchange authorization code for access token
        public var exchangeCode:
            (
                _ clientId: String,
                _ clientSecret: String,
                _ code: String,
                _ redirectUri: String?
            ) async throws(Client.Error) -> GitHub.OAuth.TokenResponse

        /// Get authenticated user information
        public var getAuthenticatedUser:
            (
                _ accessToken: String
            ) async throws(Client.Error) -> GitHub.OAuth.User

        /// Get user's primary email addresses
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
