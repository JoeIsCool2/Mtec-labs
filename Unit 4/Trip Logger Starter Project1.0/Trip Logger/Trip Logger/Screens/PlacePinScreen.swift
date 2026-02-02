//
//  PlacePinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import MapKit

struct PlacePinScreen: View {
    @Environment(\.modelContext) var modelContext
    
    // We don't use @Environment(\.dismiss) here because that only pops the view.
    // Instead, we call the closure passed from the parent to dismiss the whole sheet.
    var onComplete: () -> Void
    
    @Bindable var trip: Trip
    @State var entryToEdit: JournalEntry?
    
    var body: some View {
        VStack {
            MapReader { reader in
                Map {
                    ForEach(trip.journalEntries) { journal in
                        Marker(journal.name, coordinate: journal.location.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0))
                            .tag(journal)
                    }
                }
                .simultaneousGesture(SpatialTapGesture()
                    .onEnded { event in
                        let location = event.location
                        placePin(reader: reader, location: location)
                    }
                )
            }
        }
        .navigationTitle("Place First Pin")
        .toolbar {
            Button("Done") {
                // Call the closure to dismiss the entire "New Trip" sheet
                onComplete()
            }
        }
        .sheet(item: $entryToEdit) { entry in
            SetUpPinScreen(journalEntry: entry)
        }
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        guard let coordinate = reader.convert(location, from: .local) else { return }
        
        let newLocation = Location(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let newEntry = JournalEntry(name: "New Stop", location: newLocation, date: Date())
        
        modelContext.insert(newLocation)
        modelContext.insert(newEntry)
        
        newEntry.trip = trip
        trip.journalEntries.append(newEntry)
        
        entryToEdit = newEntry
    }
}
