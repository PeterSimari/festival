//
//  NetworkCall.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import Foundation

public class NetworkCall {
    static func makeURLRequest(endpoint: Endpoint) -> URLRequest? {
        guard let url: URL = URL(string: "\("milk")/") else { return nil }
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = endpoint.httpMethod.rawValue
        /// idrk if this is necessary. adding it because it was in my previous project
        if endpoint.httpMethod == .get {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.setValue("PeterSimari festival iOS App", forHTTPHeaderField: "User-Agent")
        
        return request
    }
}

enum HttpMethod: String {
    case get, post
}

public enum Endpoint: String {
    case search = ""
    
    var httpMethod: HttpMethod {
        switch self {
        case .search:
            return .get
        }
    }
}
