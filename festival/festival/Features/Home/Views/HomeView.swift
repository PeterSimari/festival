//
//  HomeView.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Content")
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(Text("Festival"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
