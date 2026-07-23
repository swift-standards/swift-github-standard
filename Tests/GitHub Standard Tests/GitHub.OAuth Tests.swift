import RFC_3986
import Testing

@testable import GitHub_Standard

extension GitHub.OAuth {
    @Suite("GitHub.OAuth.Unit")
    struct Unit {
        @Test("Authorization preserves provider query values")
        func authorization() throws(RFC_3986.Error) {
            let redirectURI = try RFC_3986.URI("https://example.com/oauth/callback")
            let request = Authorization.Request(
                clientID: "client-id",
                redirectURI: redirectURI,
                scopes: ["read:user", "user:email"],
                state: "opaque-state"
            )

            #expect(Authorization.Operation(request: request).request == request)
            #expect(request.redirectURI == redirectURI)
            #expect(request.scopes == ["read:user", "user:email"])
        }

        @Test("Token exchange preserves provider wire values")
        func token() throws(RFC_3986.Error) {
            let redirectURI = try RFC_3986.URI("https://example.com/oauth/callback")
            let request = Token.Exchange.Request(
                clientID: "client-id",
                clientSecret: "client-secret",
                code: "authorization-code",
                redirectURI: redirectURI
            )
            let response = Token.Exchange.Response(
                accessToken: "access-token",
                tokenType: "bearer",
                scope: "read:user,user:email"
            )

            #expect(Token.Exchange.Operation(request: request).request == request)
            #expect(response.tokenType == "bearer")
            #expect(response.scope == "read:user,user:email")
        }
    }
}
