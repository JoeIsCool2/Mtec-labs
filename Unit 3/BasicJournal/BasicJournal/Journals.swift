import SwiftData
import SwiftUI

@Model
class Journal {
    var id: UUID = UUID()
    var name: String
    var entries: [Entry]
    var createdAt: Date
    
    init(name: String, entries: [Entry], createdAt: Date) {
        self.name = name
        self.entries = entries
        self.createdAt = createdAt
    }
}
