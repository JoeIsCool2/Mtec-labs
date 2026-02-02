// MainView.swift
// AdvancedTechniquesLab
//
// Created by Ethan Allgaier on 1/5/26.
//
import SwiftUI

struct MainView: View {
  @State private var username: String = ""
  @State private var password: String = ""
  @State private var state: loginState = .idle
  var body: some View {
    VStack {
      TextField("Enter Username", text: $username)
        .modifier(CustomView())
      TextField("Enter Password", text: $password)
        .modifier(CustomView())
      content()
        .padding()
      Button("Login") {
        handleLogin()
      }
      .buttonStyle(CustomButton())
    }
    .padding()
  }
  func handleLogin () {
    if username.isEmpty {
      state = .failure("Please enter a username.")
      return
    }
    if password.isEmpty {
      state = .failure("Please enter a password.")
      return
    }
    state = .loading
    // Simulate a network delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      // Show success after 2 seconds
      state = .success("Login successful! Welcome, \(username)")
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
}

#Preview {
  MainView()
}
