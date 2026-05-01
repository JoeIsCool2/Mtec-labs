import Foundation

// MARK: - API Response
struct RandomUserResponse: Codable {
    var results: [User]
    var info: Info
}

// MARK: - User
struct User: Codable, Identifiable {
    var id = UUID()

    var gender: String
    var name: Name
    var location: Location
    var email: String
    var login: Login
    var dob: DOB
    var registered: Registered
    var phone: String
    var cell: String
    var idInfo: IDInfo
    var picture: Picture
    var nat: String

    enum CodingKeys: String, CodingKey {
        case gender, name, location, email, login, dob, registered, phone, cell, picture, nat
        case idInfo = "id"
    }
}

// MARK: - Name
struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

// MARK: - Location
struct Location: Codable {
    var street: Street
    var city: String
    var state: String
    var country: String
    var postcode: Int
    var coordinates: Coordinates
    var timezone: Timezone
}

// MARK: - Street
struct Street: Codable {
    var number: Int
    var name: String
}

// MARK: - Coordinates
struct Coordinates: Codable {
    var latitude: String
    var longitude: String
}

// MARK: - Timezone
struct Timezone: Codable {
    var offset: String
    var description: String
}

// MARK: - Login
struct Login: Codable {
    var uuid: String
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
}

// MARK: - DOB / Registered
struct DOB: Codable {
    var date: String
    var age: Int
}

struct Registered: Codable {
    var date: String
    var age: Int
}

// MARK: - ID Info
struct IDInfo: Codable {
    var name: String
    var value: String? // can be null
}

// MARK: - Picture
struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

// MARK: - Info
struct Info: Codable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}

//import Foundation
//
//// MARK: - API Response
//struct RandomUserResponse: Codable {
//    var results: [User]
//    var info: Info
//}
//
//// MARK: - User
//struct User: Codable, Identifiable {
//    var id = UUID()
//    
//    var gender: String
//    var name: Name
//    var location: Location
//    var email: String
//    var login: Login
//    var registered: Registered
//    var dob: DOB
//    var phone: String
//    var cell: String
//    var idInfo: IDInfo
//    var nat: String
//    var picture: Picture
//    
//    enum CodingKeys: String, CodingKey {
//        case gender, name, location, email, login, registered, dob, phone, cell, picture, nat
//        case idInfo = "id"
//    }
//}
//
//// MARK: - Login
//struct Login: Codable {
//    var uuid: String
//    var username: String
//}
//
//// MARK: - DOB / Registered
//struct DOB: Codable {
//    var date: String
//    var age: Int
//}
//
//struct Registered: Codable {
//    var date: String
//    var age: Int
//}
//
//// MARK: - ID Info
//struct IDInfo: Codable {
//    var name: String
//    var value: String? // Value can sometimes be null in this API
//}
//
//// MARK: - Name
//struct Name: Codable {
//    var title: String
//    var first: String
//    var last: String
//}
//
//// MARK: - Location
//struct Location: Codable {
//    var street: Street
//    var city: String
//    var state: String
//    var country: String
//}
//
//// MARK: - Street
//struct Street: Codable {
//    var number: Int
//    var name: String
//}
//
//// MARK: - Picture
//struct Picture: Codable {
//    var large: String
//    var medium: String
//    var thumbnail: String
//}
//
//// MARK: - Info
//struct Info: Codable {
//    var seed: String
//    var results: Int
//    var page: Int
//    var version: String
//}
