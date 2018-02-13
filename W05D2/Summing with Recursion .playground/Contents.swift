//W05D2 Summing with Recursion

import UIKit

//func sumToOne(from number: Int) -> Int {
//    var sum = 0;
//    for i in 1 ... number {
//        sum += i
//    }
//    return sum
//}

//print(sumToOne(from: 4))


// base case n =1
//print(sumToOne(from: 1))
func sumToOne(from number: Int) -> Int {
    if (number == 1) {
        return 1;
    }
    
    return number + sumToOne(from: number-1)
}

print(sumToOne(from: 4))
