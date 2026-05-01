//
//  Code_challengeApp.swift
//  Code challenge
//
//  Created by joseph wright on 2/23/26.
//

import SwiftUI
import SwiftData

@main
struct Code_challengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
