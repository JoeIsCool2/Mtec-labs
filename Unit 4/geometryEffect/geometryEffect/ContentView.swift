//
//  ContentView.swift
//  geometryEffect
//
//  Created by joseph wright on 1/13/26.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let symbol: Image
    let color: Color
}

struct ContentView: View {
    let size: CGFloat = 150
    let cards: [Card] = [
        Card(symbol: Image(systemName: "star.fill"), color: .yellow),
        Card(symbol: Image(systemName: "heart.fill"), color: .red),
        Card(symbol: Image(systemName: "bolt.fill"), color: .orange),
        Card(symbol: Image(systemName: "leaf.fill"), color: .green),
        Card(symbol: Image(systemName: "moon.fill"), color: .indigo),
        Card(symbol: Image(systemName: "sun.max.fill"), color: .yellow),
        Card(symbol: Image(systemName: "cloud.fill"), color: .gray),
        Card(symbol: Image(systemName: "flame.fill"), color: .red),
        Card(symbol: Image(systemName: "snowflake"), color: .blue),
        Card(symbol: Image(systemName: "pawprint.fill"), color: .brown),
        Card(symbol: Image(systemName: "gift.fill"), color: .pink),
        Card(symbol: Image(systemName: "gamecontroller.fill"), color: .purple),
        Card(symbol: Image(systemName: "car.fill"), color: .blue),
        Card(symbol: Image(systemName: "bicycle"), color: .green),
        Card(symbol: Image(systemName: "airplane"), color: .teal)
    ]
    @State var columns: [GridItem] = []
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(cards) { card in
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(card.color)
                                .frame(width: size, height: size)
                            card.symbol
                                .scaleEffect(4)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .onChange(of: UIDevice.current.orientation) {
                    withAnimation(.smooth) {
                        columns = []
                        let currentColumns = Int(geometry.size.width / (size + 20))
                        print("Changing to \(currentColumns) columns")
                        while columns.count < currentColumns {
                            columns.append(GridItem(.fixed(size), spacing: 20))
                        }
                    }
                }
                .onAppear() {
                        let currentColumns = Int(geometry.size.width / (size + 20))
                        
                        while columns.count < currentColumns {
                            columns.append(GridItem(.fixed(size), spacing: 20))
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
