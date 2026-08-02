import Testing

@testable import GitHub_Standard

extension GitHub.Issue {
    @Suite("GitHub.Issue.Unit")
    struct Unit {
        @Test("Issue numbers are positive")
        func `Issue numbers are positive`() {
            #expect(Number(rawValue: 0) == nil)
            #expect(Number(rawValue: 14)?.rawValue == 14)
        }

        @Test("Issue keys retain their repository-scoped identity")
        func `Issue keys retain their repository-scoped identity`() throws {
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
        func `Issue states retain known GitHub wire values`() {
            #expect(State.open.rawValue == "open")
            #expect(State.closed.rawValue == "closed")
            #expect(State.Reason.completed.rawValue == "completed")
            #expect(State.Reason.notPlanned.rawValue == "not_planned")
            #expect(State.Reason.reopened.rawValue == "reopened")
        }

        @Test("Unknown lifecycle wire values are preserved")
        func `Unknown lifecycle wire values are preserved`() {
            #expect(State(rawValue: "archived").rawValue == "archived")
            #expect(State.Reason(rawValue: "migrated").rawValue == "migrated")
        }

        @Test("Known reason wire strings decode and re-encode unchanged")
        func `Known reason wire strings decode and re-encode unchanged`() throws {
            for wireValue in ["completed", "not_planned", "reopened"] {
                let decoded = try State.Reason(from: Wire.Decoder(wireValue))
                let encoded = try Wire.encode(decoded)

                #expect(decoded.rawValue == wireValue)
                #expect(encoded == wireValue)
            }
        }

        @Test("Unknown reason wire strings decode and re-encode unchanged")
        func `Unknown reason wire strings decode and re-encode unchanged`() throws {
            let decoded = try State.Reason(from: Wire.Decoder("migrated"))
            let encoded = try Wire.encode(decoded)

            #expect(decoded.rawValue == "migrated")
            #expect(encoded == "migrated")
        }

        private enum Wire {
            static func encode<Value: Encodable>(_ value: Value) throws -> String {
                let encoder = Encoder()
                try value.encode(to: encoder)
                return try #require(encoder.value)
            }

            final class Encoder: Swift.Encoder, SingleValueEncodingContainer {
                var value: String?
                var codingPath: [any CodingKey] { [] }
                var userInfo: [CodingUserInfoKey: Any] { [:] }

                func container<Key>(keyedBy: Key.Type) -> KeyedEncodingContainer<Key> {
                    fatalError("unsupported")
                }

                func unkeyedContainer() -> UnkeyedEncodingContainer {
                    fatalError("unsupported")
                }

                func singleValueContainer() -> any SingleValueEncodingContainer { self }

                func encodeNil() throws { fatalError("unsupported") }
                func encode(_ value: Bool) throws { fatalError("unsupported") }
                func encode(_ value: String) throws { self.value = value }
                func encode(_ value: Double) throws { fatalError("unsupported") }
                func encode(_ value: Float) throws { fatalError("unsupported") }
                func encode(_ value: Int) throws { fatalError("unsupported") }
                func encode(_ value: Int8) throws { fatalError("unsupported") }
                func encode(_ value: Int16) throws { fatalError("unsupported") }
                func encode(_ value: Int32) throws { fatalError("unsupported") }
                func encode(_ value: Int64) throws { fatalError("unsupported") }
                func encode(_ value: UInt) throws { fatalError("unsupported") }
                func encode(_ value: UInt8) throws { fatalError("unsupported") }
                func encode(_ value: UInt16) throws { fatalError("unsupported") }
                func encode(_ value: UInt32) throws { fatalError("unsupported") }
                func encode(_ value: UInt64) throws { fatalError("unsupported") }

                func encode<Value: Encodable>(_ value: Value) throws {
                    try value.encode(to: self)
                }
            }

            struct Decoder: Swift.Decoder, SingleValueDecodingContainer {
                let value: String
                var codingPath: [any CodingKey] { [] }
                var userInfo: [CodingUserInfoKey: Any] { [:] }

                init(_ value: String) {
                    self.value = value
                }

                func container<Key>(keyedBy: Key.Type) throws -> KeyedDecodingContainer<Key> {
                    fatalError("unsupported")
                }

                func unkeyedContainer() throws -> UnkeyedDecodingContainer {
                    fatalError("unsupported")
                }

                func singleValueContainer() throws -> any SingleValueDecodingContainer { self }

                func decodeNil() -> Bool { false }
                func decode(_ type: Bool.Type) throws -> Bool { fatalError("unsupported") }
                func decode(_ type: String.Type) throws -> String { value }
                func decode(_ type: Double.Type) throws -> Double { fatalError("unsupported") }
                func decode(_ type: Float.Type) throws -> Float { fatalError("unsupported") }
                func decode(_ type: Int.Type) throws -> Int { fatalError("unsupported") }
                func decode(_ type: Int8.Type) throws -> Int8 { fatalError("unsupported") }
                func decode(_ type: Int16.Type) throws -> Int16 { fatalError("unsupported") }
                func decode(_ type: Int32.Type) throws -> Int32 { fatalError("unsupported") }
                func decode(_ type: Int64.Type) throws -> Int64 { fatalError("unsupported") }
                func decode(_ type: UInt.Type) throws -> UInt { fatalError("unsupported") }
                func decode(_ type: UInt8.Type) throws -> UInt8 { fatalError("unsupported") }
                func decode(_ type: UInt16.Type) throws -> UInt16 { fatalError("unsupported") }
                func decode(_ type: UInt32.Type) throws -> UInt32 { fatalError("unsupported") }
                func decode(_ type: UInt64.Type) throws -> UInt64 { fatalError("unsupported") }

                func decode<Value: Decodable>(_ type: Value.Type) throws -> Value {
                    try Value(from: self)
                }
            }
        }
    }
}
