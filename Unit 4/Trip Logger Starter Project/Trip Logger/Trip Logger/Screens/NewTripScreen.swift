import SwiftUI
import SwiftData
import Combine

struct NewTripScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var viewModel = NewTripViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("First, give a name to your trip.")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Name of Trip", text: $viewModel.tripName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Spacer()
                
                Button("Next") {
                    viewModel.createTrip(context: modelContext)
                }
                .disabled(viewModel.tripName.isEmpty)
                .navigationDestination(item: $viewModel.createdTrip) { trip in
                    PlacePinScreen(onComplete: { dismiss() }, trip: trip)
                }
            }
            .padding()
            .navigationTitle("New Trip")
        }
    }
}

@Observable
class NewTripViewModel {
    var tripName = ""
    var createdTrip: Trip?
    
    func createTrip(context: ModelContext) {
        let newTrip = Trip(name: tripName)
        context.insert(newTrip)
        createdTrip = newTrip
    }
}
