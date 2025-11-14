import SwiftUI
import Combine
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

class CardViewModel: ObservableObject {
    @Published var name = ""
    @Published var cardNumber = ""
    @Published var securityCode = ""
    @Published var validationMessage = ""

    var validator: CardValidating

    init(validator: CardValidating = BasicCardValidator()) {
        self.validator = validator
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


// MARK: - View

struct ContentView: View {
    @StateObject private var viewModel = CardViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Credit Card Processor")
                .font(.title)
                .bold()
                .foregroundColor(.blue)

            TextField("Name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)

            TextField("Card Number", text: $viewModel.cardNumber)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            SecureField("Security Code", text: $viewModel.securityCode)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Submit") {
                viewModel.validate()
            }

            Text(viewModel.validationMessage)
                .padding(.top)
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
