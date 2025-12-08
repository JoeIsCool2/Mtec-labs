import SwiftUI

struct PowerListView: View {
    @Environment(DragonDexRouter.self) var router
    let dragon: Dragon
    @Environment(ColorChooser.self) var appColor
    @State var isInfo = false
    
    var body: some View {
            ZStack {
                DragonDexBackgroundView()
                
                ScrollView {
                    VStack {
                        ForEach(dragon.powers, id: \.id) { power in
                            let color = power.type.color
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: power.type.systemImage)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(color)
                                    
                                    Text(power.name)
                                        .foregroundStyle(color)
                                        .bold()
                                        .shadow(radius: 5)
                                    Spacer()
                                }
                                
                                StarRatingView(strength: power.strength, color: power.type.color)
                            }
                            .glassEffect(in: .rect(cornerRadius: 16.0))
                            .padding()
                            .glassEffect(.regular.tint(appColor.capsuleColor).interactive(), in: .rect(cornerRadius: 16.0))
                        }
                        .padding()
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        if !isInfo {
                            Button("info", systemImage: "info") {
                                withAnimation(.easeInOut) {
                                    isInfo.toggle()
                                }
                            }
                        } else {
                            Button("X", systemImage: "arrowshape.left") {
                                withAnimation(.easeInOut) {
                                    isInfo.toggle()
                                }
                            }
                        }
                    }
                }
                
                // Overlay InfoView in the middle of the screen
                if isInfo {
                    ZStack {
                        
                        VStack {
                            InfoView()
                                .frame(maxWidth: 350)
                                .background(.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: 10)
                        }
                        .padding()
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
}

struct StarRatingView: View {
    let strength: Int
    let maxStars: Int = 5
    @Environment(ColorChooser.self) var appColor
    let color: Color
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(0..<maxStars, id: \.self) { index in
                Image(systemName: index < strength ? "star.fill" : "star")
                    .foregroundStyle(color)
                Spacer()
            }
        }
    }
}

#Preview {
    PowerListView(dragon: Dragon(picture: .waterDragon,
                                 species: "Abyss Leviathan",
                                 loreSnippet: "Dwelling in the deepest oceans, Abyss Leviathans command tides and silence with their presence.",
                                 powers: [
                                    Power(type: .elemental, name: "Tidal Wave", strength: 5),
                                    Power(type: .control, name: "Whirlpool Trap", strength: 4),
                                    Power(type: .healing, name: "Aqua Restoration", strength: 3),
                                    Power(type: .speed, name: "Current Surge", strength: 2),
                                    Power(type: .elemental, name: "Deep Freeze", strength: 3),
                                    Power(type: .control, name: "Pressure Crush", strength: 3),
                                    Power(type: .defense, name: "Coral Armor", strength: 2),
                                    Power(type: .elemental, name: "Salt Spray", strength: 4),
                                    Power(type: .camouflage, name: "Mist Veil", strength: 2),
                                    Power(type: .speed, name: "Tide Skim", strength: 3),
                                    Power(type: .healing, name: "Brine Cleanse", strength: 2),
                                    Power(type: .elemental, name: "Maelstrom Fury", strength: 4)
                                 ]
                                )
    )
    .environment(DragonDexRouter())
    .environment(ColorChooser())
}
