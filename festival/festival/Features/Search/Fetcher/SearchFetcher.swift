//
//  SearchFetcher.swift
//  festival
//
//  Created by Peter Simari on 8/17/25.
//

import Foundation

struct SearchFetcher: SearchFetching {
    func search(for request: SearchRequest) async throws -> SearchResponse? {
        guard let urlRequest = NetworkCall.makeURLRequest(endpoint: .search, query: generateQuery(with: request)) else {
            throw NetworkError.invalidURL
        }
        
        var searchResponse: SearchResponse?
        var searchError: Error?
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                searchError = NetworkError.requestFailed(error: error?.localizedDescription ?? "")
                return
            }
            do {
                searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
            } catch {
                searchError = NetworkError.decodingFailed(error: error.localizedDescription)
                return
            }
        }
        
        // Test to see if this ever gets triggered?
        // Does return in the above function spit out of the URLSession, or does it jump out of the whole function itself, skipping this?
        // Find out whenever i get the auth token stuff to work
        if let searchError = searchError { throw searchError }
        
        return searchResponse
    }
    
    private func generateQuery(with request: SearchRequest) -> String {
        var query: String = "?q="
        
        query.append(request.query)
        query.append("&\(request.type.joined(separator: ","))")
        if let limit = request.limit {
            query.append("&\(limit)")
        }
        if let market = request.market {
            query.append("&\(market)")
        }
        
        return query
    }
}
