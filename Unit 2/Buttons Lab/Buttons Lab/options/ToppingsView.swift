import SwiftUI

struct PizzaToppings: View {
    @State private var isPeperoni = false
    @State private var isMushrooms = false
    @State private var isOlives = false
    @State private var isOnions = false
    @State private var isSausage = false
    @State private var isBacon = false
    @State private var isPineapple = false
    @State private var isGreenPeppers = false
    @State private var isSpinach = false
    @State private var isTomatoes = false

    var body: some View {
        ZStack {
            Image(.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(spacing: 12) {
                    Button("Peperoni") { isPeperoni.toggle() }
                        .toggleStyle(isPeperoni)
                    
                    Button("Mushrooms") { isMushrooms.toggle() }
                        .toggleStyle(isMushrooms)
                    
                    Button("Olives") { isOlives.toggle() }
                        .toggleStyle(isOlives)
                    
                    Button("Onions") { isOnions.toggle() }
                        .toggleStyle(isOnions)
                    
                    Button("Sausage") { isSausage.toggle() }
                        .toggleStyle(isSausage)
                    
                    Button("Bacon") { isBacon.toggle() }
                        .toggleStyle(isBacon)
                    
                    Button("Pineapple") { isPineapple.toggle() }
                        .toggleStyle(isPineapple)
                    
                    Button("Green Peppers") { isGreenPeppers.toggle() }
                        .toggleStyle(isGreenPeppers)
                    
                    Button("Spinach") { isSpinach.toggle() }
                        .toggleStyle(isSpinach)
                    
                    Button("Tomatoes") { isTomatoes.toggle() }
                        .toggleStyle(isTomatoes)
                }
                .padding()
            }
            .padding()
            .navigationTitle("Select Toppings")
        }
    }
}



