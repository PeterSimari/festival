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
    @Published var results = []
    
    func search(_ text: String) async {
        
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
        case .all: "Album, Artist, Track"
        case .album: "Album"
        case .artist: "Artist"
        case .track: "Track"
        }
    }
}
