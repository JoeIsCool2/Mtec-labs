import SwiftUI
import SwiftData

struct AddUserView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var allUsers: [User]
    @State var name = ""
    @State var howManyUsers = 1
    @Binding var randomUsers: [Int]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 200)
                .foregroundStyle(LinearGradient(colors: [.clear, Theme.PalmLeaf], startPoint: .top, endPoint: .bottom))
                .shadow(radius: 8)
            VStack {
                Text("Add User")
                    .font(.custom("Impact", size: 45))
                    .foregroundStyle(Theme.PalmLeaf)
                    .shadow(radius: 5)
                HStack {
                    TextField("Enter Name", text: $name)
                        .foregroundStyle(Theme.Lavender)
                        .tint(Theme.Lavender)
                        .padding(8)
                        .glassEffect(.regular.tint(Theme.OliveLeaf))
                    Button("Add") {
                        randomUsers = []
                        modelContext.insert(User(name: name))
                        name = ""
                    }
                    .foregroundStyle(Theme.Lavender)
                    .tint(Theme.Lavender)
                    .padding(8)
                    .glassEffect(.regular.tint(Theme.OliveLeaf))
                }
                .padding(5)
                HStack {
                    if allUsers.count > 0 {
                        Button("Select \(howManyUsers) Random User") {
                            randomUsers = selectRandomUsers()
                        }
                        .font(.custom("", size: 15))
                        .padding(3)
                        .glassEffect()
                        .padding(3)
                        Stepper("", value: $howManyUsers) {_ in
                            if howManyUsers > allUsers.count {
                                howManyUsers = allUsers.count
                            }
                            if howManyUsers < 1 {
                                howManyUsers = 1
                            }
                        }
                    }
                    }
                        .foregroundStyle(Theme.Lavender)
                        .tint(Theme.Lavender)
                        .padding(5)
                        .glassEffect(.regular.tint(Theme.OliveLeaf))
            }
            .padding()
        }
    }
    func selectRandomUsers() -> [Int] {
        var randomUsers: [Int] = []
        var count = 0
        while count < howManyUsers {
            let randomNumber = Int.random(in: 0...allUsers.count - 1)
            if randomUsers.contains(randomNumber) {
                
            } else {
                count += 1
                randomUsers.append(randomNumber)
            }
        }
        return randomUsers
    }
}
