import SwiftUI

// MARK: - Convert hex or named colors into SwiftUI Color
extension Color {
    init(themeHexOrName: String) {
        let s = themeHexOrName.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if s.hasPrefix("#") {
            let hex = String(s.dropFirst())
            var value: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&value)
            let r = Double((value >> 16) & 0xFF) / 255.0
            let g = Double((value >> 8) & 0xFF) / 255.0
            let b = Double(value & 0xFF) / 255.0
            self = Color(red: r, green: g, blue: b)
        } else {
            switch s {
            case "green": self = .green
            case "blue": self = .blue
            case "red": self = .red
            case "orange": self = .orange
            case "purple": self = .purple
            case "pink": self = .pink
            case "yellow": self = .yellow
            case "black": self = .black
            case "white": self = .white
            case "gray", "grey": self = .gray
            default: self = .accentColor
            }
        }
    }
}
