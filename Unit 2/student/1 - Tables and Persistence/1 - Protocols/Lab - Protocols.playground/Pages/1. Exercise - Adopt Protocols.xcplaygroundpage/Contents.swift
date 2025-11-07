/*:
## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
import SwiftUI
import Foundation

class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    var name: String
    var age: Int
    
    var description: String {
            "\(name) is \(age) years old"
        }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func == (lhs: Human, rhs: Human) -> Bool {
        lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    static func < (lhs: Human, rhs: Human) -> Bool {
        lhs.age < rhs.age
    }
}

let joe = Human(name: "Joe", age: 18)
let mom = Human(name: "Jamie", age: 45)
//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
print(joe)
print(mom)

//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
print(joe == mom)
print(joe == joe)

//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
let john = Human(name: "john", age: 23)
let jeff = Human(name: "jeff", age: 52)
let jax = Human(name: "Jax", age: 34)
let people: [Human] = [joe, jeff, mom, jax, john]
let sortedPeople = people.sorted()
print(sortedPeople)

//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.

let encoder = JSONEncoder()
let jsonData = try encoder.encode(joe)
print(jsonData)

/*:
page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
