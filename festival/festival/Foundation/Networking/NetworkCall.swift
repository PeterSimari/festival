//
//  NetworkCall.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import Foundation

public class NetworkCall {
    static func makeURLRequest(endpoint: Endpoint, query: String = "") -> URLRequest? {
        guard let url: URL = URL(string: "https://api.spotify.com/v1/\(endpoint.rawValue)\(query)") else { return nil }
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = endpoint.httpMethod.rawValue
        /// idrk if this is necessary. adding it because it was in my previous project
        if endpoint.httpMethod == .get {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        /// Probably want to reference the project name here later.
        request.setValue("PeterSimari festival iOS App", forHTTPHeaderField: "User-Agent")
        request.setValue("Bearer \("need to generate token")", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
