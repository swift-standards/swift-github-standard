import GitHub_Repositories_Types
import Testing

@Suite
struct `GitHub Repositories Types Tests` {
    @Test
    func `Repositories API router generates correct URLs`() throws {
        let router = GitHub.Repositories.API.Router()

        let listAPI = GitHub.Repositories.API.list(request: nil)
        let listURL = router.url(for: listAPI)
        #expect(listURL.path == "/user/repos")

        let getAPI = GitHub.Repositories.API.get(owner: "coenttb", repo: "swift-github-types")
        let getURL = router.url(for: getAPI)
        #expect(getURL.path == "/repos/coenttb/swift-github-types")

        let deleteAPI = GitHub.Repositories.API.delete(owner: "coenttb", repo: "test-repo")
        let deleteURL = router.url(for: deleteAPI)
        #expect(deleteURL.path == "/repos/coenttb/test-repo")
    }
}
