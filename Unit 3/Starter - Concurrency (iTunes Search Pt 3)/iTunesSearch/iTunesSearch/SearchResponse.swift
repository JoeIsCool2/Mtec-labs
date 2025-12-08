import SwiftUI

struct SearchResult: Codable {
    let trackName: String?
    let artistName: String?
    let previewUrl: String?
    let artworkUrl100: String?
}

struct SearchResponse: Codable {
    let results: [SearchResult]
}
