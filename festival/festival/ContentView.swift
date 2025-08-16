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
                HomeView()
            }
            Tab("", systemImage: "magnifyingglass", value: 1) {
                
            }
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
