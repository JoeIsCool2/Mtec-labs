import SwiftUI

struct DragonDetailView: View {
    @Environment(DragonDexRouter.self) var router
    let dragon: Dragon
    @Environment(ColorChooser.self) var appColor
    
    var body: some View {
        ZStack {
            DragonDexBackgroundView()
            VStack {
                Text(dragon.species)
                    .font(.custom("Didot", size: 60))
                    .bold()
                    .foregroundStyle(.black)
                    .opacity(0.7)
                
                ScrollView {
                    Image(dragon.picture)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(4)
                        .glassEffect(.regular.tint(.black).interactive(), in: .rect(cornerRadius: 20.0))
                        .padding()
                    
                    Text(dragon.loreSnippet)
                        .font(.custom("Didot", size: 20))
                        .bold()
                        .foregroundStyle(appColor.textColor)
                        .opacity(0.7)
                        .padding()
                        .glassEffect(.regular.tint(appColor.capsuleColor).interactive(), in: .rect(cornerRadius: 16.0))
                    ZStack {
                        HStack {
                            ForEach(dragon.powers, id: \.id) { power in
                                let color = power.type.color
                                Image(systemName: power.type.systemImage)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(color)
                            }
                        }
                        Button("Powers") {
                            router.navigateTo(route: .PowerList(dragon: dragon))
                        }
                        .font(.custom("Didot", size: 25))
                        .bold()
                        .foregroundStyle(appColor.textColor)
                        .opacity(0.7)
                        .padding()
                    }
                    .padding()
                    .glassEffect(.regular.tint(appColor.capsuleColor).interactive(), in: .rect(cornerRadius: 16.0))
                    .onTapGesture {
                        router.navigateTo(route: .PowerList(dragon: dragon))
                    }
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    DragonDetailView(
        dragon: Dragon(picture: .waterDragon,
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
                       ])
    )
    .environment(DragonDexRouter())
    .environment(ColorChooser())
}
