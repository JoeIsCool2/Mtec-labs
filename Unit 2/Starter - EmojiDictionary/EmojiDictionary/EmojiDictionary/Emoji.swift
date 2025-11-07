//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Jane Madsen on 10/30/25.
//

import Foundation

struct Emoji: Codable, Identifiable {
    var id: UUID = UUID()
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")

    
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(emojis)
            try data.write(to: archiveURL, options: .noFileProtection)
            print("it worked")
        } catch {
            print("Error Saving Emojis: \(error)")
        }
    }
    
    static func loadFromFile() -> [Emoji] {
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: archiveURL)
            let decodedEmojis = try decoder.decode([Emoji].self, from: data)
            print(decodedEmojis)
            return decodedEmojis
        } catch {
            print("Error loading emojis: \(error)")
            return [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness")]
        }
    }
}
