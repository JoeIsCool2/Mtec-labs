//
//  HappyBirthdayPickersAdvApp.swift
//  HappyBirthdayPickersAdv
//
//  Created by joseph wright on 1/9/26.
//

import SwiftUI

@main
struct HappyBirthdayPickersAdvApp: App {
    // Create the source of truth here
    @State private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            // Pass it into the environment
            CardView()
                .environment(viewModel)
        }
    }
}
