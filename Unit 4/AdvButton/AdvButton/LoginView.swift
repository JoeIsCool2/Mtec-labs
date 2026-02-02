import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var loginState: LoginState = .idle
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField("Username", text: $username)
                .standardInput()
                .autocapitalization(.none)
            
            HStack {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
                
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
            }
            .standardInput()
            
            if case .loading = loginState {
                ProgressView()
                    .padding()
            } else {
                Button("Log In") {
                    handleLogin()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            
            if case .error = loginState {
                Text("Invalid username or password.")
                    .foregroundColor(.red)
                    .font(.subheadline)
            } else if case .success = loginState {
                Text("Login Successful!")
                    .foregroundColor(.green)
                    .font(.headline)
            }
            
            Button("Forgot Password?") {
                print("Forgot password tapped")
            }
            .buttonStyle(SecondaryButtonStyle())
            
            Spacer()
        }
        .padding()
    }
    
    func handleLogin() {
        if username.isEmpty || password.isEmpty {
            loginState = .error
            return
        }
        
        loginState = .loading
        
        loginState = .success
    }
}
