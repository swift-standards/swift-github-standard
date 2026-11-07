import RFC_3339
import Tagged
import Testing

@testable import GitHub_Standard

enum `GitHub.Repository.Traffic Tests` {
    typealias Operation = GitHub.Repository.Traffic.Operation
    typealias Paths = GitHub.Repository.Traffic.Paths
    typealias Views = GitHub.Repository.Traffic.Views
}

extension `GitHub.Repository.Traffic Tests` {
    @Suite("`GitHub.Repository.Traffic Tests`.Unit")
    struct Unit {
        @Test
        func `Traffic requests retain provider repository vocabulary`() {
            let views = Views.Request(
                owner: .init("swiftlang"),
                repository: .init("swift"),
                interval: .week
            )
            let paths = Paths.Request(
                owner: .init("swiftlang"),
                repository: .init("swift")
            )

            #expect(views.owner == .init("swiftlang"))
            #expect(views.repository == .init("swift"))
            #expect(views.interval == .week)
            #expect(Operation.views(views) == .views(views))
            #expect(Operation.paths(paths) == .paths(paths))
        }

        @Test
        func `Traffic preserves RFC 3339 timestamps and nonnegative wire counts`() throws(RFC_3339.DateTime.Error) {
            let timestamp = try RFC_3339.DateTime("2026-07-22T10:00:00Z")
            let view = Views.View(timestamp: timestamp, count: 12, uniques: 7)
            let response = Views.Response(count: 12, uniques: 7, views: [view])

            #expect(response.views.first?.timestamp == timestamp)
            #expect(response.count == UInt64(12))
            #expect(response.uniques == UInt64(7))
        }

        @Test
        func `Traffic and Stargazers remain distinct provider domains`() {
            #expect(String(reflecting: Views.self).contains("Traffic"))
            #expect(String(reflecting: GitHub.Repository.Stargazers.self).contains("Stargazers"))
        }
    }
}
