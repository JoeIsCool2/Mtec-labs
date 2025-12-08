/*:
## Exercise - Generic Functions
 
 The `duplicate` function below works only when working with Ints, but its body could work with any type. Rewrite the function to use a generic type `<T>` instead. Test your new function by calling it several times, using a String, an Int, and a Double.
 */

import Foundation

func duplicate<T>(_ input: T) -> (T, T) {
    return (input, input)
}

duplicate(6.7)
duplicate(67)
//:  The function below retrieves a random value from an array of Ints and then deletes that value. The `inout` keyword means that it modifies the array passed into it directly. This function could work with an array of any type, so long as the type conforms to Equatable. Rewrite the function to use a generic type `<U>` instead, constraining to Equatable types. Test your new function by calling it several times, using an array of Strings, of Ints, and of Doubles.

func pullRandomElement<U: Equatable>(_ array: inout [U]) -> U? {
    let randomElement = array.randomElement()
    
    guard let randomElement, let index = array.firstIndex(of: randomElement) else { return nil }
    array.remove(at: index)
    
    return randomElement
}

//pullRandomElement([1,3,4,5,7])
//pullRandomElement(["1", "3", "5", "9"])
//pullRandomElement([1.2, 6.4, 7.9, 8.3])

//:  The function below sorts an array, then returns a new array containing only the first and last Strings of the array after sorting. This function could work with an array of any type, so long as the type conforms to Comparable. Rewrite the function to use a generic type `<V>` instead, constraining to Comparable types. Test your new function by calling it several times, using an array of Strings, of Ints, and of Doubles.

func minMaxArray<V: Comparable>(_ array: [V]) -> [V] {
    var output: [V] = []
    
    let minElement = array.min()
    let maxElement = array.max()
    
    if let minElement {
        output.append(minElement)
    }
    
    if let maxElement {
        output.append(maxElement)
    }
    
    return output
}

minMaxArray([1,2,5,32,54,32,76,1,544,765431])
minMaxArray([1.1, 1.11, 1.111, 1.1011])
minMaxArray(["g", "1", "6", "7", "h"])
/*:
page 1 of 4  |  [Next: Exercise - Generic Types](@next)
 */
