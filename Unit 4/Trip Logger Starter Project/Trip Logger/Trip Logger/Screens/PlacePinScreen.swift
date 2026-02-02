import SwiftUI
import SwiftData
import MapKit
import Combine

struct PlacePinScreen: View {
    @Environment(\.modelContext) var modelContext
    var onComplete: () -> Void
    
    // MVVM Step 1: Use a State object for the ViewModel
    @State private var viewModel: PlacePinViewModel
    
    // Initialize the VM with the trip
    init(onComplete: @escaping () -> Void, trip: Trip) {
        self.onComplete = onComplete
        _viewModel = State(initialValue: PlacePinViewModel(trip: trip))
    }
    
    var body: some View {
        VStack {
            // Trick to force map update
            let mapID = viewModel.trip.journalEntries.map { $0.name }.joined() + "\(viewModel.trip.journalEntries.count)"
            
            MapReader { reader in
                Map {
                    if viewModel.trip.journalEntries.count > 1 {
                        let sorted = viewModel.trip.journalEntries.sorted { $0.date < $1.date }
                        let coords = sorted.compactMap { $0.location.coordinate }
                        MapPolyline(coordinates: coords)
                            .stroke(.blue, lineWidth: 3)
                    }
                    
                    ForEach(viewModel.trip.journalEntries) { journal in
                        if let coordinate = journal.location.coordinate {
                            Marker(journal.name, coordinate: coordinate)
                        }
                    }
                }
                .id(mapID)
                .simultaneousGesture(SpatialTapGesture()
                    .onEnded { event in
                        // MVVM Step 2: Call function on ViewModel
                        viewModel.placePin(reader: reader, location: event.location)
                    }
                )
            }
        }
        .navigationTitle("Add Your Stops")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save Trip") {
                    onComplete()
                }
                .bold()
            }
        }
        // MVVM Step 3: Bind to the ViewModel's state
        .sheet(item: $viewModel.entryToEdit) { entry in
            NavigationStack {
                SetUpPinScreen(journalEntry: entry)
            }
        }
    }
}

// MVVM Step 4: The ViewModel Class
// This satisfies the "Use MVVM" requirement
@Observable
class PlacePinViewModel {
    var trip: Trip
    var entryToEdit: JournalEntry?
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        guard let coordinate = reader.convert(location, from: .local) else { return }
        
        let newLocation = Location(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        // Auto-increment date
        let date = Date().addingTimeInterval(TimeInterval(trip.journalEntries.count * 60))
        
        let newEntry = JournalEntry(name: "New Stop", location: newLocation, date: date)
        
        // Add to model
        trip.journalEntries.append(newEntry)
        newEntry.trip = trip
        
        // Trigger sheet
        entryToEdit = newEntry
    }
}
