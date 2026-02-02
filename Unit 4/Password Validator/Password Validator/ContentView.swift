// ContentView.swift
// AdvancedTechniquesLab
//
// Created by Ethan Allgaier on 1/5/26.
//
import SwiftUI

struct ContentView: View {
  @State var state: loginState = .loading
  var body: some View {
    VStack {
    }
    .onAppear {
      loadData()
    }
  }
  @ViewBuilder // Allows multiple return types. Keeps the switch clean
  private func content() -> some View {
    switch state {
    case .idle:
      Text("Idle")
    case .loading:
      Text("Loading...")
    case .failure(let message):
      Text(message)
    case .success(let message):
      Text(message)
    }
  }
  func loadData() {
    state = .success("Data loaded successfully!")
  }
}
