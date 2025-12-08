//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

struct StoreItemListView: View {
    @State private var viewModel = StoreItemListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Media Type", selection: $viewModel.selectedMediaType) {
                    ForEach(MediaType.allCases, id: \.self) { mediaType in
                        Text(mediaType.rawValue.capitalized)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .top])

                HStack {
                    TextField("Search...", text: $viewModel.searchText) {
                        viewModel.fetchMatchingItems(searchText: viewModel.searchText)
                    }
                    Spacer()
                    Button("", systemImage: "arrow.clockwise") {
                        viewModel.fetchMatchingItems(searchText: viewModel.searchText)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .submitLabel(.search)
                .padding([.horizontal, .bottom])
                
                List(viewModel.items, id: \.trackName) { item in
                    ItemCellView(name: item.trackName ?? "Unknown", artist: item.artistName ?? "Unknown", item: item)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTunes Search")
            .onAppear {
                viewModel.fetchMatchingItems(searchText: "")
            }
        }
    }
}

#Preview {
 StoreItemListView()
}
