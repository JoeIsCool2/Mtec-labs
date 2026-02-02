import XCTest
@testable import TestingStuff

class TestPizza: XCTestCase {
    let pizza = Pizza(name: "Good", sauce: "Red", isPizzaCircle: true, toppings: [.bacon, .blackOlives, .chicken])
    
    func testFullPizza() throws {
        XCTAssertTrue(pizza.isPizzaCircle)
    }
    
    func testToppingAmount() throws {
        XCTAssertEqual(pizza.howManyToppings(), 3)
    }
    
    func testPrice() throws {
        XCTAssertEqual(pizza.findPrice(), 14)
    }
    
    func testFindWeight() throws {
        XCTAssertEqual(pizza.findWeight(), 24.645318352059927)
    }
}
