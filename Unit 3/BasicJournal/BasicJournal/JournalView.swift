import SwiftUI
import SwiftData

private struct EntryRowView: View {
    let entry: Entry
    let dateFormatterDay: DateFormatter
    let dateFormatterTime: DateFormatter

    var body: some View {
        VStack {
            HStack {
                Text(dateFormatterDay.string(from: entry.createdAt).prefix(5))
                    .font(.custom("American Typewriter", size: 18))
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 16.0))
                    .rotationEffect(.degrees(-90))

                HStack {
                    Text(entry.name)
                        .font(.custom("American Typewriter", size: 25))
                    Spacer()
                    Text(dateFormatterTime.string(from: entry.createdAt))
                        .padding(-10)
                }
                .padding()
                .glassEffect(.regular.tint(.gray), in: .rect(cornerRadius: 16.0))
            }
        }
        .padding()
        .padding(.leading, -20)
    }
}


// MARK: - Views
struct JournalView: View {
    @Query(sort: \Entry.createdAt, order: .reverse) var entries: [Entry]
    @Query(sort: \Journal.createdAt, order: .reverse) var journals: [Journal]
    @Environment(\.modelContext) var context
   
    @State private var isAddingEntry: Bool = false
    @State private var isAddingJournal: Bool = false
    @State private var currentJournal: Journal? = nil
    @State private var showDeleteJournalConfirm: Bool = false
    @State private var journalPendingDeletion: Journal? = nil
    
    private var dateFormatterTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    private var dateFormatterDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var filteredEntries: [Entry] {
        if let journal = currentJournal {
            return entries.filter { $0.journal == journal }
        } else {
            return entries
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Journals", selection: $currentJournal) {
                    Text("All Journals").tag(nil as Journal?)
                    ForEach(journals) { journal in
                        Text(journal.name)
                            .tag(Optional(journal))
                            .onLongPressGesture {
                                journalPendingDeletion = journal
                                showDeleteJournalConfirm = true
                            }
                    }
                }
                .pickerStyle(.palette)
                if let currentJournal {
                    if currentJournal.name != "All Journals" {
                        Button("Delete This Journal") {
                            journalPendingDeletion = currentJournal
                            showDeleteJournalConfirm = true
                        }
                        .foregroundStyle(.red)
                    }
                }
                List {
                    ForEach(filteredEntries) { entry in
                        NavigationLink(destination: EntryDetailView(entry: entry, currentJournal: $currentJournal)) {
                            EntryRowView(
                                entry: entry,
                                dateFormatterDay: dateFormatterDay,
                                dateFormatterTime: dateFormatterTime
                            )
                        }
                        .listRowBackground(Color.gray.opacity(0.7))
                    }
                    .onDelete(perform: deleteEntries)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Entry") {
                            isAddingEntry.toggle()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Journal") {
                            isAddingJournal.toggle()
                        }
                    }
                    
                }
            }
            .navigationTitle("Journal")
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(
                LinearGradient(colors: [.gray, .white],
                               startPoint: .bottomLeading,
                               endPoint: .topTrailing)
            )
            .sheet(isPresented: $isAddingEntry) {
                    AddEntryView(isAdding: $isAddingEntry, currentJournal: $currentJournal)
            }
            .sheet(isPresented: $isAddingJournal) {
                AddJournalView(journal: Journal(name: "", entries: [], createdAt: Date.now), isAdding: $isAddingJournal, currentJournal: $currentJournal)
            }
            .confirmationDialog(
                "Delete Journal?",
                isPresented: $showDeleteJournalConfirm,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    if let journal = journalPendingDeletion {
                        deleteJournal(journal)
                    }
                    journalPendingDeletion = nil
                }
                Button("Cancel", role: .cancel) {
                    journalPendingDeletion = nil
                }
            } message: {
                if let journal = journalPendingDeletion {
                    Text("This will delete \(journal.name) and all of its entries. This action cannot be undone.")
                } else {
                    Text("This will delete the selected journal and all of its entries. This action cannot be undone.")
                }
            }
        }
    }
    
    private func deleteEntries(at offsets: IndexSet) {
        for index in offsets {
            let entry = entries[index]
            context.delete(entry)
        }
    }
    
    private func deleteJournal(_ journal: Journal) {
        // Delete all entries associated with this journal
        for entry in entries where entry.journal == journal {
            context.delete(entry)
        }
        // Delete the journal itself
        context.delete(journal)

        // If the current filter is this journal, reset to All Journals
        if currentJournal == journal {
            currentJournal = nil
        }
    }
}

// MARK: - Preview
#Preview {
    JournalView()
        .modelContainer(for: [Entry.self, Journal.self])
}
