//
//  SearchRequest.swift
//  festival
//
//  Created by Peter Simari on 8/17/25.
//

import Foundation

// https://developer.spotify.com/documentation/web-api/reference/search
struct SearchRequest: Codable {
    let query: String
    let type: [String]
    let market: String?
    let limit: Int?
    let includeExternal: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "q"
        case type
        case market
        case limit
        case includeExternal = "include_external"
    }
}
