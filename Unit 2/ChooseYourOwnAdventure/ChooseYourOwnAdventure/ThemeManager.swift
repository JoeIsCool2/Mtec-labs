import SwiftUI
import Combine
// MARK: - Theme Manager

class ThemeManager: ObservableObject {
    @Published var theme: AdventureTheme = AdventureTheme(
        main: "#2E8B57",
        secondary: "#FFD166",
        background: "#F8F9FA",
        surface: "#FFFFFF",
        textPrimary: "#000000",
        textSecondary: "#555555",
        accent: "#118AB2",
        shadow: "#000000",
        success: "#06D6A0",
        warning: "#FFD166",
        danger: "#EF476F"
    )

    var mainColor: Color { Color(themeHexOrName: theme.main) }
    var secondaryColor: Color { Color(themeHexOrName: theme.secondary) }
    var backgroundColor: Color { Color(themeHexOrName: theme.background) }
    var surfaceColor: Color { Color(themeHexOrName: theme.surface) }
    var textPrimaryColor: Color { Color(themeHexOrName: theme.textPrimary) }
    var textSecondaryColor: Color { Color(themeHexOrName: theme.textSecondary) }
    var accentColor: Color { Color(themeHexOrName: theme.accent) }
    var shadowColor: Color { Color(themeHexOrName: theme.shadow) }
    var successColor: Color { Color(themeHexOrName: theme.success) }
    var warningColor: Color { Color(themeHexOrName: theme.warning) }
    var dangerColor: Color { Color(themeHexOrName: theme.danger) }
}
