import SwiftUI

struct Movies: Identifiable, Hashable {
    var name: String
    var yearReleased: String
    var goodOrBad: Bool
    let id: UUID = UUID()
}

struct MovieView: View {
    @State private var movies = [
        Movies(name: "Inception", yearReleased: "2010", goodOrBad: true),
        Movies(name: "The Matrix", yearReleased: "1999", goodOrBad: true),
        Movies(name: "Interstellar", yearReleased: "2014", goodOrBad: true),
        Movies(name: "The Dark Knight", yearReleased: "2008", goodOrBad: true),
        Movies(name: "Pulp Fiction", yearReleased: "1994", goodOrBad: false),
        Movies(name: "Fight Club", yearReleased: "1999", goodOrBad: false),
        Movies(name: "Forrest Gump", yearReleased: "1994", goodOrBad: true),
        Movies(name: "The Shawshank Redemption", yearReleased: "1994", goodOrBad: false),
        Movies(name: "Gladiator", yearReleased: "2000", goodOrBad: true),
        Movies(name: "The Lord of the Rings: The Fellowship of the Ring", yearReleased: "2001", goodOrBad: true)
    ]
    
    var body: some View {
        NavigationStack {
            List($movies) { $movie in
                NavigationLink(destination: EditMovie(movie: $movie)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movie.name).bold()
                            Text(movie.yearReleased).font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            Text("Recommended")
                            Text(movie.goodOrBad ? "✅" : "❌")
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}

struct EditMovie: View {
    @Binding var movie: Movies
    
    var body: some View {
        Form {
            TextField("Movie Name", text: $movie.name)
            TextField("Year Released", text: $movie.yearReleased)
            Toggle("Recommended", isOn: $movie.goodOrBad)
        }
        .navigationTitle("Edit Movie")
    }
}

#Preview {
    MovieView()
}
