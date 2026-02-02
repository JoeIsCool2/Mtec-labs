// MainView.swift
// AdvancedTechniquesLab
//
// Created by Ethan Allgaier on 1/5/26.
//
import SwiftUI

struct MainView: View {
  @State private var vm = ViewModel()
  var body: some View {
    VStack {
        TextField("Enter Username", text: $vm.username)
        .modifier(CustomView())
        SecureField("Enter Password", text: $vm.password)
        .modifier(CustomView())
      content()
        .padding()
      Button("Login") {
          vm.handleLogin()
      }
      .buttonStyle(CustomButton())
    }
    .padding()
  }
  @ViewBuilder // Allows multiple return types. Keeps the switch clean
  private func content() -> some View {
      switch vm.state {
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

@Observable
class ViewModel {
    var username: String = ""
    var password: String = ""
    var state: loginState = .idle
    
    func handleLogin () {
      if username.isEmpty {
        state = .failure("Please enter a username.")
        return
      }
      if password.isEmpty {
        state = .failure("Please enter a password.")
        return
      }
      if !isLongEnough() {
          state = .failure("Password not long enough")
          return
      }
      state = .loading
      // Simulate a network delay
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        // Show success after 2 seconds
          self.state = .success("Login successful! Welcome, \(self.username)")
      }
    }
    
    func isLongEnough() -> Bool {
        password.count >= 8
    }
}

#Preview {
  MainView()
}
