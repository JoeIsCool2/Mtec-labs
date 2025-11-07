import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .padding(.horizontal, 70)
            .foregroundStyle(.green)
            .font(.custom("Impact", size: 67))
            .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
            .padding()
    }
}

struct DescriptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        ScrollView { // ✅ ensures long text is always readable
            content
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true) // ✅ prevents truncation
                .padding()
                .padding(.horizontal, 40)
                .foregroundStyle(.black)
                .font(.custom("American Typewriter", size: 20))
                .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
                .glassEffect(in: .rect(cornerRadius: 16.0))
        }
        .frame(maxHeight: 250) // ✅ keeps it from pushing buttons off screen
    }
}

struct OptionsStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .padding(.horizontal, 60)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(configuration.isPressed ? Color.green.opacity(0.7) : Color.green)
            )
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 2)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

// Convenience extension so you can just call `.titleStyle()`
extension View {
    func titleStyle() -> some View {
        self.modifier(TitleStyle())
    }
    func descriptionStyle() -> some View {
        self.modifier(DescriptionStyle())
    }
    func optionsStyle() -> some View {
        self.buttonStyle(OptionsStyle())
    }
}

