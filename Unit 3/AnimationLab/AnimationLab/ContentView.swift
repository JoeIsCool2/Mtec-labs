//
//  ContentView.swift
//  AnimationLab
//
//  Created by joseph wright on 12/8/25.
//

import SwiftUI
struct ContentView: View {
    @State private var isOne = false
    @State private var isTwo = false
    @State private var isThree = false
    @State private var isGo = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Text("1")
                    .font(.custom("Impact", size: 40))
                    .scaleEffect(isOne ? 0.0 : 20.0)
                    .opacity(isOne ? 1.0 : 0.0)
                
                Text("2")
                    .font(.custom("Impact", size: 40))
                    .scaleEffect(isTwo ? 0.0 : 20.0)
                    .opacity(isTwo ? 1.0 : 0.0)
                
                Text("3")
                    .font(.custom("Impact", size: 40))
                    .scaleEffect(isThree ? 0.0 : 20.0)
                    .opacity(isThree ? 1.0 : 0.0)
                
                Text("GO")
                    .font(.custom("Impact", size: 100))
                    .scaleEffect(isGo ? 1 : 500.0)
                    .opacity(isGo ? 1.0 : 0.0)
            }
            Spacer()
            Button("Start") {
                isOne = false
                isTwo = false
                isThree = false
                isGo = false
                withAnimation(.easeInOut(duration: 1)) {
                    isOne = true
                } completion: {
                    isOne = false
                    withAnimation(.easeInOut(duration: 1)) {
                        isTwo = true
                    } completion: {
                        isTwo = false
                        withAnimation(.easeInOut(duration: 1)) {
                            isThree = true
                        } completion: {
                            isThree = false
                            withAnimation(.easeInOut(duration: 1)) {
                                isGo = true
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
