import SwiftUI

let baseURL = "https://itunes.apple.com/search"

let query: [String: String] = [
    "term": "mama d",
    "media": "music",
    "entity": "musicTrack",
    "limit": "1"
]

var urlComponents = URLComponents(string: baseURL)!
urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }

let url = urlComponents.url!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let data = data {
        do {
            let decodedResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
            for track in decodedResponse.results {
                print("🎵 \(track.trackName ?? "Unknown") by \(track.artistName ?? "Unknown")")
            }
        } catch {
            print("Decoding error: \(error)")
        }
    } else if let error = error {
        print("Network error: \(error)")
    }
}
task.resume()



struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Track]
}

struct Track: Codable {
    let trackName: String?
    let artistName: String?
    let collectionName: String?
}
