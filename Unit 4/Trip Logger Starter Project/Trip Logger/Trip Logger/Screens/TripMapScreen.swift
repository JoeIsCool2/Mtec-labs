import SwiftUI
import SwiftData
import MapKit
import Combine

struct TripMapScreen: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var trip: Trip
    
    @State private var viewModel: TripMapViewModel
    
    init(trip: Trip) {
        self.trip = trip
        _viewModel = State(initialValue: TripMapViewModel(trip: trip))
    }
    
    var body: some View {
        let mapID = viewModel.trip.journalEntries.map { $0.name }.joined() + "\(viewModel.trip.journalEntries.count)"
        
        MapReader { reader in
            Map(selection: $viewModel.selectedEntry) {
                if viewModel.trip.journalEntries.count > 1 {
                    let sorted = viewModel.trip.journalEntries.sorted { $0.date < $1.date }
                    let coords = sorted.compactMap { $0.location.coordinate }
                    MapPolyline(coordinates: coords)
                        .stroke(.blue, lineWidth: 3)
                }
                
                ForEach(viewModel.trip.journalEntries) { entry in
                    if let coord = entry.location.coordinate {
                        Marker(entry.name, coordinate: coord)
                            .tag(entry)
                    }
                }
            }
            .id(mapID)
            .onTapGesture { position in
                viewModel.handleTap(point: position, reader: reader)
            }
        }
        .navigationTitle(trip.name)
        .toolbar {
            Button(viewModel.isEditingTrip ? "Done" : "Edit") {
                viewModel.isEditingTrip.toggle()
            }
        }
        .sheet(item: $viewModel.selectedEntry) { entry in
            Journal(journalEntry: $viewModel.selectedEntry)
        }
        .sheet(item: $viewModel.newEntryToEdit) { entry in
            NavigationStack {
                SetUpPinScreen(journalEntry: entry)
            }
        }
    }
}

@Observable
class TripMapViewModel {
    var trip: Trip
    var selectedEntry: JournalEntry?
    var isEditingTrip = false
    var newEntryToEdit: JournalEntry?
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    func handleTap(point: CGPoint, reader: MapProxy) {
        guard isEditingTrip, let coordinate = reader.convert(point, from: .local) else { return }
        
        let loc = Location(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        // Auto increment date
        let date = Date().addingTimeInterval(TimeInterval(trip.journalEntries.count * 60))
        
        let newEntry = JournalEntry(name: "New Stop", location: loc, date: date)
        newEntry.trip = trip
        trip.journalEntries.append(newEntry)
        
        newEntryToEdit = newEntry
    }
}
