import Foundation

// MARK: - 1. Arrays -

// Ordered, allows duplicates, index-based
// Mutable if declared with 'var', immutable with 'let'

// Mutable array
var numbers: [Int] = [1, 2, 3, 4]
numbers.append(5)          // Add element
numbers.insert(0, at: 0)   // Insert at specific index
numbers.remove(at: 2)      // Remove element at index
numbers[1] = 10            // Update element at index
print(numbers)             // [0, 10, 3, 4, 5]

// Immutable array
let constants: [String] = ["A", "B", "C"]
// constants.append("D") // ❌ Error: cannot modify let array

// Iterate over array
for number in numbers {
    print(number)
}

// Common methods
print(numbers.count)       // Number of elements
print(numbers.contains(4)) // Check existence
print(numbers.first)       // Optional first element
print(numbers.last)        // Optional last element
print(numbers.sorted())    // Sorted copy
numbers.reverse()          // Reverse in place



// MARK: - 2. Sets -

// Unordered, unique elements, no duplicates
// Very fast for lookup, union, intersection, etc.

var fruits: Set<String> = ["Apple", "Banana", "Orange"]
fruits.insert("Mango")     // Add element
fruits.remove("Banana")    // Remove element
print(fruits.contains("Apple")) // true
print(fruits)

// Set operations
let tropicalFruits: Set<String> = ["Mango", "Pineapple"]
let common = fruits.intersection(tropicalFruits) // Elements in both sets
let allFruits = fruits.union(tropicalFruits)     // All unique elements
let difference = fruits.subtracting(tropicalFruits) // Elements in fruits not in tropicalFruits
print(common, allFruits, difference)

// Iterate over set
for fruit in fruits {
    print(fruit)
}



// MARK: - 3. Dictionaries -

// Key-value pairs, unordered
// Keys must be unique
// Very useful for mapping data

// Mutable dictionary
var person: [String: Any] = [
    "name": "Mohamed",
    "age": 30
]

person["city"] = "Cairo"        // Add key-value
person["age"] = 31               // Update value
person.removeValue(forKey: "city") // Remove key-value
print(person)

// Access values safely
if let name = person["name"] as? String {
    print("Name is \(name)")
}

// Default value when key might not exist
let country = person["country", default: "Unknown"]
print(country) // Unknown

// Iterate over dictionary
for (key, value) in person {
    print("\(key): \(value)")
}

// Dictionary keys or values separately
for key in person.keys {
    print("Key: \(key)")
}
for value in person.values {
    print("Value: \(value)")
}
