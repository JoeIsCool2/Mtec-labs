//
//  TripMapScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import MapKit

struct TripMapScreen: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var trip: Trip
    
    @State var position: MapCameraPosition = .automatic
    @State var selectedEntry: JournalEntry?
    @State var isEditingTrip = false
    @State var newEntryToEdit: JournalEntry? // For adding new pins
    
    var body: some View {
        VStack {
            MapReader { reader in
                Map(position: $position, selection: $selectedEntry) {
                    
                    // BLACK DIAMOND: Draw Path
                    if trip.journalEntries.count > 1 {
                        // Sort entries by date to draw correct path order
                        let sortedCoordinates = trip.journalEntries
                            .sorted { $0.date < $1.date }
                            .compactMap { $0.location.coordinate }
                        
                        MapPolyline(coordinates: sortedCoordinates)
                            .stroke(.blue, lineWidth: 3)
                    }
                    
                    ForEach(trip.journalEntries) { journalEntry in
                        if let coordinate = journalEntry.location.coordinate {
                            Marker(journalEntry.name, coordinate: coordinate)
                                .tag(journalEntry)
                        }
                    }
                }
                // Allow adding new pins to existing trips
                .onTapGesture(perform: { screenCoord in
                    if let location = reader.convert(screenCoord, from: .local) {
                         addPin(at: location)
                    }
                })
            }
            
            if let entry = selectedEntry {
                // Pass binding to Journal view
                Journal(journalEntry: Binding(
                    get: { entry },
                    set: { selectedEntry = $0 }
                ))
                .frame(maxHeight: 350)
                .background(.ultraThinMaterial)
            }
        }
        .navigationTitle(trip.name)
        .toolbar {
            Button("Edit Trip") {
                isEditingTrip = true
            }
        }
        .sheet(isPresented: $isEditingTrip) {
            EditTripSheet(trip: trip)
        }
        .sheet(item: $newEntryToEdit) { entry in
            SetUpPinScreen(journalEntry: entry)
        }
    }
    
    func addPin(at coordinate: CLLocationCoordinate2D) {
        let newLocation = Location(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let newEntry = JournalEntry(name: "New Stop", location: newLocation, date: Date())
        
        modelContext.insert(newLocation)
        modelContext.insert(newEntry)
        
        newEntry.trip = trip
        trip.journalEntries.append(newEntry)
        
        newEntryToEdit = newEntry
    }
}

// Helper sheet to edit Trip Name or Delete
struct EditTripSheet: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Bindable var trip: Trip
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Trip Name", text: $trip.name)
                
                Section {
                    Button("Delete Trip", role: .destructive) {
                        modelContext.delete(trip)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Edit Trip")
            .toolbar {
                Button("Done") { dismiss() }
            }
        }
    }
}
