import SwiftUI

struct PizzaSize: View {
    @State private var isSmallSelected = false
    @State private var isMediamSelected = false
    @State private var isLargeSelected = false

    var body: some View {
        ZStack {
            Image(.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Button("Small") {
                    isSmallSelected.toggle()
                }
                .toggleStyle(isSmallSelected)
                Button("Mediam") {
                    isMediamSelected.toggle()
                }
                .toggleStyle(isMediamSelected)
                Button("Large") {
                    isLargeSelected.toggle()
                }
                .toggleStyle(isLargeSelected)
                if isSmallSelected {
                    Circle()
                        .frame(width: 50)
                }
                if isMediamSelected {
                    Circle()
                        .frame(width: 100)
                }
                if isLargeSelected {
                    Circle()
                        .frame(width: 200)
                }
            }
            .padding()
            .navigationTitle("Choose Size")
            }
            
        }
    }

