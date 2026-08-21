import GitHub_Collaborators_Types
import GitHub_OAuth_Types
import GitHub_Repositories_Types
import GitHub_Stargazers_Types
import GitHub_Traffic_Types
import GitHub_Types_Shared

extension GitHub {
    public struct Client: Sendable {
        public var traffic: Traffic.Client
        public var repositories: Repositories.Client
        public var stargazers: Stargazers.Client
        public var oauth: OAuth.Client
        public var collaborators: Collaborators.Client

        public init(
            traffic: Traffic.Client,
            repositories: Repositories.Client,
            stargazers: Stargazers.Client,
            oauth: OAuth.Client,
            collaborators: Collaborators.Client
        ) {
            self.traffic = traffic
            self.repositories = repositories
            self.stargazers = stargazers
            self.oauth = oauth
            self.collaborators = collaborators
        }
    }
}
