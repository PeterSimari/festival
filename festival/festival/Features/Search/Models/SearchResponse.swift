//
//  SearchResponse.swift
//  festival
//
//  Created by Peter Simari on 8/17/25.
//

import Foundation

// MARK: Search

struct SearchResponse: Codable {
    let tracks: Tracks?
    let artists: Artists?
    let albums: Albums?
}

// MARK: Tracks

struct Tracks: Codable {
    let href: String?
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
    let items: [TrackObject]?
}

struct TrackObject: Codable {
    let album: SimplifiedAlbumObject?
    let artists: [SimplifiedArtistObject]?
    let availableMarkets: [String]?
    let discNumber: Int?
    let durationMs: Int?
    let explicit: Bool?
    let externalIds: ExternalIds?
    let externalUrls: ExternalUrl?
    let href: String?
    let id: String?
    let isPlayable: Bool?
    let linkedFrom: LinkedFrom?
    let restrictions: Restrictions?
    let name: String?
    let popularity: Int?
    let previewUrl: String?
    let trackNumber: Int?
    let type: String?
    let uri: String?
    let isLocal: Bool?
    
    enum CodingKeys: String, CodingKey {
        case album
        case artists
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMs = "duration_ms"
        case explicit
        case externalIds = "external_ids"
        case externalUrls = "external_urls"
        case href
        case id
        case isPlayable = "is_playable"
        case linkedFrom = "linked_from"
        case restrictions
        case name
        case popularity
        case previewUrl = "preview_url"
        case trackNumber = "track_number"
        case type
        case uri
        case isLocal = "is_local"
    }
}

// MARK: Artists

struct Artists: Codable {
    let href: String?
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
    let items: [ArtistObject]?
}

struct ArtistObject: Codable {
    let externalUrls: ExternalUrl?
    let followers: Followers?
    let genres: [String]?
    let href: String?
    let id: String?
    let images: [ImageObject]?
    let name: String?
    let popularity: Int?
    let type: String?
    let uri: String?
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case followers
        case genres
        case href
        case id
        case images
        case name
        case popularity
        case type
        case uri
    }
}

struct Followers: Codable {
    let href: String?
    let total: Int?
}

struct SimplifiedArtistObject: Codable {
    let externalUrls: ExternalUrl?
    let href: String?
    let id: String?
    let name: String?
    let type: String?
    let uri: String?
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href
        case id
        case name
        case type
        case uri
    }
}

// MARK: Albums

struct Albums: Codable {
    let href: String?
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
    let items: [SimplifiedAlbumObject]?
}

struct SimplifiedAlbumObject: Codable {
    let albumType: String?
    let totalTracks: Int?
    let availableMarkets: [String]?
    let externalUrls: ExternalUrl?
    let href: String?
    let id: String?
    let images: [ImageObject]?
    let name: String?
    let releaseDate: String?
    let releaseDatePrecision: String?
    let restrictions: Restrictions?
    let type: String?
    let uri: String?
    let artists: [SimplifiedArtistObject]?
    
    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case totalTracks = "total_tracks"
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href
        case id
        case images
        case name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case restrictions
        case type
        case uri
        case artists
    }
}

// MARK: Commons

struct ExternalUrl: Codable {
    let spotify: String?
}

struct Restrictions: Codable {
    let reason: String?
}

struct ImageObject: Codable {
    let url: String?
    let height: Int?
    let width: Int?
}

struct ExternalIds: Codable {
    let isrc: String?
    let ean: String?
    let upc: String?
}

/// i dont really know about this one? no fields from the API. maybe network interception will work
struct LinkedFrom: Codable { }
