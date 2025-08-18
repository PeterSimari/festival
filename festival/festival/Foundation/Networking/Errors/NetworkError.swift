//
//  NetworkError.swift
//  festival
//
//  Created by Peter Simari on 8/17/25.
//

enum NetworkError: Error {
    case invalidURL
    case requestFailed(error: String)
    case decodingFailed(error: String)
}
