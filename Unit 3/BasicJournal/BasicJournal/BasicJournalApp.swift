//
//  BasicJournalApp.swift
//  BasicJournal
//
//  Created by joseph wright on 12/2/25.
//

import SwiftUI
import SwiftData

@main
struct BasicJournalApp: App {
    var body: some Scene {
        WindowGroup {
            JournalView()
        }
        .modelContainer(for: [Entry.self, Journal.self])
    }
}
