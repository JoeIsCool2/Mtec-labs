import SwiftUI
import SwiftData
import PhotosUI

struct SetUpPinScreen: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var journalEntry: JournalEntry
    var onSave: (() -> Void)? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Name Stop")
                    .font(.title2)
                    .fontWeight(.bold)
                
                TextField("Name of stop", text: $journalEntry.name)
                    .textFieldStyle(.roundedBorder)
                
                Divider()
                
                DatePicker("Date", selection: $journalEntry.date)
                
                Divider()
                
                Text("Photos")
                    .font(.title2)
                    .fontWeight(.bold)
                
                PhotoScrollView(journalEntry: journalEntry)
                
                Divider()
                
                Text("Notes")
                    .font(.title2)
                    .fontWeight(.bold)
                
                TextField("Write your notes here...", text: $journalEntry.text, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .frame(minHeight: 100)
                
                Button("Save") {
                    if let onSave = onSave {
                        onSave()
                    } else {
                        dismiss()
                    }
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Edit Pin")
    }
}
