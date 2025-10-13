
//: # Basic Operators
//: Swift operators are divided by how many values (operands) they work with:
//: - **Unary** → 1 target
//: - **Binary** → 2 targets
//: - **Ternary** → 3 targets
//:
//: They can also be **prefix**, **infix**, or **postfix** based on position relative to their operands.

import Foundation

// MARK: - Arithmetic Operators (+, -, *, /, %)
let a = 12
let b = 5

print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Remainder:", a % b)


// MARK: - Unary Minus
let positive = 3
let negative = -positive
let truth = true
let inverted = !truth
print("Unary minus:", negative)
print("Unary NOT:", inverted)

// MARK: - Compound Assignment Operators (+=, -=, etc.) -
var score = 10
score += 5
score -= 2
score *= 3
score /= 2
print("Final Score:", score)

//MARK: - Binary Operators (two targets) -
print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Remainder:", a % b)

// Binary Comparison (==, !=, >, <, >=, <=)
print("Is a equal b?", a == b)
print("Is a greater than b?", a > b)
print("Is a less than or equal b?", a <= b)



// MARK: - Logical Operators (&&, ||, !)
let hasTicket = true
let isAdult = false

print("Can enter:", hasTicket && isAdult)
print("Either condition true:", hasTicket || isAdult)
print("Negation:", !isAdult)

// MARK: - Ternary Conditional Operator
let age = 18
let result = age >= 18 ? "Adult" : "Minor"
print("Age status:", result)


// MARK: - Range Operators -

// Closed range operator: a...b  (includes both ends)
print("Closed range 1...5:")
for number in 1...5 {
    print(number, terminator: " ")
}
print("\n")

// Half-open range operator: a..<b (includes lower bound, excludes upper)
print("Half-open range 1..<5:")
for number in 1..<5 {
    print(number, terminator: " ")
}
print("\n")

// One-sided ranges (e.g., array slicing)
let numbers = [10, 20, 30, 40, 50]
print("One-sided range from index 2 to end:", numbers[2...])
print("One-sided range up to index 3 (exclusive):", numbers[..<3])
