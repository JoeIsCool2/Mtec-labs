//
//  Journal.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData

struct Journal: View {
    @Binding var journalEntry: JournalEntry?
    @State private var isEditingEntry = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Top Bar
            HStack {
                Button("Edit") {
                    isEditingEntry = true
                }
                Spacer()
                Text(journalEntry?.name ?? "Journal")
                    .font(.title2)
                    .bold()
                Spacer()
                Button {
                    journalEntry = nil
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.gray)
                }
            }
            .padding()
            
            if let entry = journalEntry {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text(entry.text)
                            .font(.body)
                        
                        // Pass non-optional entry
                        PhotoScrollView(journalEntry: entry)
                    }
                    .padding(.horizontal)
                }
            } else {
                Spacer()
            }
        }
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(radius: 5)
        .sheet(isPresented: $isEditingEntry) {
            if let entry = journalEntry {
                SetUpPinScreen(journalEntry: entry)
            }
        }
    }
}
