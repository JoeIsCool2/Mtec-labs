import SwiftUI

struct Card: Identifiable {
    let id: UUID = UUID()
    let description: String
    let date: Date
    let backgroundColor: Color // Fixed typo: backroundColor -> backgroundColor
    let photoData: Data? // Store data, not Image View
    
    // Helper to convert data to Image for display
    var image: Image {
        if let data = photoData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "party.popper.fill")
        }
    }
}
