import Foundation

@Observable
class APIService {
    
    var users: [User] = []
    
    func getUsers(count: Int) async {
        guard let url = URL(string: "https://randompeople.exnovo.app/api?results=\(count)") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(RandomUserResponse.self, from: data)
            
            await MainActor.run {
                self.users = decodedResponse.results
            }
            
        } catch {
            print("Decoding error: \(error)")
        }
    }
}
//@Observable
//class APIService {
//
//    var users: [User] = []
//
//    func getUsers(count: Int) async {
//        guard let url = URL(string: "https://randomuser.me/api/?results=\(count)") else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decodedResponse = try JSONDecoder().decode(RandomUserResponse.self, from: data)
//
//            await MainActor.run {
//                self.users = decodedResponse.results
//            }
//
//        } catch {
//            print("Decoding error: \(error)")
//        }
//    }
//}
