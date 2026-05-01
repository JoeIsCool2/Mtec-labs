import SwiftUI

struct Settings: View {
    
    @Environment(AppSettings.self) var appSettings
    
    var body: some View {
        @Bindable var bindings = appSettings
        ScrollView {
            VStack(spacing: 20) {
                
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                
                Stepper("Amount of users: \(bindings.howManyUsers)",
                        value: $bindings.howManyUsers,
                        in: 1...50)
                
                Divider()
                Toggle("Show Gender", isOn: $bindings.showGender)
                Toggle("Show Location", isOn: $bindings.showLocation)
                Toggle("Show Email", isOn: $bindings.showEmail)
                Toggle("Show Login", isOn: $bindings.showLogin)
                Toggle("Show Registered", isOn: $bindings.showRegistered)
                Toggle("Show DOB", isOn: $bindings.showDOB)
                Toggle("Show Phone", isOn: $bindings.showPhone)
                Toggle("Show Cell", isOn: $bindings.showCell)
                Toggle("Show ID", isOn: $bindings.showID)
                Toggle("Show Nationality", isOn: $bindings.showNat)
            }
            .padding()
        }
    }
}

#Preview {
    Settings()
        .environment(AppSettings())
}
