//
//  SearchView.swift
//  festival
//
//  Created by Peter Simari on 8/16/25.
//

import SwiftUI

public struct SearchView: View {
    @State private var basicSearch: String = ""
    @State var typePicker: SearchType = .album
    
    public var body: some View {
        VStack {
            TextField("Search by", text: $basicSearch)
                .textFieldStyle(.roundedBorder)
            searchTypePickerView
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// Lets not use an apple standard picker. lets make something cooler later.
    /// Itll work for now until i make a design for this screen
    private var searchTypePickerView: some View {
        HStack {
            Picker("", selection: $typePicker) {
                ForEach(SearchType.allCases) { type in
                    Text(type.displayToString).tag(type)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
}
