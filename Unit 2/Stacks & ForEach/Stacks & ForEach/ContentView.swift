import SwiftUI

struct ContentView: View {
    let name: String = ""
    var id: String { name }
    let ThingsILike = ["pizza", "popcorn", "steak", "sports"]
    
    var body: some View {
        ZStack {
            Image("Backround")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ZStack {
                Circle()
                    .frame(width: 500)
                    .foregroundStyle(Color.red)
                    .grayscale(0.7)
                Circle()
                    .frame(width: 250)
                    .foregroundStyle(Color.black)
                Circle()
                    .frame(width: 50)
                    .foregroundStyle(Color.white)
            }
            VStack {
                Text("Joseph Wright")
                    .foregroundStyle(Color.white)
                    .font(.custom("Avenir", size: 50))
                    .padding()
                Text("Things I like:")
                    .foregroundStyle(Color.white)
                    .font(.custom("Apple Symbols", size: 30))
                    .padding()
                HStack {
                    ForEach(ThingsILike, id: \.self) { item in
                        Text(item)
                            .foregroundStyle(Color.gray)
                            .font(.custom("Apple Symbols", size: 25))
                            .padding(.horizontal, 8)
                        
                    }
                }
                ZStack {
                    VStack {
                        Rectangle()
                            .frame(width: .infinity, height: 50)
                        Rectangle()
                            .frame(width: .infinity, height: 25)
                        Rectangle()
                            .frame(width: .infinity, height: 12.5)
                        Rectangle()
                            .frame(width: .infinity, height: 6.25)
                    }
                    HStack{
                        Rectangle()
                            .frame(width: 6.25, height: 120)
                        Rectangle()
                            .frame(width: 12.5, height: 120)
                        Rectangle()
                            .frame(width: 25, height: 120)
                        Rectangle()
                            .frame(width: 50, height: 120)
                        Rectangle()
                            .frame(width: 25, height: 120)
                        Rectangle()
                            .frame(width: 12.5, height: 120)
                        Rectangle()
                            .frame(width: 6.25, height: 120)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
