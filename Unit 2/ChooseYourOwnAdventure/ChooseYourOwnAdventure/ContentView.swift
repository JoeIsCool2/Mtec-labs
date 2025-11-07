import SwiftUI

// MARK: - Models

struct AdventureStep: Codable {
    let title: String
    let description: String
    let options: [AdventureOption]
}

struct AdventureOption: Codable, Identifiable {
    var id = UUID()   // make it `var` so SwiftUI can assign a new one
    let text: String
    let item: String?
}

struct AdventureResponse: Codable {
    let step: AdventureStep
    let theme: AdventureTheme
}

// MARK: - ContentView

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    @State private var currentlyGenerating = false
    @State private var currentStep: AdventureStep?
    @State private var inventory: [String] = []
    
    // Start screen state
    @State private var adventureTheme: String = ""
    @State private var hasStarted = false
    
    // Item popup state
    @State private var newItem: String? = nil
    @State private var showItemPopup = false
    
    // Inventory toggle
    @State private var showInventory = false
    
    private func resetAll() {
        currentlyGenerating = false
        currentStep = nil
        inventory = []
        adventureTheme = ""
        hasStarted = false
        newItem = nil
        showItemPopup = false
        showInventory = false
    }
    
    var body: some View {
        ZStack {
            themeManager.backgroundColor
                .ignoresSafeArea()
            
            Group {
                if !hasStarted {
                    // START SCREEN
                    VStack(spacing: 24) {
                        Text("Choose Your Adventure")
                            .font(.largeTitle.bold())
                            .foregroundColor(themeManager.mainColor)
                        
                        Text("What kind of adventure would you like to go on?")
                            .foregroundColor(themeManager.textSecondaryColor)
                        
                        TextField("Type your adventure idea...", text: $adventureTheme)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 40)
                        
                        Button("Begin") {
                            startAdventure()
                        }
                        .padding()
                        .background(themeManager.accentColor)
                        .foregroundColor(themeManager.textPrimaryColor)
                        .cornerRadius(12)
                        .shadow(color: themeManager.shadowColor.opacity(0.4), radius: 4)
                        .disabled(adventureTheme.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                    .padding()
                } else {
                    // ADVENTURE SCREEN
                    ZStack(alignment: .topTrailing) {
                        VStack(spacing: 24) {
                            Spacer()
                            
                            if let step = currentStep {
                                Text(step.title)
                                    .font(.title.bold())
                                    .foregroundColor(themeManager.mainColor)
                                
                                ScrollView {
                                    Text(step.description)
                                        .foregroundColor(themeManager.textSecondaryColor)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(maxHeight: 250)
                                
                                if !currentlyGenerating {
                                    if let step = currentStep {
                                        ForEach(step.options) { option in
                                            Button(option.text) {
                                                choose(option: option)
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(themeManager.mainColor)
                                            .foregroundColor(themeManager.textPrimaryColor)
                                            .cornerRadius(12)
                                            .shadow(color: themeManager.shadowColor.opacity(0.3), radius: 4)
                                        }
                                    }
                                } else {
                                    Text("Creating the perfect story")
                                        .foregroundColor(themeManager.dangerColor)
                                }
                                
                                Spacer()
                                
                                if currentlyGenerating {
                                    VStack(spacing: 12) {
                                        ProgressView()
                                        Text("Finding story...")
                                            .foregroundColor(themeManager.textSecondaryColor)
                                    }
                                    .padding(.vertical, 40)
                                    .padding(.horizontal, 20)
                                }
                            }
                            
                            // ✅ Inventory button always pinned top-right
                            Button {
                                withAnimation { showInventory.toggle() }
                            } label: {
                                Image(systemName: "backpack.fill")
                                    .font(.title2)
                                    .foregroundColor(themeManager.textPrimaryColor)
                                    .padding(12)
                                    .background(themeManager.accentColor, in: Circle())
                                    .shadow(color: themeManager.shadowColor.opacity(0.3), radius: 4)
                            }
                            .padding()
                        }
                        .overlay(alignment: .bottomTrailing) {
                            // ✅ Improved Reset button
                            Button {
                                withAnimation { resetAll() }
                            } label: {
                                HStack(spacing: 6) {
                                    Image(systemName: "arrow.counterclockwise.circle.fill")
                                        .font(.title2)
                                    Text("Reset Adventure")
                                        .font(.headline)
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(
                                    Capsule()
                                        .fill(themeManager.dangerColor.gradient)
                                        .shadow(color: themeManager.shadowColor.opacity(0.4), radius: 6, x: 2, y: 2)
                                )
                            }
                            .padding(.trailing, 24)
                            .padding(.bottom, 24)
                        }
                    }
                    
                    // ✅ Inventory overlay
                    if showInventory {
                        VStack {
                            Spacer()
                            InventoryView(items: inventory)
                                .padding()
                                .background(themeManager.surfaceColor, in: RoundedRectangle(cornerRadius: 16))
                                .shadow(color: themeManager.shadowColor.opacity(0.3), radius: 5)
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                        }
                        .padding(.trailing, 20)
                    }
                    
                    // ✅ Item popup overlay
                    if showItemPopup, let item = newItem {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                VStack(spacing: 8) {
                                    Text("You found: \(item)")
                                        .font(.headline)
                                        .foregroundColor(themeManager.textPrimaryColor)
                                    Text("It may help you later in your journey.")
                                        .font(.subheadline)
                                        .foregroundColor(themeManager.textSecondaryColor)
                                }
                                .padding()
                                .background(themeManager.successColor, in: RoundedRectangle(cornerRadius: 12))
                                .shadow(color: themeManager.shadowColor.opacity(0.3), radius: 5)
                                Spacer()
                            }
                            .padding(.bottom, 40)
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showItemPopup = false
                                }
                            }
                        }
                    }
                }
            }
            .animation(.easeInOut, value: showItemPopup)
            .animation(.easeInOut, value: showInventory)
        }
    }
    
    // MARK: - Logic
    
    private func startAdventure() {
        currentlyGenerating = true
        hasStarted = true
        
        Task {
            let prompt = """
        You are writing a choose-your-own-adventure story.
        The adventure theme is: "\(adventureTheme)".
        The player currently has these items: \(inventory).
        
        Continue the story in 1–2 sentences, keeping it exciting and mysterious.
        
        Return ONLY valid JSON in this format:
        
        {
          "step": {
            "title": "string",
            "description": "string",
            "options": [
              { "text": "string", "item": "string or null" },
              { "text": "string", "item": "string or null" }
            ]
          },
          "theme": {
            "main": "#2E8B57",
            "secondary": "#FFD166",
            "background": "#F8F9FA",
            "surface": "#FFFFFF",
            "textPrimary": "#000000",
            "textSecondary": "#555555",
            "accent": "#118AB2",
            "shadow": "#000000",
            "success": "#06D6A0",
            "warning": "#FFD166",
            "danger": "#EF476F"
          }
        }
        
        Important:
        - Do not include any text outside the JSON.
        - Make the options make sense with the description logically.
        - If an option grants no item, use "item": null.
        - If the option includes an item it should make sense logically.
        - Never return the string "nil" or the word "null".
        - Items should be tangible objects (e.g. "knife", "book", "torch").
        - Colors must be valid hex codes (e.g. "#RRGGBB") or common CSS color names.
        """
            
            
            
            let reply = await AIService.ai(prompt: prompt)
            
            await MainActor.run {
                decodeStep(from: reply)
                currentlyGenerating = false
            }
        }
    }
    
    private func choose(option: AdventureOption) {
        currentlyGenerating = true
        
        if let item = option.item, !item.trimmingCharacters(in: .whitespaces).isEmpty {
            inventory.append(item)
            newItem = item
            withAnimation {
                showItemPopup = true
            }
        }
        
        Task {
            let prompt = """
        You are writing a choose-your-own-adventure story.
        The player chose: "\(option.text)".
        The player currently has these items: \(inventory).
        Continue the story in 1-2 sentences, keeping it exciting and mysterious.
        Return ONLY valid JSON in this format:
        
        {
          "title": "string",
          "description": "string",
          "options": [
            { "text": "string", "item": "string or null" },
            { "text": "string", "item": "string or null" }
          ]
        }
        """
            
            let reply = await AIService.ai(prompt: prompt)
            
            await MainActor.run {
                decodeStep(from: reply)
                currentlyGenerating = false
            }
        }
    }
    
    private func decodeStep(from reply: String) {
        do {
            let cleaned = reply
                .replacingOccurrences(of: "```json", with: "")
                .replacingOccurrences(of: "```", with: "")
                .replacingOccurrences(of: "'''json", with: "")
                .replacingOccurrences(of: "'''", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            
            if let data = cleaned.data(using: .utf8) {
                let response = try JSONDecoder().decode(AdventureResponse.self, from: data)
                currentStep = response.step
                themeManager.theme = response.theme
            } else {
                currentStep = AdventureStep(
                    title: "Error",
                    description: "Failed to parse AI response.",
                    options: []
                )
            }
        } catch {
            currentStep = AdventureStep(
                title: "Error",
                description: "Error decoding AI response: \(error.localizedDescription)\n\nRaw: \(reply)",
                options: []
            )
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
