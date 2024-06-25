// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let charcoalFoundation = try CharcoalFoundation(json)

import Foundation

// MARK: - CharcoalFoundation
public struct CharcoalFoundation: Codable {
    public let borderRadius: CharcoalBorderRadius
    public let spacing: CharcoalSpacing
    public let typography: CharcoalTypography

    public init(borderRadius: CharcoalBorderRadius, spacing: CharcoalSpacing, typography: CharcoalTypography) {
        self.borderRadius = borderRadius
        self.spacing = spacing
        self.typography = typography
    }
}

// MARK: CharcoalFoundation convenience initializers and mutators

public extension CharcoalFoundation {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharcoalFoundation.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        borderRadius: CharcoalBorderRadius? = nil,
        spacing: CharcoalSpacing? = nil,
        typography: CharcoalTypography? = nil
    ) -> CharcoalFoundation {
        return CharcoalFoundation(
            borderRadius: borderRadius ?? self.borderRadius,
            spacing: spacing ?? self.spacing,
            typography: typography ?? self.typography
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharcoalBorderRadius
public struct CharcoalBorderRadius: Codable {
    public let the4, the8, the16, the24: Int
    public let none, oval: Int

    public enum CodingKeys: String, CodingKey {
        case the4 = "4"
        case the8 = "8"
        case the16 = "16"
        case the24 = "24"
        case none, oval
    }

    public init(the4: Int, the8: Int, the16: Int, the24: Int, none: Int, oval: Int) {
        self.the4 = the4
        self.the8 = the8
        self.the16 = the16
        self.the24 = the24
        self.none = none
        self.oval = oval
    }
}

// MARK: CharcoalBorderRadius convenience initializers and mutators

public extension CharcoalBorderRadius {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharcoalBorderRadius.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        the4: Int? = nil,
        the8: Int? = nil,
        the16: Int? = nil,
        the24: Int? = nil,
        none: Int? = nil,
        oval: Int? = nil
    ) -> CharcoalBorderRadius {
        return CharcoalBorderRadius(
            the4: the4 ?? self.the4,
            the8: the8 ?? self.the8,
            the16: the16 ?? self.the16,
            the24: the24 ?? self.the24,
            none: none ?? self.none,
            oval: oval ?? self.oval
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharcoalSpacing
public struct CharcoalSpacing: Codable {
    public let the0, the4, the8, the16: Int
    public let the24, the40, the64, the104: Int
    public let the168, the272, the440: Int

    public enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the4 = "4"
        case the8 = "8"
        case the16 = "16"
        case the24 = "24"
        case the40 = "40"
        case the64 = "64"
        case the104 = "104"
        case the168 = "168"
        case the272 = "272"
        case the440 = "440"
    }

    public init(the0: Int, the4: Int, the8: Int, the16: Int, the24: Int, the40: Int, the64: Int, the104: Int, the168: Int, the272: Int, the440: Int) {
        self.the0 = the0
        self.the4 = the4
        self.the8 = the8
        self.the16 = the16
        self.the24 = the24
        self.the40 = the40
        self.the64 = the64
        self.the104 = the104
        self.the168 = the168
        self.the272 = the272
        self.the440 = the440
    }
}

// MARK: CharcoalSpacing convenience initializers and mutators

public extension CharcoalSpacing {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharcoalSpacing.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        the0: Int? = nil,
        the4: Int? = nil,
        the8: Int? = nil,
        the16: Int? = nil,
        the24: Int? = nil,
        the40: Int? = nil,
        the64: Int? = nil,
        the104: Int? = nil,
        the168: Int? = nil,
        the272: Int? = nil,
        the440: Int? = nil
    ) -> CharcoalSpacing {
        return CharcoalSpacing(
            the0: the0 ?? self.the0,
            the4: the4 ?? self.the4,
            the8: the8 ?? self.the8,
            the16: the16 ?? self.the16,
            the24: the24 ?? self.the24,
            the40: the40 ?? self.the40,
            the64: the64 ?? self.the64,
            the104: the104 ?? self.the104,
            the168: the168 ?? self.the168,
            the272: the272 ?? self.the272,
            the440: the440 ?? self.the440
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharcoalTypography
public struct CharcoalTypography: Codable {
    public let size: CharcoalSize

    public init(size: CharcoalSize) {
        self.size = size
    }
}

// MARK: CharcoalTypography convenience initializers and mutators

public extension CharcoalTypography {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharcoalTypography.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        size: CharcoalSize? = nil
    ) -> CharcoalTypography {
        return CharcoalTypography(
            size: size ?? self.size
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharcoalSize
public struct CharcoalSize: Codable {
    public let the12, the14, the16, the20: CharcoalThe12
    public let the32: CharcoalThe12

    public enum CodingKeys: String, CodingKey {
        case the12 = "12"
        case the14 = "14"
        case the16 = "16"
        case the20 = "20"
        case the32 = "32"
    }

    public init(the12: CharcoalThe12, the14: CharcoalThe12, the16: CharcoalThe12, the20: CharcoalThe12, the32: CharcoalThe12) {
        self.the12 = the12
        self.the14 = the14
        self.the16 = the16
        self.the20 = the20
        self.the32 = the32
    }
}

// MARK: CharcoalSize convenience initializers and mutators

public extension CharcoalSize {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharcoalSize.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        the12: CharcoalThe12? = nil,
        the14: CharcoalThe12? = nil,
        the16: CharcoalThe12? = nil,
        the20: CharcoalThe12? = nil,
        the32: CharcoalThe12? = nil
    ) -> CharcoalSize {
        return CharcoalSize(
            the12: the12 ?? self.the12,
            the14: the14 ?? self.the14,
            the16: the16 ?? self.the16,
            the20: the20 ?? self.the20,
            the32: the32 ?? self.the32
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharcoalThe12
public struct CharcoalThe12: Codable {
    public let fontSize, lineHeight: Int

    public init(fontSize: Int, lineHeight: Int) {
        self.fontSize = fontSize
        self.lineHeight = lineHeight
    }
}

// MARK: CharcoalThe12 convenience initializers and mutators

public extension CharcoalThe12 {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharcoalThe12.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        fontSize: Int? = nil,
        lineHeight: Int? = nil
    ) -> CharcoalThe12 {
        return CharcoalThe12(
            fontSize: fontSize ?? self.fontSize,
            lineHeight: lineHeight ?? self.lineHeight
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
