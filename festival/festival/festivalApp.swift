//
//  festivalApp.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

@main
struct festivalApp: App {
    @StateObject private var spotifyManager = SpotifyManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(spotifyManager)
                .onOpenURL { url in
                    spotifyManager.handleURL(url)
                }
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .active:
                spotifyManager.connect()
            case .inactive:
                spotifyManager.disconnect()
            case.background:
                spotifyManager.disconnect()
            @unknown default:
                spotifyManager.disconnect()
            }
        }
    }
}
