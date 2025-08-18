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
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        do {
            let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
            return searchResponse
        } catch {
            throw NetworkError.decodingFailed(error: error.localizedDescription)
        }
    }
    
    func createSearchRequest(with: String,
                             type: [String],
                             market: String? = nil,
                             limit: Int? = nil,
                             includeExternal: String? = nil) -> SearchRequest {
        return SearchRequest(query: with,
                             type: type,
                             market: market,
                             limit: limit,
                             includeExternal: includeExternal)
    }
    
    /// Test this function to make sure it generates the right URL
    /// And instead of creating the URL like this... why dont we acutally figure out how to use a URLComponents + URL to make a proper URL request
    private func generateQuery(with request: SearchRequest) -> String {
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "q", value: request.query),
            URLQueryItem(name: "type", value: request.type.joined(separator: ","))
        ]
        
        if let limit = request.limit {
            components.queryItems?.append(URLQueryItem(name: "limit", value: "\(limit)"))
        }
        if let market = request.market {
            components.queryItems?.append(URLQueryItem(name: "market", value: market))
        }
        
        return "?" + (components.percentEncodedQuery ?? "")
    }
}
