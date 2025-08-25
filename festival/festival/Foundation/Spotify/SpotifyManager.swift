//
//  SpotifyManager.swift
//  festival
//
//  Created by Peter Simari on 8/24/25.
//

import CryptoKit
import Foundation
import SpotifyiOS

class SpotifyManager: NSObject, ObservableObject {
    private let configuration: SPTConfiguration
    private let appRemote: SPTAppRemote
    private let clientID = "162a153c6d594752a7712e0d4dff82a1"
    
    @Published var isConnected = false
    @Published var playerState: SPTAppRemotePlayerState?
    
    override init() {
        let redirectURI: URL = URL(string: "festival://callback")!
        
        self.configuration = SPTConfiguration(clientID: clientID, redirectURL: redirectURI)
        self.appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        
        super.init()
        self.appRemote.delegate = self
    }
    
    // MARK: Authorization
    
    func authorize() {
        appRemote.authorizeAndPlayURI("")
    }
    
    func handleURL(_ url: URL) {
        let parameters = appRemote.authorizationParameters(from: url)
        
        if let token = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = token
            connect()
        } else if let error = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print("Spotify Auth Error:", error)
        }
    }
    
    // MARK: Connection
    
    func connect() {
        if !appRemote.isConnected {
            appRemote.connect()
        }
    }
    
    func disconnect() {
        if appRemote.isConnected {
            appRemote.disconnect()
        }
    }
}

extension SpotifyManager: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        DispatchQueue.main.async { self.isConnected = true }
        appRemote.playerAPI?.delegate = self
        appRemote.playerAPI?.subscribe(toPlayerState: { _, _ in })
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: (any Error)?) {
        DispatchQueue.main.async { self.isConnected = false }
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: (any Error)?) {
        DispatchQueue.main.async { self.isConnected = false }
    }
}

extension SpotifyManager: SPTAppRemotePlayerStateDelegate {
    func playerStateDidChange(_ playerState: any SPTAppRemotePlayerState) {
        DispatchQueue.main.async { self.playerState = playerState }
    }
}

// MARK: Access Token
// commenting this out until i can come up with a better solution for keeping the user signed in
//extension SpotifyManager {
//    func refreshAccessToken(refreshToken: String) async throws -> String {
//        var request: URLRequest = URLRequest(url: URL(string: "https://accounts.spotify.com/api/token")!)
//        request.httpMethod = "POST"
//        let body = "grant_type=refresh_token&refresh_token=\(refreshToken)&client_id=\(clientID)&client_secret=\(clientSecret)"
//    }
//}
