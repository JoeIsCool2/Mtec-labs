import Foundation
#if canImport(FoundationModels)
import FoundationModels
#endif

@available(iOS 18.0, macOS 15.0, *)
public struct AIService {
    public struct Configuration {
        public var instructions: String?
        public var temperature: Double

        public init(
            instructions: String? = nil,
            temperature: Double = 0.7
        ) {
            self.instructions = instructions
            self.temperature = temperature
        }
    }

    public static var configuration = Configuration()

    /// Sends a prompt to the on-device Foundation Model and returns the generated text.
    public static func ai(prompt: String) async -> String {
        #if !canImport(FoundationModels)
        return "FoundationModels framework is not available on this platform or SDK."
        #else
        do {
            let model = SystemLanguageModel.default
            guard model.availability == .available else {
                return "Model unavailable: \(model.availability)"
            }

            let session = configuration.instructions != nil
                ? LanguageModelSession(instructions: configuration.instructions!)
                : LanguageModelSession()

            let options = GenerationOptions(temperature: configuration.temperature)

            let response: LanguageModelSession.Response<String> = try await session.respond(to: prompt, options: options)
            let text = response.content.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            return text.isEmpty ? "(No response)" : text
        } catch {
            return "AI error: \(error.localizedDescription)"
        }
        #endif
    }
}

// MARK: - Demo
@available(iOS 18.0, macOS 15.0, *)
public enum AIDemoHelper {
    public static func demo() async {
        let reply = await AIService.ai(prompt: "Say hello in one short sentence.")
        print("AI demo reply: \(reply)")
    }
}
