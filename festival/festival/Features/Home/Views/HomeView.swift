//
//  HomeView.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var spotify: SpotifyManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if spotify.isConnected {
                    Text("Connected to spotify")
                    if let state = spotify.playerState {
                        Text("Now playing: \(state.track.name)")
                    }
                    Button("Disconnect") {
                        spotify.disconnect()
                    }
                } else {
                    Text("Not connected to spotify")
                    Button("Login to Spotify") {
                        spotify.authorize()
                    }
                }
                Text("Content")
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(Text("Festival"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
