//
//  ContentView.swift
//  Lifecycle Lab
//
//  Created by joseph wright on 10/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var events: String = ""
    @State var randomColor: UIColor = UIColor.red

    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(randomColor)
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    Text(events)
                        .onChange(of: scenePhase) { oldPhase, newPhase in
                            if newPhase != oldPhase {
                                switch newPhase {
                                case .active: events.append("\n App Active")
                                case .inactive: events.append("\n App Inactive")
                                case .background: events.append("\n App Background")
                                default: break
                                }
                            }
                        }
                        .navigationTitle("MainView")
                    NavigationLink("SecondView") { secondView(events: $events, randomColor: $randomColor) }
                }
            }
        }
    }
}

struct secondView: View {
    @Binding var events: String
    @Binding var randomColor: UIColor
    
    var body: some View {
        ZStack {
            Color(randomColor)
                .ignoresSafeArea()
                .scaledToFill()
            Button("Delete events") {
                events = ""
            }
            .onAppear() {
                randomColor = UIColor(
                    red: CGFloat.random(in: 0...1),
                    green: CGFloat.random(in: 0...1),
                    blue: CGFloat.random(in: 0...1),
                    alpha: 1.0
                )
            }
            .onDisappear() {
                randomColor = UIColor(
                    red: CGFloat.random(in: 0...1),
                    green: CGFloat.random(in: 0...1),
                    blue: CGFloat.random(in: 0...1),
                    alpha: 1.0
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
