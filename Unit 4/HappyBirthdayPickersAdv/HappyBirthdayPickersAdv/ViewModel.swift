import SwiftUI

@Observable
class ViewModel {
    var cards: [Card] = []
    
    func addCard(description: String, date: Date, color: Color, photoData: Data?) {
        let newCard = Card(
            description: description,
            date: date,
            backgroundColor: color,
            photoData: photoData
        )
        cards.append(newCard)
    }
}
