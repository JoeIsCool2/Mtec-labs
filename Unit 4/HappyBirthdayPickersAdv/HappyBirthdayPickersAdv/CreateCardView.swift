import SwiftUI
import PhotosUI // Required for the Photo Picker

struct CreateCardView: View {
    @Environment(ViewModel.self) var viewModel 
    @Environment(\.dismiss) var dismiss
    
    @State private var date: Date = Date.now
    @State private var backgroundColor: Color = .white
    @State private var description: String = ""
    
    // Photo Picker States
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedPhotoData: Data? = nil
    
    var body: some View {
        Form {
            Section("Card Details") {
                TextField("Describe the party", text: $description)
                
                DatePicker("Date of Party", selection: $date, displayedComponents: .date)
                
                ColorPicker("Background Color", selection: $backgroundColor)
            }
            
            Section("Photo") {
                // The Photo Picker
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    HStack {
                        Image(systemName: "photo")
                        Text("Select a Photo")
                    }
                }
                
                // Image Preview
                if let selectedPhotoData, let uiImage = UIImage(data: selectedPhotoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .listRowInsets(EdgeInsets()) // Removes default padding
                }
            }
        }
        .navigationTitle("New Card")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveCard()
                }
                .fontWeight(.bold)
                .disabled(description.isEmpty) // Prevent saving without a name
            }
        }
        // Logic to convert the picker selection to Data
        .onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                    selectedPhotoData = data
                }
            }
        }
    }
    
    func saveCard() {
        viewModel.addCard(
            description: description,
            date: date,
            color: backgroundColor,
            photoData: selectedPhotoData
        )
        dismiss()
    }
}

#Preview {
    NavigationStack {
        CreateCardView()
            .environment(ViewModel())
    }
}
