//
//  NewTripScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData

struct NewTripScreen: View {
    // This environment value controls the presentation of the entire Sheet
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var tripName = ""
    @State var createdTrip: Trip?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("First, give a name to your trip.")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Name of Trip", text: $tripName)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                    )
                    .shadow(radius: 7)
                    .padding()
            }
            .padding()
            .toolbar {
                Button("Next") {
                    createTrip()
                }
                .disabled(tripName.isEmpty)
                .tint(tripName.isEmpty ? .gray : .black)
            }
            .navigationDestination(item: $createdTrip) { trip in
                PlacePinScreen(onComplete: { dismiss() }, trip: trip)
            }
        }
    }
    
    func createTrip() {
        let newTrip = Trip(name: tripName)
        modelContext.insert(newTrip)
        createdTrip = newTrip
    }
}
