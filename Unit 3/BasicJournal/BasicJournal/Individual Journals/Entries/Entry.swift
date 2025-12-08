import SwiftData
import Foundation

@Model
class Entry {
    var name: String
    var info: String
    var createdAt: Date
    var journal: Journal?
    
    init(name: String, info: String, createdAt: Date, journal: Journal?) {
        self.name = name
        self.info = info
        self.createdAt = createdAt
        self.journal = journal
    }
}
