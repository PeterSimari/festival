//
//  Endpoint.swift
//  festival
//
//  Created by Peter Simari on 8/17/25.
//


public enum Endpoint: String {
    case search = "search"
    
    var httpMethod: HttpMethod {
        switch self {
        case .search:
            return .get
        }
    }
}

enum HttpMethod: String {
    case get, post
}
