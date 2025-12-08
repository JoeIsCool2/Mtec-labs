import SwiftUI

struct Dragon: Identifiable, Hashable {
    let id = UUID()
    var picture: ImageResource
    var species: String
    var loreSnippet: String
    var powers: [Power]
}

struct Power: Identifiable, Hashable {
    let id = UUID()
    var type: PowerType
    var name: String
    var strength: Int
}

enum PowerType {
    case defense, elemental, speed, healing, control, camouflage, illusion

    var systemImage: String {
        switch self {
        case .defense:
            return "shield.fill"          // 🛡️
        case .elemental:
            return "flame.fill"           // 🔥
        case .speed:
            return "wind"                 // 💨
        case .healing:
            return "cross.fill"           // ✚
        case .control:
            return "hand.raised.fill"     // ✋
        case .camouflage:
            return "leaf.fill"            // 🍃
        case .illusion:
            return "sparkles"             // ✨
        }
    }
    var color: Color {
            switch self {
            case .defense:    return .blue        // sturdy, protective
            case .elemental:  return .red         // fiery, destructive
            case .speed:      return .cyan        // swift, airy
            case .healing:    return .green       // restorative, natural
            case .control:    return .purple      // commanding, mystical
            case .camouflage: return .brown       // earthy, hidden
            case .illusion:   return .pink        // magical, deceptive
            }
        }
}

