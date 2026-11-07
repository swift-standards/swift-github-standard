import Tagged
import Testing

@testable import GitHub_Standard

enum `GitHub.Repository.Content Tests` {
    typealias Kind = GitHub.Repository.Content.Kind
    typealias Operation = GitHub.Repository.Content.Operation
    typealias Path = GitHub.Repository.Content.Path
    typealias Request = GitHub.Repository.Content.Request
}

extension `GitHub.Repository.Content Tests` {
    @Suite("`GitHub.Repository.Content Tests`.Unit")
    struct Unit {
        @Test
        func `The operation retains the provider content request`() throws {
            let path = try #require(Path(segments: ["Sources", "Package.swift"]))
            let request = Request(
                organization: .init("swift-institute"),
                repository: .init("Workspace"),
                path: path
            )

            #expect(Operation(request: request).request == request)
            #expect(request.path.segments == ["Sources", "Package.swift"])
        }

        @Test
        func `Content paths are nonempty relative segment sequences`() {
            #expect(Path(segments: []) == nil)
            #expect(Path(segments: [""]) == nil)
            #expect(Path(segments: [".."]) == nil)
            #expect(Path(segments: ["Package.swift"])?.segments == ["Package.swift"])
        }

        @Test
        func `Provider content kinds retain their wire spellings`() {
            #expect(Kind(rawValue: "dir") == .directory)
            #expect(Kind(rawValue: "file") == .file)
            #expect(Kind(rawValue: "symlink") == .symbolicLink)
            #expect(Kind(rawValue: "submodule") == .submodule)
        }
    }
}
