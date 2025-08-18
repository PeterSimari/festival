//
//  SearchViewModel.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

@MainActor
final class SearchViewModel: ObservableObject {
    var searchFetcher: SearchFetcher = SearchFetcher()
    @Published var results: SearchResponse?
    
    func search(text: String, type: SearchType) async {
        let request: SearchRequest = searchFetcher.createSearchRequest(with: text, type: type.convertToQuery)
        do {
            results = try await searchFetcher.search(for: request)
        } catch {
            results = nil
            print("error", error)
        }
        
    }
}

enum SearchType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case album
    case artist
    case track
    case all
    
    var displayToString: String {
        switch self {
        case .album: "Album"
        case .artist: "Artist"
        case .track: "Track"
        case .all: "Album, Artist, Track"
        }
    }
    
    var convertToQuery: [String] {
        switch self {
        case .album: ["album"]
        case .artist: ["artist"]
        case .track: ["track"]
        case .all: ["album", "artist", "track"]
        }
    }
}
