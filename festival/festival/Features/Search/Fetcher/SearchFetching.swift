//
//  SearchFetching.swift
//  festival
//
//  Created by Peter Simari on 8/17/25.
//

protocol SearchFetching {
    func search(for: SearchRequest) async throws -> SearchResponse?
}
