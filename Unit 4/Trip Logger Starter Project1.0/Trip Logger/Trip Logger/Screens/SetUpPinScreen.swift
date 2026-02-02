import SwiftUI
import SwiftData
import PhotosUI

struct SetUpPinScreen: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var journalEntry: JournalEntry
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Name your pin, add photos, and notes.")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("Name Stop")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    TextField("Name of stop", text: $journalEntry.name)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(uiColor: .systemBackground)))
                        .shadow(radius: 2)
                    
                    Divider()
                    
                    // Rubric: Change Date
                    DatePicker("Date", selection: $journalEntry.date)
                        .bold()
                    
                    Divider()
                    
                    Text("Photos")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // Rubric: Add PhotoScrollView
                    PhotoScrollView(journalEntry: journalEntry)
                    
                    Divider()
                    
                    Text("Notes")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    TextField("Write your notes here...", text: $journalEntry.text, axis: .vertical)
                        .padding(10)
                        .frame(minHeight: 100, alignment: .top)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(uiColor: .systemBackground)))
                        .shadow(radius: 2)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Edit Pin")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}
