/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let dontDoThis: [Any] = [1, true, "Pizza", 8.4, false]
print(dontDoThis)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for value in dontDoThis {
    switch value {
    case let number as Int:
        print("The Integer has a value of \(number)")
    case let words as String:
        print("The String has a value of \(words)")
    case let number as Double:
        print("The Double has a value of \(number)")
    case let tOrF as Bool:
        print("The integer has a value of \(tOrF)")
    default:
        print("this is not a type")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let goodToBad: [String: Any] = ["Pizza is good": true, "2 + 2 =": 4, "whats is your name": "Joe", "the percentage of the earth covered in water": 90.67]
print(goodToBad)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (_, value) in goodToBad {
    switch value {
    case let number as Int:
        total += Double(number)
    case let words as String:
        total += 1
    case let number as Double:
        total += number
    case let tOrF as Bool:
        if tOrF {
            total += 2
        } else {
            total -= 3
        }
    default:
        print("this is not a type")
    }
}

print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (string, value) in goodToBad {
    switch value {
    case let number as Int:
        total2 += Double(number)
    case let words as String:
        total2 += Double(words) ?? 1
    case let number as Double:
        total2 += number
    default:
        print("this is not a type that I like")
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
