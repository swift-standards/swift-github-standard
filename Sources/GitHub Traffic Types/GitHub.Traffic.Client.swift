//
//  GitHub.Traffic.Client.swift
//  swift-github-types
//
//  Created by Coen ten Thije Boonkkamp on 22/08/2025.
//

import GitHub_Types_Shared

extension GitHub.Traffic.Client {
    /// Leaf error for `GitHub.Traffic.Client` operations. Concrete, per-client, and typed
    /// per the L3 client-modularization leaf-error doctrine — replaces the prior
    /// `throws(any Swift.Error)` existential (issue #19).
    public enum Error: Swift.Error, Sendable, Equatable {
        case views(reason: String)
        case clones(reason: String)
        case paths(reason: String)
        case referrers(reason: String)
    }
}

extension GitHub.Traffic {
    @Witness
    public struct Client: Sendable {
        // https://docs.github.com/en/rest/metrics/traffic#get-repository-views
        public var views:
            @Sendable (_ owner: String, _ repo: String, _ per: Per?) async throws(Client.Error)
                -> Views.Response

        // https://docs.github.com/en/rest/metrics/traffic#get-repository-clones
        public var clones:
            @Sendable (_ owner: String, _ repo: String, _ per: Per?) async throws(Client.Error)
                -> Clones.Response

        // https://docs.github.com/en/rest/metrics/traffic#get-top-referral-paths
        public var paths:
            @Sendable (_ owner: String, _ repo: String) async throws(Client.Error) ->
                Paths.Response

        // https://docs.github.com/en/rest/metrics/traffic#get-top-referral-sources
        public var referrers:
            @Sendable (_ owner: String, _ repo: String) async throws(Client.Error) ->
                Referrers.Response
    }
}
