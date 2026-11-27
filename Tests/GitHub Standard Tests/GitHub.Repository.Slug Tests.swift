import Tagged
import Testing

@testable import GitHub_Standard

enum `GitHub.Repository.Slug Tests` {
    typealias Slug = GitHub.Repository.Slug
}

extension `GitHub.Repository.Slug Tests` {
    @Suite("`GitHub.Repository.Slug Tests`.Unit")
    struct Unit {
        @Test
        func `A slug is an owner and a name`() {
            let text: String = "swift-standards/swift-github-standard"

            #expect(Slug(text)?.owner == .init("swift-standards"))
            #expect(Slug(text)?.name == .init("swift-github-standard"))
            #expect(Slug(text)?.description == text)
        }

        @Test(arguments: [
            "swift-standards",
            "swift-standards/",
            "/swift-github-standard",
            "swift-standards/swift-github-standard/tree",
            "",
        ])
        func `Text that is not exactly two parts spells no slug`(text: String) {
            #expect(Slug(text) == nil)
        }

        @Test(arguments: [
            "https://github.com/swift-standards/swift-github-standard",
            "https://github.com/swift-standards/swift-github-standard.git",
            "https://github.com/swift-standards/swift-github-standard/",
            "https://github.com/swift-standards/swift-github-standard.git/",
            "http://github.com/swift-standards/swift-github-standard",
            "http://github.com/swift-standards/swift-github-standard.git",
            "ssh://git@github.com/swift-standards/swift-github-standard",
            "ssh://git@github.com/swift-standards/swift-github-standard.git",
            "git://github.com/swift-standards/swift-github-standard",
            "git://github.com/swift-standards/swift-github-standard.git",
            "git@github.com:swift-standards/swift-github-standard",
            "git@github.com:swift-standards/swift-github-standard.git",
            "git@github.com:swift-standards/swift-github-standard.git/",
        ])
        func `Every form git takes for github.com names the repository`(remote: String) {
            #expect(Slug(remote: remote) == Slug("swift-standards/swift-github-standard"))
        }

        @Test(arguments: [
            "HTTPS://GitHub.com/swift-standards/swift-github-standard",
            "SSH://git@GITHUB.COM/swift-standards/swift-github-standard",
            "git@GitHub.Com:swift-standards/swift-github-standard",
        ])
        func `The scheme and the host are read in any letter case`(remote: String) {
            #expect(Slug(remote: remote) == Slug("swift-standards/swift-github-standard"))
        }

        @Test
        func `The owner and the name keep the case they were written in`() {
            let slug = Slug(remote: "https://github.com/Swift-Standards/Swift-GitHub-Standard.git")

            #expect(slug == Slug("Swift-Standards/Swift-GitHub-Standard"))
            #expect(slug != Slug("swift-standards/swift-github-standard"))
        }

        @Test(arguments: [
            "https://token@github.com/swift-standards/swift-github-standard.git",
            "https://x-access-token:secret@github.com/swift-standards/swift-github-standard",
            "http://user@github.com/swift-standards/swift-github-standard",
        ])
        func `Over HTTP a user or a credential before the host is dropped`(remote: String) {
            #expect(Slug(remote: remote) == Slug("swift-standards/swift-github-standard"))
        }

        @Test
        func `Only one suffix and one slash are taken off the end`() {
            #expect(Slug(remote: "https://github.com/owner/name.git.git") == Slug("owner/name.git"))
            #expect(Slug(remote: "https://github.com/owner/name//") == nil)
            #expect(Slug(remote: "https://github.com/owner/.git") == nil)
        }

        @Test(arguments: [
            "https://gitlab.com/swift-standards/swift-github-standard",
            "https://github.example.com/swift-standards/swift-github-standard",
            "https://www.github.com/swift-standards/swift-github-standard",
            "https://github.com.example.org/swift-standards/swift-github-standard",
            "https://github.com:443/swift-standards/swift-github-standard",
            "ssh://git@github.com:22/swift-standards/swift-github-standard",
            "ssh://git@ssh.github.com:443/swift-standards/swift-github-standard",
            "git@github.example.com:swift-standards/swift-github-standard.git",
            "git@gitlab.com:swift-standards/swift-github-standard.git",
            "http://127.0.0.1:8080/git/swift-standards/swift-github-standard",
        ])
        func `A remote on another host, or on a port, names no repository`(remote: String) {
            #expect(Slug(remote: remote) == nil)
        }

        @Test(arguments: [
            "ssh://github.com/swift-standards/swift-github-standard",
            "ssh://coen@github.com/swift-standards/swift-github-standard",
            "github.com:swift-standards/swift-github-standard",
            "coen@github.com:swift-standards/swift-github-standard",
            "git://git@github.com/swift-standards/swift-github-standard",
        ])
        func `Over SSH the user is git, and the git protocol takes none`(remote: String) {
            #expect(Slug(remote: remote) == nil)
        }

        @Test(arguments: [
            "ftp://github.com/swift-standards/swift-github-standard",
            "file:///swift-standards/swift-github-standard",
            "github.com/swift-standards/swift-github-standard",
            "swift-standards/swift-github-standard",
            "/git/swift-standards/swift-github-standard",
            "../swift-github-standard",
            "",
        ])
        func `Any other scheme, a path and a bare slug are refused`(remote: String) {
            #expect(Slug(remote: remote) == nil)
        }

        @Test(arguments: [
            "https://github.com",
            "https://github.com/",
            "https://github.com/swift-standards",
            "https://github.com/swift-standards/",
            "https://github.com//swift-github-standard",
            "https://github.com/swift-standards/swift-github-standard/tree/main",
            "https://github.com/swift-standards/swift-github-standard?tab=readme",
            "https://github.com/swift-standards/swift-github-standard#laws",
            "git@github.com:swift-standards",
            "git@github.com:/swift-standards/swift-github-standard",
            "git@github.com:swift-standards/swift-github-standard/tree",
            "ssh://git@github.com/swift-standards",
            "git://github.com/swift-standards/swift-github-standard/issues/1",
        ])
        func `A path that is not exactly an owner and a name is refused`(remote: String) {
            #expect(Slug(remote: remote) == nil)
        }
    }
}
