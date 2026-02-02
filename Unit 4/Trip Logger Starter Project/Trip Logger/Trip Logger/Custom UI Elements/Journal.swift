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
            HStack {
                Button("Edit") {
                    isEditingEntry = true
                }
                Spacer()
                Text(journalEntry?.name ?? "")
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
                            .foregroundStyle(.secondary)
                        
                        Text(entry.text)
                        
                        PhotoScrollView(journalEntry: entry)
                    }
                    .padding()
                }
            }
            Spacer()
        }
        .sheet(isPresented: $isEditingEntry) {
            if let entry = journalEntry {
                NavigationStack {
                    SetUpPinScreen(journalEntry: entry)
                }
            }
        }
    }
}
