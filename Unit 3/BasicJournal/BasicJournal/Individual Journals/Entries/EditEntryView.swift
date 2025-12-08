import SwiftUI
import SwiftData

struct EditEntryView: View {
    @Bindable var entry: Entry
    @Binding var isAdding: Bool
    @Environment(\.modelContext) var context
    @Binding var currentJournal: Journal?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.gray, .white],
                               startPoint: .bottomLeading,
                               endPoint: .topTrailing)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Name", text: $entry.name)
                        .font(.title)
                        .padding(5)
                        .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
                    
                    TextField("Info", text: $entry.info)
                        .font(.body)
                        .padding(5)
                        .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
                    
                    Text("Created: \(Date().formatted(date: .abbreviated, time: .shortened))")
                        .foregroundStyle(.secondary)
                }
                .tint(.black)
                .padding()
                .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
                .padding()
                .navigationTitle("Entry Details")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            isAdding = false
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            context.insert(entry)
                            isAdding = false
                        }
                    }
                }
            }
        }
    }
}

