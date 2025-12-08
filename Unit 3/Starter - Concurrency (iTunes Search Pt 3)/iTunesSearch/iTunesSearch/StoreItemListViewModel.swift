import Combine
import Foundation

@Observable
class StoreItemListViewModel {
    var items: [SearchResult] = []
    
    var searchText = ""
    var selectedMediaType: MediaType = .music
    
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")

    func fetchMatchingItems(searchText: String) {
        guard !searchText.isEmpty else { return }
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "term", value: searchText),
            URLQueryItem(name: "media", value: selectedMediaType.rawValue)
        ]
        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                       await MainActor.run {
                           self.items = decodedResponse.results
                       }
            } catch {
                print("Fetch failed: \(error.localizedDescription), URL: \(url)")
            }
        }
    }
}
