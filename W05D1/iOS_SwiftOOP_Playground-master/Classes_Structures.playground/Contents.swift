import Foundation
/*:
 # Classes and Structures
 
 ## Learning Outcomes
 
 * understand the difference between classes and structures
 * can describe the difference between a reference and a value type
 * understand the difference between `===` and `==`
 
 ## Goal
 
 This is an introduction to the differences between classes and structures. You will read through apple's documentation on classes and structures and experiment by coding in a playground.
 
 ## Reading
 
 Read Apple's documentation on [Classes and Structures](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html).
 
 
 Read Apple's blog on [Value and Reference Types](https://developer.apple.com/swift/blog/?id=10).
 
 Think about each Self-Reflection quesetion and experiment in the playground help understand what you're reading.
*/
/*:
 - Callout(Self-Reflection):
    * What is the difference between a value type and a reference type?
    * Out of classes and structs, which one is a value type and which one is a reference type.
 */
/*:
 - Experiment:
   What are the final temperature values when Thermometer is a class? What are they when Thermometer is a struct? In the absence of mutation, why do structs and classes behave the same way?
 */
//class Thermometer {
//  var temperature: Double = 0.0
//  func register(temperature: Double) {
//    self.temperature = temperature
//  }
//}

struct Thermometer {
  var temperature: Double = 0.0
  mutating func register(temperature: Double) {
    self.temperature = temperature
  }
}

var thermometer1 = Thermometer()
thermometer1.register(temperature: 56.0)
var thermometer2 = thermometer1
thermometer2.register(temperature: 42.0)

thermometer1.temperature
thermometer2.temperature
/*:
 - Callout(Self-Reflection):
 * Can classes have properties that are structs?
 * How about the opposite, can structs have properties that are classes?
 */
/*:
 - Experiment:
 Create a struct and an object. What happens when you try to add one as a property of the other?
 */

//myClass.StructInsideClass



/*:
 - Callout(Self-Reflection):
    * What is identity (the `===` operator)? What does it mean when two struct objects or two class objects are identical?
    * What is equivalence (the `==` operator)? How is this different from identity?
 */
/*:
 - Experiment:
   Create two instances of `User` with the same `username`. What happens when you compare them with `==` and `===`?
 */
class User: Equatable {
  let username: String
  
  init(username: String) {
    self.username = username
  }
  static func ==(lhs: User, rhs: User) -> Bool {
    return lhs.username == rhs.username
  }
}

let user1 = User(username: "username")
let user2 = User(username: "username")

print(user1 == user2)
print(user1 === user2)
/*:
 - Callout(Self-Reflection):
 What is the difference between Swift basic data types (`String`, `Array`, `Dictionary`) vs the data types used commonly in Objective-C (`NSString`, `NSArray`, `NSDictionary`)?
 */
/*:
 - Experiment:
 What are the final values in the Swift arrays? What are final values in the Objective-C arrays?
 */
// Swift arrays
var swiftArray1 = [1,2,3,4]
var swiftArray2 = swiftArray1
swiftArray2.append(5)

// Objective-C arrays
var objectiveCArrray1 = NSMutableArray(array: [1,2,3,4])
var objectiveCArrray2 = objectiveCArrray1
objectiveCArrray2.add(5)

// Final Values:

swiftArray1
swiftArray2

objectiveCArrray1
objectiveCArrray2
/*:
 - Callout(Self-Reflection):
    * What capabilities are common between structs and classes?
    * What capabilities are different?
    * When would you choose to use a class over a struct and the other way around?
 */
/*: - Experiment:
  What happenss if you try to subclass a Struct?
 */

/*: - Experiment:
 Create a new instance of the resolution struct below. You will have to use the automatically-generated memberwise initializer `Resolution(width: ,height:)`. What happens if you change `struct` to `class`?
 */

struct Resolution {
  var width: Int
  var height: Int
}

let hd = Resolution(width: 1902, height: 1080)
// compile error: class Resolution has to initializer with width and height as parameters. 
