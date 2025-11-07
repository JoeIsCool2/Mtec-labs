import SwiftUI

struct InventoryView: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with title + close icon placeholder
            HStack {
                Text("Inventory")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "bag.fill")
                    .foregroundColor(.green)
            }

            Divider()

            if items.isEmpty {
                VStack {
                    Spacer()
                    Text("You haven’t collected anything yet.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(items, id: \.self) { item in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 8))
                                    .foregroundColor(.green)
                                Text(item)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding(.vertical, 6)
                            .padding(.horizontal, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.green.opacity(0.1))
                            )
                        }
                    }
                }
            }
        }
        .padding(20)
        .frame(maxWidth: 350, maxHeight: 450) // ✅ stays within screen bounds
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(radius: 10)
        )
        .padding()
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        InventoryView(items: ["Knife", "Book", "Torch", "Map", "Lantern"])
    }
}
