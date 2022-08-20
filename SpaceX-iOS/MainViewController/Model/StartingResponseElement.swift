// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let startingResponse = try? newJSONDecoder().decode(StartingResponse.self, from: jsonData)

import Foundation

typealias StartingResponse = [StartingResponseElement]

// MARK: - StartingResponseElement
struct StartingResponseElement: Codable {
    var fairings: Fairings?
    var links: Links
    var staticFireDateUTC: String?
    var staticFireDateUnix: Int?
    var net: Bool
    var window: Int?
    var rocket: String?
    var success: Bool?
    var failures: [Failure]
    var details: String?
    var crew, ships, capsules, payloads: [String]
    var launchpad: String?
    var flightNumber: Int
    var name, dateUTC: String
    var dateUnix: Int
    var dateLocal: Date
    var datePrecision: DatePrecision
    var upcoming: Bool
    var cores: [Core]
    var autoUpdate, tbd: Bool
    var launchLibraryID: String?
    var id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }
}

// MARK: - Core
struct Core: Codable {
    var core: String?
    var flight: Int?
    var gridfins, legs, reused, landingAttempt: Bool?
    var landingSuccess: Bool?
    var landingType: LandingType?
    var landpad: String?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}


enum DatePrecision: String, Codable {
    case day = "day"
    case hour = "hour"
    case month = "month"
}

// MARK: - Failure
struct Failure: Codable {
    var time: Int
    var altitude: Int?
    var reason: String
}

// MARK: - Fairings
struct Fairings: Codable {
    var reused, recoveryAttempt, recovered: Bool?
    var ships: [String]

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ships
    }
}


// MARK: - Links
struct Links: Codable {
    var patch: Patch
    var reddit: Reddit
    var flickr: Flickr
    var presskit: String?
    var webcast: String?
    var youtubeID: String?
    var article: String?
    var wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
    }
}

// MARK: - Flickr
struct Flickr: Codable {
    var original: [String]
}

// MARK: - Patch
struct Patch: Codable {
    var small, large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    var campaign: String?
    var launch: String?
    var media, recovery: String?
}



