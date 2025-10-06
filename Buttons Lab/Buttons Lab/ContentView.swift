import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.image)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    NavigationLink("Pizza Size") {
                        PizzaSize()
                    }
                    .buttonStyle(GradientButtonStyle())
                    
                    NavigationLink("Pizza Toppings") {
                        PizzaToppings()
                    }
                    .buttonStyle(GradientButtonStyle())
                    
                    NavigationLink("Delivered or Pickup") {
                        DeviveredOrPickup()
                    }
                    .buttonStyle(GradientButtonStyle())
                }
                .padding()
                .navigationTitle("Pizza Builder")
            }
        }
    }
}

#Preview {
    ContentView()
}
