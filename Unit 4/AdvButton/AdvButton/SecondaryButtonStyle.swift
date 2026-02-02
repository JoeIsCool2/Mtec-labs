import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .foregroundColor(configuration.isPressed ? .gray : .blue)
            .padding(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
