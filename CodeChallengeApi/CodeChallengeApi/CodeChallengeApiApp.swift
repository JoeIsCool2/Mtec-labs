import SwiftUI

@main
struct CodeChallengeApiApp: App {
    
    @State private var appSettings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .tabItem { Label("Users", systemImage: "person.3") }
            }
            .environment(appSettings)
    }
}
