import SwiftUI
import SwiftData
import PhotosUI
import Combine

struct PhotoScrollView: View {
    @Bindable var journalEntry: JournalEntry
    @State private var viewModel = PhotoViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(journalEntry.photos) { photo in
                    if let uiImage = UIImage(data: photo.data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                PhotosPicker(selection: $viewModel.selectedItems, matching: .images) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                        Text("Add Photo")
                    }
                    .frame(width: 150, height: 150)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .onChange(of: viewModel.selectedItems) {
            viewModel.loadPhotos(into: journalEntry)
        }
    }
}

@Observable
class PhotoViewModel {
    var selectedItems: [PhotosPickerItem] = []
    
    func loadPhotos(into entry: JournalEntry) {
        Task {
            for item in selectedItems {
                if let data = try? await item.loadTransferable(type: Data.self) {
                    let newPhoto = Photo(data: data)
                    entry.photos.append(newPhoto)
                }
            }
            selectedItems = []
        }
    }
}
