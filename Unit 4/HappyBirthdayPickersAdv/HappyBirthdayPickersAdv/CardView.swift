import SwiftUI

struct CardView: View {
    @Environment(ViewModel.self) var viewModel // Use shared data
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                // Main Content
                if viewModel.cards.isEmpty {
                    emptyStateView
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.cards) { card in
                                CardRowView(card: card)
                            }
                        }
                        .padding()
                    }
                }
                
                // Floating Action Button
                NavigationLink(destination: CreateCardView()) {
                    Image(systemName: "plus")
                        .font(.title.weight(.bold))
                        .foregroundStyle(.white)
                        .padding(20)
                        .background(
                            Circle()
                                .fill(Color.blue)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                }
                .padding()
            }
            .navigationTitle("Birthday Cards")
        }
    }
    
    // View for when there are no cards
    var emptyStateView: some View {
        VStack(spacing: 15) {
            Image(systemName: "balloon.2.fill")
                .font(.system(size: 60))
                .foregroundStyle(.gray.opacity(0.5))
            Text("No parties planned yet!")
                .font(.headline)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// Extracted Subview for cleaner code
struct CardRowView: View {
    let card: Card
    
    var body: some View {
        HStack(spacing: 15) {
            // Image Section
            card.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 2))
                .shadow(radius: 3)
            
            // Text Section
            VStack(alignment: .leading, spacing: 5) {
                Text(card.description)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary) // Auto-adjusts for dark mode
                
                Text(card.date.formatted(date: .long, time: .omitted))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(card.backgroundColor)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
    }
}

#Preview {
    CardView()
        .environment(ViewModel())
}
