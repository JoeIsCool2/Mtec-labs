import SwiftUI
import SwiftData
import Combine

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var trips: [Trip]
    
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if trips.isEmpty {
                    Text("No trips yet.")
                } else {
                    List {
                        ForEach(trips) { trip in
                            NavigationLink(destination: TripMapScreen(trip: trip)) {
                                Text(trip.name)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                modelContext.delete(trips[index])
                            }
                        }
                    }
                }
            }
            .navigationTitle("Trip Logger")
            .toolbar {
                Button("Add") {
                    viewModel.isShowingNewTrip = true
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewTrip) {
                NavigationStack {
                    NewTripScreen()
                }
            }
        }
    }
}

@Observable
class ContentViewModel {
    var isShowingNewTrip = false
}

#Preview {
    ContentView()
}
