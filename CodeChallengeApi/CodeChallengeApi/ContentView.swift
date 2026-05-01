import SwiftUI

struct ContentView: View {
    
    @State private var apiService = APIService()
    @Environment(AppSettings.self) var appSettings
    
    var body: some View {
        NavigationStack {
            VStack {
                if apiService.users.isEmpty {
                    Text("Loading...")
                        .font(.title)
                        .padding()
                } else {
                    List(apiService.users) { user in
                        ScrollView(.horizontal) {
                            VStack {
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        HStack {
                                            Spacer()
                                            AsyncImage(url: URL(string: user.picture.medium))
                                                .clipShape(
                                                    RoundedRectangle(cornerRadius: 20)
                                                )
                                            Text("\(user.name.first) \(user.name.last)")
                                                .font(.custom("Impact", size: 50))
                                            Spacer()
                                        }
                                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                                            if appSettings.showGender {
                                                Text("Gender: \n \(user.gender)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showLocation {
                                                Text("City: \n \(user.location.city)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showEmail {
                                                ScrollView {
                                                    Text("Email: \n \(user.email)")
                                                        .capsuleStyle()
                                                }
                                            }
                                            if appSettings.showLogin {
                                                Text("Username: \n \(user.login.username)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showRegistered {
                                                Text("Years Registered: \n \(user.registered.age)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showDOB {
                                                Text("Age: \n \(user.dob.age)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showPhone {
                                                Text("Phone: \n \(user.phone)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showCell {
                                                Text("Cell: \n \(user.cell)")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showID {
                                                Text("ID Value: \n \(user.idInfo.value ?? "N/A")")
                                                    .capsuleStyle()
                                            }
                                            if appSettings.showNat {
                                                Text("Nationality: \n \(user.nat)")
                                                    .capsuleStyle()
                                            }
                                        }
                                        .font(.footnote)
                                    }
                                    .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem {
                    NavigationLink("Settings") {
                        Settings()
                    }
                }
            }
            .task {
                await apiService.getUsers(count: appSettings.howManyUsers)
            }
            .onChange(of: appSettings.howManyUsers) { oldValue, newValue in
                Task {
                    await apiService.getUsers(count: newValue)
                }
            }
        }
    }
}

struct CapsuleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(3)
            .multilineTextAlignment(.center)
            .frame(width: 150, height: 50)
            .glassEffect(.regular.tint(Color.random),in: RoundedRectangle(cornerRadius: 8))
    }
}
extension View {
    func capsuleStyle() -> some View {
        self.modifier(CapsuleStyle())
    }
}

extension Color {
    static var random: Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .pink, .mint, .cyan, .indigo, .teal]
        
        return colors.randomElement() ?? .white
    }
}


#Preview {
    ContentView()
        .environment(AppSettings())
}
