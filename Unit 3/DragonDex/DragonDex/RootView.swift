import SwiftUI

@main
struct DragonDexApp: App {
    @State private var router = DragonDexRouter()
    @State private var appColor = ColorChooser()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navigationPath) {
                DragonListView()
                    .navigationDestination(for: DragonDexRouter.Route.self) { route in
                        router.view(for: route)
                    }
            }
            .environment(router)
            .environment(appColor)
        }
    }
}
