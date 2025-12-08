import SwiftUI
import SwiftData

struct AddEntryView: View {
    @Environment(\.modelContext) var context
    @Binding var isAdding: Bool
    @Binding var currentJournal: Journal?
    
    @State private var name: String = ""
    @State private var info: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.gray, .white],
                               startPoint: .bottomLeading,
                               endPoint: .topTrailing)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Name", text: $name)
                        .font(.title)
                        .padding(5)
                        .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
                    
                    TextField("Info", text: $info)
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
                            let newEntry = Entry(name: name,
                                                 info: info,
                                                 createdAt: Date(),
                                                 journal: currentJournal)
                            context.insert(newEntry)
                            isAdding = false
                        }
                    }
                }
            }
        }
    }
}
