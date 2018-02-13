// W05D1 Reference vs Value Types in Swift: Part 1/2

import UIKit

// Reference Types:

class Dog {
    var wasFed = false
}

let dog = Dog()
let puppy = dog

puppy.wasFed = true

dog.wasFed   // true
puppy.wasFed // true


// Value Types:

var a = 42
var b = a
b += 1

a   // 42
b   // 43

struct Cat {
    var wasFed = false
}

var cat = Cat()
var kitty = cat
kitty.wasFed = true

cat.wasFed      // false
kitty.wasFed    // true

struct Point: CustomStringConvertible {
    var x: Float
    var y: Float
    
    var description: String {
        return "{x: \(x), y: \(y)}"
    }
}

extension Point: Equatable { }
func ==(lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

struct Shape {
    var center: Point
}

let initialPoint = Point(x: 0, y: 0)
var circle = Shape(center: initialPoint)
var square = Shape(center: initialPoint)
square.center.x = 5         // {x: 5.0, y: 0.0}
circle.center               // {x: 0.0, y: 0.0}


class Account {
    var balance = 0.0
}

class Person {
    let account: Account
    init(_ account: Account) {
        self.account = account
    }
}

let account = Account()

let person1 = Person(account)
let person2 = Person(account)

person2.account.balance += 100.0

person1.account.balance     // 100
person2.account.balance     // 100


