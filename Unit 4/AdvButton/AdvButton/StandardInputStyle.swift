import SwiftUI

struct StandardInputStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

extension View {
    func standardInput() -> some View {
        modifier(StandardInputStyle())
    }
}
