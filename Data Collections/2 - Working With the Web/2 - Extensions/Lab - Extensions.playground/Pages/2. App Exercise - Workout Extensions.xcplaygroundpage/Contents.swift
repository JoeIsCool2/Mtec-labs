/*:
## App Exercise - Workout Extensions

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Add an extension to the `Workout` struct below and make it adopt the `CustomStringConvertible` protocol.
 */
struct Workout: CustomStringConvertible {
    var distance: Double
    var time: Double
    var averageHR: Int
    
    var description: String {
            """
            Workout Summary:
            - Distance: \(distance) km
            - Time: \(time) min
            - Average Heart Rate: \(averageHR) bpm
            - Speed: \(Int(speed)) km/h
            """
        }
    
    var speed: Double {
        distance / time
    }
    
    mutating func harderWorkout() -> Workout {
        let newTime = time * 2
        let newDistance = distance * 2
        let newHR = averageHR + 40
        return Workout(distance: newDistance, time: newTime, averageHR: newHR)
    }
}



//:  Now create another extension for `Workout` and add a property `speed` of type `Double`. It should be a computed property that returns the average meters per second traveled during the workout.


//:  Now add a method `harderWorkout` that takes no parameters and returns another `Workout` instance. This method should double the `distance` and `time` properties, and add 40 to `averageHR`. Create an instance of `Workout` and print it to the console. Then call `harderWorkout` and print the new `Workout` instance to the console.
var workout = Workout(distance: 1000, time: 3.45, averageHR: 96)
print(workout.harderWorkout())

/*:
 _Copyright © 2023 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 2 of 2
 */
