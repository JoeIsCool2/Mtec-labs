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
    @State private var countDown = 0
    let id = "pizza"
    @Namespace private var animation
    
    var body: some View {
        VStack {
            Spacer()
                ZStack {
                    switch countDown {
                    case 1:
                        Rectangle()
                            .fill(.red)
                            .frame(width: 45, height: 45)
                            .matchedGeometryEffect(id: id, in: animation, anchor: .center)
                    case 2:
                        Rectangle()
                            .fill(.orange)
                            .frame(width: 90, height: 90)
                            .matchedGeometryEffect(id: id, in: animation, anchor: .zero)
                    case 3:
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: 180, height: 180)
                            .matchedGeometryEffect(id: id, in: animation, anchor: .bottomLeading)
                    case 4:
                        Rectangle()
                            .fill(.green)
                            .frame(width: 300, height: 300)
                            .matchedGeometryEffect(id: id, in: animation, anchor: .topTrailing, isSource: true)
                    default:
                        Rectangle()
                            .fill(.clear)
                    }
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
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            Spacer()
            Button("Start") {
                animate()
            }
        }
        .padding()
    }
}

extension ContentView {
    func animate() {
        isOne = false
        isTwo = false
        isThree = false
        isGo = false
        countDown = 0
        withAnimation(.easeInOut(duration: 1)) {
            isOne = true
            countDown = 1
        } completion: {
            isOne = false
            withAnimation(.easeInOut(duration: 1)) {
                isTwo = true
                countDown = 2
            } completion: {
                isTwo = false
                withAnimation(.easeInOut(duration: 1)) {
                    isThree = true
                    countDown = 3
                } completion: {
                    isThree = false
                    withAnimation(.easeInOut(duration: 1)) {
                        isGo = true
                        countDown = 4
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

