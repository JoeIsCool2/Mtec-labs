//
//  ContentView.swift
//  Code challenge
//
//  Created by joseph wright on 2/23/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var allUsers: [User]
    @State var randomUser: [Int] = []
    
    var body: some View {
        ZStack {
            Theme.Everdreen
                .ignoresSafeArea()
            VStack {
                AddUserView(randomUsers: $randomUser)
                Spacer()
                
                List {
                    ForEach(Array(allUsers.enumerated()), id: \.element.id) { index, user in
                        VStack(alignment: .leading) {
                            Text(user.name)

                            if randomUser.contains(index) {
                                Text("Selected")
                                    .font(.caption)
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                    .onDelete(perform: deleteUser)
                }
                .tint(Theme.BlackForest)
                .scrollContentBackground(.hidden)
                .background(Theme.Everdreen)
                
            }
        }
    }
    private func deleteUser(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(allUsers[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
