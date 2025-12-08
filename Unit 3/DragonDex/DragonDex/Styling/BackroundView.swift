import SwiftUI

struct DragonDexBackgroundView: View {
    @Environment(ColorChooser.self) var appColor
    
    var body: some View {
        ZStack {
            // Base dark gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.white, appColor.backgroundColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DragonDexBackgroundView()
        .environment(DragonDexRouter())
        .environment(ColorChooser())
}
