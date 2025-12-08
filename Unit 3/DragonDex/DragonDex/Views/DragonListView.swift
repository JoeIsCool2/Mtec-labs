import SwiftUI

struct DragonListView: View {
    @Environment(DragonDexRouter.self) var router
    let dragonData = DragonData()
    @Environment(ColorChooser.self) var appColor
    
    var body: some View {
        NavigationStack {
            ZStack {
                DragonDexBackgroundView()
                ScrollView {
                    ForEach(dragonData.dragonData) { dragon in
                        HStack {
                            ZStack {
                                Image(dragon.picture)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .tint(appColor.backgroundColor)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            .padding(5)
                            .glassEffect(.regular.tint(.black).interactive(), in: .rect(cornerRadius: 20.0))
                            Spacer()
                            Text(dragon.species)
                                .font(.custom("Didot", size: 30))
                                .bold()
                                .foregroundStyle(appColor.textColor)
                                .opacity(0.7)
                            Spacer()
                        }
                        .padding()
                        .glassEffect(.regular.tint(appColor.capsuleColor).interactive(), in: .rect(cornerRadius: 16.0))
                        .padding()
                        .onTapGesture {
                            router.navigateTo(route: .DragonDetail(dragon: dragon))
                        }
                    }
                    .navigationTitle("Dragon List")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Settings", systemImage: "gear") {
                                router.navigateTo(route: .Settings)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DragonListView()
        .environment(DragonDexRouter())
        .environment(ColorChooser())
}
