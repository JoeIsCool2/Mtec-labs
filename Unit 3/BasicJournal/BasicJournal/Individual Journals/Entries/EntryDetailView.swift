import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    @Environment(\.modelContext) var context
    @Binding var currentJournal: Journal?
    
    @State var isAdding = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, .white], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Text(entry.name)
                        .font(.title)
                    Spacer()
                }
                Text(entry.info)
                    .font(.body)
                Text(entry.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .foregroundStyle(.secondary)
            }
            .padding()
            .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
            .padding()
            .navigationTitle("Entry Details")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        isAdding.toggle()
                    }
                }
            }
            .sheet(isPresented: $isAdding) {
                EditEntryView(entry: entry, isAdding: $isAdding, currentJournal: $currentJournal)
            }
        }
    }
}
