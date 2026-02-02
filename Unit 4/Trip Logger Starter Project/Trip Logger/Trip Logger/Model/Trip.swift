//
//  Trip.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/17/25.
//

import Foundation
import MapKit
import SwiftData

@Model
final class Trip {
    var id: UUID
    var name: String
    var journalEntries: [JournalEntry]
    
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.journalEntries = []
    }
}

extension Trip {
    static func mock() -> Trip {
        let trip = Trip(name: "France 2025")
        return trip
    }
}
