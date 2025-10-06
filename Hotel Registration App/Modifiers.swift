import SwiftUI

struct EnterData: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .font(.custom("Andale Mono", size: 20))
            .shadow(color: .gray, radius: 5, x: 0, y: 1)
            .foregroundStyle(.text)
            .padding(2)
            .padding(.horizontal, 10)
    }
}

struct Solid: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(colors: [.white, .background], startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule())
            .font(.custom("Andale Mono", size: 20))
            .shadow(color: .gray, radius: 5, x: 0, y: 1)
            .foregroundStyle(.text)
            .padding(2)
            .padding(.horizontal, 10)
    }
}
