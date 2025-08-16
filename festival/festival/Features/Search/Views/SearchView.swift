//
//  SearchView.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

public struct SearchView: View {
    @State private var basicSearch: String = ""
    
    public var body: some View {
        VStack {
            TextField("Search by", text: $basicSearch)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}
