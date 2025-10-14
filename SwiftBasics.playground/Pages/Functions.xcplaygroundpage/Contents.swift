import Foundation

// ==========================
// 1️⃣ Basic Function
func greet() {
    print("Hello, Swift!")
}

greet() // Call function

// ==========================
// 2️⃣ Function with Parameters

func greet(person: String) {
    print("Hello, \(person)!")
}

greet(person: "Mohamed")


// ==========================
// 3️⃣ Function with Multiple Parameters
// have more parameter
func greet(person: String, age: Int) {
    print("Hello \(person), you are \(age) years old!")
}

greet(person: "Mohamed", age: 25)


// ==========================
// 4️⃣ Function with Return Value

func add(a: Int, b: Int) -> Int {
    return a + b
}

let sum = add(a: 10, b: 5)
print("Sum: \(sum)")


// ==========================
// 5️⃣ Omitting Parameter Names (External vs Internal)
// 'a' has no external name (underscore _)
// 'b' has external name 'by'
func multiply(_ a: Int, by b: Int) -> Int {
    return a * b
}

let product = multiply(4, by: 5)
print("Product: \(product)")


// ==========================
// 6️⃣ Default Parameters

func greetWithDefault(name: String = "Guest") {
    print("Hello, \(name)!")
}

greetWithDefault()       // Hello, Guest!
greetWithDefault(name: "Ali") // Hello, Ali!


// ==========================
// 7️⃣ Variadic Parameters
//  accepts zero or more values of a specified type
func sumAll(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

let totalSum = sumAll(numbers: 1, 2, 3, 4, 5)
print("Total Sum: \(totalSum)")


// ==========================
// 8️⃣ Inout Parameters (modify value outside function)
// allows function to modify external variable
func increment(value: inout Int) {
    value += 1
}

var myNumber = 10
increment(value: &myNumber)
print("Incremented Number: \(myNumber)")


// ==========================
// 9️⃣ Functions Returning Multiple Values (Tuple)

func minMax(numbers: [Int]) -> (min: Int, max: Int)? {
    guard let first = numbers.first else { return nil }
    var minValue = first
    var maxValue = first
    
    for number in numbers {
        if number < minValue { minValue = number }
        if number > maxValue { maxValue = number }
    }
    return (minValue, maxValue)
}

if let result = minMax(numbers: [4, 7, 1, 9, 2]) {
    print("Min: \(result.min), Max: \(result.max)")
}


// ==========================
// 🔟 Nested Functions

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int { return input + 1 }
    func stepBackward(_ input: Int) -> Int { return input - 1 }
    
    return backward ? stepBackward : stepForward
}

let step = chooseStepFunction(backward: true)
print(step(10)) // 9


// ==========================
// 1️⃣1️⃣ Function Types & Assigning Functions
func square(number: Int) -> Int { number * number }
var mathFunction: (Int) -> Int = square
print(mathFunction(5)) // 25


// ==========================
// 1️⃣2️⃣ Functions as Parameters

func printResult(of operation: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(operation(a, b))")
}

printResult(of: add, a: 3, b: 7)


// ==========================
// 1️⃣3️⃣ Functions Returning Functions
func makeAdder(x: Int) -> (Int) -> Int {
    return { y in x + y }
}

let addFive = makeAdder(x: 5)
print(addFive(10)) // 15

