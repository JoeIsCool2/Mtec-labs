import SwiftUI

@Observable
class DragonDexRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case DragonList
        case DragonDetail(dragon: Dragon)
        case PowerList(dragon: Dragon)
        case Settings
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .DragonList:
            DragonListView()
        case let .DragonDetail(dragon):
            DragonDetailView(dragon: dragon)
        case let .PowerList(dragon):
            PowerListView(dragon: dragon)
        case .Settings:
            SettingsView()
        }
    }
    
    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
}
