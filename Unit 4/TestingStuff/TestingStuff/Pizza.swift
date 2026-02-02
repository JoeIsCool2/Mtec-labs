struct Pizza {
    let name: String
    let sauce: String
    let isPizzaCircle: Bool
    let toppings: [Toppings]
    
    func fullPizza() -> Bool {
        isPizzaCircle
    }
    
    func howManyToppings() -> Int {
        toppings.count
    }
    
    func findPrice() -> Int {
        10 + toppings.count * 1 + { sauce.isEmpty ? 0 : 1 }()
    }
    
    func findWeight() -> Double {
        (Double(toppings.count) * 111 / 53.4 + 67.7) / 3
    }
}

enum Toppings {
    case pepperoni
    case sausage
    case bacon
    case ham
    case chicken
    case mushrooms
    case onions
    case greenPeppers
    case blackOlives
    case jalapenos
    case pineapple
    case spinach
    case extraCheese
}
