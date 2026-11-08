import GitHub_Collaborators_Types
import GitHub_OAuth_Types
import GitHub_Repositories_Types
import GitHub_Stargazers_Types
import GitHub_Traffic_Types
import GitHub_Types_Shared

extension GitHub {
    @Cases
    public enum API: Equatable, Sendable {
        case traffic(Traffic.API)
        case repositories(Repositories.API)
        case stargazers(Stargazers.API)
        case oauth(OAuth.API)
        case collaborators(Collaborators.API)
    }
}

extension GitHub.API {
}
