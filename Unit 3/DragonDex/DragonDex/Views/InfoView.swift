import SwiftUI

struct InfoView: View {
    // Local mapping of symbol → description
    private let info: [(image: String, color: Color, text: String)] = [
        ("shield.fill", .blue, "Defense powers create protective barriers and shields."),
        ("flame.fill", .red, "Elemental powers harness fire, water, earth, or lightning."),
        ("wind", .cyan, "Speed powers enhance agility and quick movement."),
        ("cross.fill", .green, "Healing powers restore health and mend wounds."),
        ("hand.raised.fill", .purple, "Control powers manipulate forces, gravity, or minds."),
        ("leaf.fill", .brown, "Camouflage powers blend into surroundings to avoid detection."),
        ("sparkles", .pink, "Illusion powers deceive with light, sound, or false images.")
    ]
    
    var body: some View {
        ZStack {
            // Remove any solid background — just clear
            Color.clear.ignoresSafeArea()
            
            VStack {
                ForEach(info, id: \.image) { item in
                    HStack(spacing: 16) {
                        Image(systemName: item.image)
                            .foregroundStyle(item.color)
                            .frame(width: 30, height: 30)
                        
                        Rectangle()
                            .frame(width: 1, height: 30)
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        Text(item.text)
                            .font(.body)
                            .foregroundStyle(item.color)
                    }
                }
            }
            .padding()
            .glassEffect(in: .rect(cornerRadius: 12))
            .padding()
        }
        // Ensure background is transparent
        .background(.clear)
    }
}

#Preview {
    ZStack {
        // Example parent background to show transparency
        LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        
        InfoView()
    }
}
