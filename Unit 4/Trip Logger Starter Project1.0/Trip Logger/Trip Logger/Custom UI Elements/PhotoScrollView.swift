//
//  PhotoScrollView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct PhotoScrollView: View {
    @Bindable var journalEntry: JournalEntry
    
    @State private var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                // REQUIRED: Display existing photos
                ForEach(journalEntry.photos) { photo in
                    if let uiImage = UIImage(data: photo.data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                // Photo Picker
                PhotosPicker(
                    selection: $selectedItems,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    VStack(spacing: 10) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        Text("Add Photo")
                            .font(.caption)
                    }
                    .frame(width: 150, height: 150)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .onChange(of: selectedItems) {
                    loadTransferable()
                }
            }
            .padding(.horizontal)
        }
    }
    
    func loadTransferable() {
        Task {
            for item in selectedItems {
                if let data = try? await item.loadTransferable(type: Data.self) {
                    let newPhoto = Photo(data: data)
                    journalEntry.photos.append(newPhoto)
                }
            }
            // BLACK DIAMOND FIX: Clear selection to prevent re-adding or bugs
            selectedItems = []
        }
    }
}
