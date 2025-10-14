import Foundation
import UIKit

//MARK:  - Closure -
// Definition of Closure:
// A closure is a self-contained block of functionality that can be passed around and used in your code.


// ==========================
// 1️⃣ Basic Closure
let simpleClosure = {
    print("Hello from a closure!")
}

simpleClosure() // Call it


// ==========================
// 2️⃣ Closure with Parameters
let greetClosure: (String) -> Void = { name in
    print("Hello, \(name)!")
}

greetClosure("Mohamed")


// ==========================
// 3️⃣ Closure with Return Value
let addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}

let sum = addClosure(10, 5)
print("Sum:", sum)


// ==========================
// 4️⃣ Closure as a Function Parameter
// Functions can take closures as parameters
func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print("Result:", result)
}

performOperation(8, 2, operation: addClosure)
performOperation(8, 2, operation: { $0 * $1 }) // Using shorthand arguments


// ==========================
// 5️⃣ Trailing Closure Syntax
// If the last parameter of a function is a closure, you can use trailing closure syntax.
// Single-expression closures can omit the 'return' keyword.
performOperation(10, 3) { $0 - $1 }


// ==========================
// 6️⃣ Capturing Values
// Closures can capture constants and variables from the surrounding context.
// Here, the returned closure "remembers" the value of 'total' even after the function returns.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += amount
        return total
    }
    return incrementer
}

let incrementByFive = makeIncrementer(forIncrement: 5)
print(incrementByFive()) // 5
print(incrementByFive()) // 10
print(incrementByFive()) // 15

// ==========================
// 7️⃣ Closures Returning Closures
func makeMultiplier(_ factor: Int) -> (Int) -> Int {
    return { number in
        number * factor
    }
}

let multiplyByThree = makeMultiplier(3)
print(multiplyByThree(10)) // 30


// ==========================
// 8️⃣ Common Swift Collection Closures

let numbers = [1, 2, 3, 4, 5]

let doubled = numbers.map { $0 * 2 }
print("Doubled:", doubled)

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("Even numbers:", evenNumbers)

let totalSum = numbers.reduce(0) { $0 + $1 }
print("Total sum:", totalSum)

let sortedDescending = numbers.sorted { $0 > $1 }
print("Sorted descending:", sortedDescending)


// MARK: - Closure Types -

// ❓ Question: Are closures reference types?
// ✅ Answer: Yes. Closures in Swift are reference types.
// They can capture and store references to constants and variables from the surrounding context.
// When you assign a closure to another variable, both variables refer to the same closure instance and share captured values.

let alsoIncrement = incrementByFive
print(alsoIncrement()) // 20 — shares the same captured total with incrementByFive


// ==========================
// 1️⃣ Escaping Closures
// Escaping closures are closures that are called after the function they were passed to returns.
// You must mark them with @escaping. Commonly used in asynchronous operations, completion handlers, or stored closures.

var completionHandlers: [() -> Void] = []

@MainActor
func someFunctionWithEscapingClosure(completion: @escaping () -> Void) {
    completionHandlers.append(completion) // Store the closure to call later
}

someFunctionWithEscapingClosure {
    print("Escaping closure called later")
}

// Call all escaping closures
completionHandlers.forEach { $0() }


// ==========================
// 2️⃣ Non-Escaping Closures
// Non-escaping closures are executed within the scope of the function call.
// They are the default in Swift. No @escaping is needed.
// They cannot be stored for later use outside the function.

func someFunctionWithNonEscapingClosure(closure: () -> Void) {
    closure() // Executed immediately
}

someFunctionWithNonEscapingClosure {
    print("Non-escaping closure executed immediately")
}


// ==========================
// 3️⃣ Autoclosures
// Autoclosures automatically wrap an expression in a closure.
// They allow you to delay execution of an expression until it is used.
// Often used in assertion, logging, or conditional execution APIs.

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True!")
    } else {
        print("False!")
    }
}

logIfTrue(2 > 1) // Expression automatically wrapped in a closure
logIfTrue(3 < 2) // Expression automatically wrapped in a closure

