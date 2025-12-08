import SwiftUI
import SwiftData

struct AddJournalView: View {
    @Query(sort:  \Journal.createdAt, order: .reverse) var journals: [Journal]
    @Bindable var journal: Journal
    @Environment(\.modelContext) var context
    @Binding var isAdding: Bool
    @Binding var currentJournal: Journal?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.gray, .white], startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Name", text: $journal.name)
                        .font(.title)
                        .padding(5)
                        .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
                    Text("Entries: \(journal.entries.count)")
                        .font(.body)
                        .padding(5)
                    Text(journal.createdAt.formatted(date: .abbreviated, time: .shortened))
                        .foregroundStyle(.secondary)
                }
                .tint(.black)
                .padding()
                .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
                .padding()
                .navigationTitle("Entry Details")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            context.insert(journal)
                            if let currentJournalIndex = journals.firstIndex(of: journal) {
                                currentJournal = journals[currentJournalIndex]
                            }
                            isAdding = false
                        }
                    }
                }
            }
        }
    }
}
