import GitHub_Types_Shared

extension GitHub.Collaborators {
    @Cases
    public enum API: Equatable, Sendable {

        case list(owner: String, repo: String, request: GitHub.Collaborators.List.Request? = nil)

        case check(owner: String, repo: String, username: String)

        case add(
            owner: String,
            repo: String,
            username: String,
            request: GitHub.Collaborators.Add.Request? = nil
        )

        case remove(owner: String, repo: String, username: String)

        case getPermission(owner: String, repo: String, username: String)

        case listInvitations(
            owner: String,
            repo: String,
            request: GitHub.Collaborators.Invitations.List.Request? = nil
        )

        case updateInvitation(
            owner: String,
            repo: String,
            invitationId: Int,
            request: GitHub.Collaborators.Invitations.Update.Request
        )

        case deleteInvitation(owner: String, repo: String, invitationId: Int)
    }
}

extension GitHub.Collaborators.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<GitHub.Collaborators.API> {
            OneOf {

                URLRouting.Route(
                    .convert(
                        apply: { (owner: $0.0.0, repo: $0.0.1, request: $0.1) },
                        unapply: { (($0.owner, $0.repo), $0.request) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.list))
                ) {
                    Method.get
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "collaborators" }
                    Optionally {
                        Parse(
                            .convert(
                                apply: { ($0.0.0.0, $0.0.0.1, $0.0.1, $0.1) },
                                unapply: { ((($0.0, $0.1), $0.2), $0.3) }
                            )
                            .map(
                                .memberwise(
                                    GitHub.Collaborators.List.Request.init,
                                    { ($0.affiliation, $0.permission, $0.perPage, $0.page) }
                                )
                            )
                        ) {
                            URLRouting.Query {
                                Optionally {
                                    Field("affiliation") {
                                        Parse(
                                            .string.representing(
                                                GitHub.Collaborators.List.Request.Affiliation.self
                                            )
                                        )
                                    }
                                }
                                Optionally {
                                    Field("permission") {
                                        Parse(
                                            .string.representing(
                                                GitHub.Collaborators.Permission.self
                                            )
                                        )
                                    }
                                }
                                Optionally {
                                    Field("per_page") { Int.parser() }
                                }
                                Optionally {
                                    Field("page") { Int.parser() }
                                }
                            }
                        }
                    }
                }

                URLRouting.Route(
                    .convert(
                        apply: { (owner: $0.0.0, repo: $0.0.1, username: $0.1) },
                        unapply: { (($0.owner, $0.repo), $0.username) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.check))
                ) {
                    Method.get
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "collaborators" }
                    Path { Parse(.string) }
                }

                URLRouting.Route(
                    .convert(
                        apply: {
                            (owner: $0.0.0.0, repo: $0.0.0.1, username: $0.0.1, request: $0.1)
                        },
                        unapply: { ((($0.owner, $0.repo), $0.username), $0.request) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.add))
                ) {
                    Method.put
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "collaborators" }
                    Path { Parse(.string) }
                    Optionally {
                        URLRouting.Body(.json(GitHub.Collaborators.Add.Request.self))
                    }
                }

                URLRouting.Route(
                    .convert(
                        apply: { (owner: $0.0.0, repo: $0.0.1, username: $0.1) },
                        unapply: { (($0.owner, $0.repo), $0.username) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.remove))
                ) {
                    Method.delete
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "collaborators" }
                    Path { Parse(.string) }
                }

                URLRouting.Route(
                    .convert(
                        apply: { (owner: $0.0.0, repo: $0.0.1, username: $0.1) },
                        unapply: { (($0.owner, $0.repo), $0.username) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.getPermission))
                ) {
                    Method.get
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "collaborators" }
                    Path { Parse(.string) }
                    Path { "permission" }
                }

                URLRouting.Route(
                    .convert(
                        apply: { (owner: $0.0.0, repo: $0.0.1, request: $0.1) },
                        unapply: { (($0.owner, $0.repo), $0.request) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.listInvitations))
                ) {
                    Method.get
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "invitations" }
                    Optionally {
                        Parse(
                            .memberwise(
                                GitHub.Collaborators.Invitations.List.Request.init,
                                { ($0.perPage, $0.page) }
                            )
                        ) {
                            URLRouting.Query {
                                Optionally {
                                    Field("per_page") { Int.parser() }
                                }
                                Optionally {
                                    Field("page") { Int.parser() }
                                }
                            }
                        }
                    }
                }

                URLRouting.Route(
                    .convert(
                        apply: {
                            (owner: $0.0.0.0, repo: $0.0.0.1, invitationId: $0.0.1, request: $0.1)
                        },
                        unapply: { ((($0.owner, $0.repo), $0.invitationId), $0.request) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.updateInvitation))
                ) {
                    Method.patch
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "invitations" }
                    Path { Int.parser() }
                    URLRouting.Body(.json(GitHub.Collaborators.Invitations.Update.Request.self))
                }

                URLRouting.Route(
                    .convert(
                        apply: { (owner: $0.0.0, repo: $0.0.1, invitationId: $0.1) },
                        unapply: { (($0.owner, $0.repo), $0.invitationId) }
                    )
                    .map(.case(GitHub.Collaborators.API.cases.deleteInvitation))
                ) {
                    Method.delete
                    Path { "repos" }
                    Path { Parse(.string) }
                    Path { Parse(.string) }
                    Path { "invitations" }
                    Path { Int.parser() }
                }
            }
        }
    }
}
