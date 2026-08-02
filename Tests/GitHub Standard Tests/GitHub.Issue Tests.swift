import Testing

@testable import GitHub_Standard

extension GitHub.Issue {
    @Suite("GitHub.Issue.Unit")
    struct Unit {
        @Test("Issue numbers are positive")
        func number() {
            #expect(Number(rawValue: 0) == nil)
            #expect(Number(rawValue: 14)?.rawValue == 14)
        }

        @Test("Issue keys retain their repository-scoped identity")
        func key() throws {
            let number = try #require(Number(rawValue: 14))
            let key = Key(
                owner: .init("swift-standards"),
                repository: .init("swift-github-standard"),
                number: number
            )

            #expect(key.owner == .init("swift-standards"))
            #expect(key.repository == .init("swift-github-standard"))
            #expect(key.number == number)
        }

        @Test("Issue states retain known GitHub wire values")
        func state() {
            #expect(State.open.rawValue == "open")
            #expect(State.closed.rawValue == "closed")
            #expect(State.Reason.completed.rawValue == "completed")
            #expect(State.Reason.notPlanned.rawValue == "not_planned")
            #expect(State.Reason.reopened.rawValue == "reopened")
        }

        @Test("Unknown lifecycle wire values are preserved")
        func unknown() {
            #expect(State(rawValue: "archived").rawValue == "archived")
            #expect(State.Reason(rawValue: "migrated").rawValue == "migrated")
        }
    }
}
