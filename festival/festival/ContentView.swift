//
//  ContentView.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Tab("", systemImage: "house", value: 0) {
                NavigationStack(root: {
                    HomeView()
                })
            }
            Tab("", systemImage: "magnifyingglass", value: 1) {
                NavigationStack(root: {
                    SearchView()
                })
            }
            /// Im considering keeping this, or just letting people search and add from the other tabs.
//            Tab("", systemImage: "plus.diamond", value: 2) {
//                
//            }
            Tab("", systemImage: "headphones", value: 3) {
                
            }
            Tab("", systemImage: "person", value: 4) {
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
