import Combine
import SwiftUI

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
        if !doesItContainSpecialCharecture() {
            state = .failure("Need a special Charecture")
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
    
    func doesItContainSpecialCharecture() -> Bool {
        let specialCharectures = "!@#$%^&*()_+=-[]{}|;:'/?<>,."
        let currentSpecialCharectures = password.filter { specialCharectures.contains($0) }
        return currentSpecialCharectures.count > 0 ? true : false
    }
}

enum loginState {
  case idle
  case loading
  case success(String)
  case failure(String)
}
