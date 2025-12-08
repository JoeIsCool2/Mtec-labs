import SwiftUI

struct SettingsView: View {
    @Environment(ColorChooser.self) var colorChooser

    var body: some View {
        ZStack {
            DragonDexBackgroundView()
            VStack {
                ColorPicker("Background", selection: Binding(
                    get: { colorChooser.backgroundColor },
                    set: { newColor in
                        colorChooser.backgroundColor = newColor
                        colorChooser.findColors()
                    }
                ))
                .foregroundStyle(colorChooser.textColor)
            }
            .padding()
            .glassEffect(.regular.tint(colorChooser.capsuleColor).interactive(), in: .rect(cornerRadius: 16.0))
            .padding()
        }
    }
}


#Preview {
    SettingsView()
        .environment(DragonDexRouter())
        .environment(ColorChooser())
}
