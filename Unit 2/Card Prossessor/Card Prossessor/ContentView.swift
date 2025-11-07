import SwiftUI

// MARK: - Models

struct CardInput {
    let name: String
    let number: String
    let securityCode: String
}

// MARK: - Errors

enum CardErrors: Error, CustomStringConvertible {
    case noName
    case invalidCharacters
    case incorrectLength
    case invalidSecurityCode

    var description: String {
        switch self {
        case .noName: return "Name is required."
        case .invalidCharacters: return "Card number must contain only digits."
        case .incorrectLength: return "Card number must be 16 digits."
        case .invalidSecurityCode: return "Security code must be 3 digits."
        }
    }
}

// MARK: - Protocol

protocol CardValidating {
    func validate(card: CardInput) throws -> Bool
}

// MARK: - Validator

struct BasicCardValidator: CardValidating {
    func validate(card: CardInput) throws -> Bool {
        guard !card.name.isEmpty else {
            throw CardErrors.noName
        }

        let digits = card.number.compactMap { Int(String($0)) }
        guard digits.count == card.number.count else {
            throw CardErrors.invalidCharacters
        }

        guard digits.count == 16 else {
            throw CardErrors.incorrectLength
        }

        let securityDigits = card.securityCode.compactMap { Int(String($0)) }
        guard securityDigits.count == 3 else {
            throw CardErrors.invalidSecurityCode
        }

        return true
    }
}

// MARK: - View

struct ContentView: View {
    @State private var name: String = ""
    @State private var cardNumber: String = ""
    @State private var securityCode: String = ""
    @State private var validationMessage: String = ""

    // Injected validator
    var validator: CardValidating = BasicCardValidator()

    var body: some View {
        VStack(spacing: 20) {
            Text("Credit Card Processor")
                .font(.title)
                .bold()
                .foregroundColor(.blue)

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Card Number", text: $cardNumber)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            SecureField("Security Code", text: $securityCode)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Submit") {
                validate()
            }

            Text(validationMessage)
                .padding(.top)
        }
        .padding()
    }

    func validate() {
        let input = CardInput(name: name, number: cardNumber, securityCode: securityCode)
        do {
            let result = try validator.validate(card: input)
            validationMessage = result ? "✅ Card is valid!" : "❌ Card is not valid."
        } catch let error as CardErrors {
            validationMessage = "❌ \(error.description)"
        } catch {
            validationMessage = "❌ Unknown error."
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
