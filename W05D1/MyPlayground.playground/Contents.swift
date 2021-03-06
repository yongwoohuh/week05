// W05D1  Reference vs Value Types in Swift: Part 2/2

import UIKit

struct Address {
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
}

class Person {
    var name: String
    var address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}

// 1
let kingsLanding = Address(streetAddress: "1 King Way", city: "Kings Landing", state: "Westeros", postalCode: "12345")
let madKing = Person(name: "Aerys", address: kingsLanding)
let kingSlayer = Person(name: "Jaime", address: kingsLanding)

// 2
kingSlayer.address.streetAddress = "1 King Way Apt. 1"

// 3
madKing.address.streetAddress       // 1 King Way
kingSlayer.address.streetAddress    // 1 King Way Apt. 1


// Value Types Containing Reference Type Properties
struct Bill {
    let amount: Float
    private var _billedTo: Person
    
    // 1
    private var billedToForRead: Person {
        return _billedTo
    }
    
    
    private var billedToForWrite: Person {
        mutating get {
            if !isKnownUniquelyReferenced(&_billedTo) {
                print("Making a copy of _billedTo")
                _billedTo = Person(name: _billedTo.name, address: _billedTo.address)
            } else {
                print("Not making a copy of _billedTo")
            }
            return _billedTo
        }
    }
    
    init(amount: Float, billedTo: Person) {
        self.amount = amount
        _billedTo = Person(name: billedTo.name, address: billedTo.address)
    }
    
    // 2
    mutating func updateBilledToAddress(address: Address) {
        billedToForWrite.address = address
    }
    
    mutating func updateBilledToName(name: String) {
        billedToForWrite.name = name
    }
    
    // ... Methods to read billedForRead data
}


// 1
let billPayer = Person(name: "Robert", address: kingsLanding)

// 2
let bill = Bill(amount: 42.99, billedTo: billPayer)
let bill2 = bill

// 3
billPayer.name = "Bob"

/*
bill.billedTo.name = "Bob"
// Inspect values
bill.billedTo.name      // "Bob"
bill2.billedTo.name     // "Bob"
*/


var myBill = Bill(amount: 99.99, billedTo: billPayer)

myBill.updateBilledToName(name: "Eric") // Not making a copy of _billedTo

var billCopy = myBill
billCopy.updateBilledToName(name: "bill")

