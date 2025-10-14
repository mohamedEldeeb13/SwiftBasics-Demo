# SwiftBasics-Demo
A complete Swift fundamentals demo project with code examples and explanations for every major language concept


 # 🧮 Swift Operators Summary

## 1- Arithmetic Operators  
Perform basic math on numeric values: +, -, *, /, %  
Used to perform basic mathematical operations.

```swift
let a = 12     
let b = 5  
print(a + b) ---> 17
```  
## 2- Unary Operators  
Work on a single value (prefix or postfix):  
-a → Unary minus (negates the value)  
!a → Logical NOT (inverts the boolean value)  

  
## 3- Binary Operators  
Work on two values (infix operators).  
Examples:

```swift
a + b   // Addition    
a - b   // Subtraction    
a * b   // Multiplication    
a / b   // Division    
a % b   // Remainder    
```

 Comparison Operators:  	
 ==, !=, >, <, >=, <= 	  
 Used to compare two values and return a Boolean result.  	

    
## 4- Compound Assignment Operators  
Combine operation and assignment in one step.  
Examples:  
+=, -=, *=, /=, %=  
	
```swift
var score = 10
score += 5  // 15  
score *= 2  // 30  
 ``` 
  
## 5- Logical Operators  
&&, ||, !  
Used to combine or modify Boolean values.  

    
## 6- Ternary Conditional Operator  
Short form of if...else.

```swift
let age = 18  
let status = age >= 18 ? "Adult" : "Minor"  
```
    
## 7- Range Operators  
Used to define sequences of values.  

Closed Range (a...b) → Includes both start and end.  

```swift
 for i in 1...5 { print(i) } // 1 2 3 4 5  
```

Half-Open Range (a..<b) → Includes start, excludes end. 
```swift
 for i in 1..<5 { print(i) } // 1 2 3 4 5  
```
 
One-Sided Ranges (a..., ..<b) 

```swift
let numbers = [10, 20, 30, 40, 50]
print(numbers[2...])  // [30, 40, 50]  
print(numbers[..<3])  // [10, 20, 30]
```
	

<br><br><br><br>


 # 📚 Collection Types in Swift  
Swift provides three primary collection types: Arrays, Sets, and Dictionaries.  
---

          
## 1- Arrays  
  - Ordered collection of elements.  
  - Allows duplicates.  
  - Index-based access.  
  - Value type (copied when assigned or passed).  
  - Mutable if declared with var; immutable with let.  
    
    Example:
    ```swift 
    var numbers = [1, 2, 3]  
    numbers.append(4)       // Add element  
    numbers[0] = 10         // Update element  
    numbers.remove(at: 1)   // Remove element  
    print(numbers)          // [10, 3, 4]  
  	```
	 Common methods:  
          append(), insert(), remove(at:), count, contains(), first, last, sorted(), reverse()  
  
  
  
## 2- Sets  
  - Unordered collection of unique elements.  
  - Fast lookup and set operations.  
  - Value type (copied on assignment).  
  - Mutable with var, immutable with let.  
  - Hashable requirement:  
      - A type must conform to the Hashable protocol to be stored in a set.  
      - This is because sets rely on hash values to ensure uniqueness and fast lookup.  
       
    Example:
    ```swift 
    var fruits: Set = ["Apple", "Banana", "Orange"]  
    fruits.insert("Mango")  
    fruits.remove("Banana")  
    print(fruits.contains("Apple")) // true  
  	``` 

## 3- Dictionaries  
  - Key-value pairs (keys must be unique).  
  - Unordered.  
  - Value type.  
  - Mutable with var; immutable with let.
     
    Example:
    ```swift 
    var person: [String: Any] = ["name": "Mohamed", "age": 30]  
    person["city"] = "Cairo"  
    person["age"] = 31   
    person.removeValue(forKey: "city")  
    print(person) // ["name": "Mohamed", "age": 31]
	``` 

    


### Notes :-

Access & Iteration  
  - Swift collections (Arrays, Sets, Dictionaries) can be iterated using a for-in loop.  
  - Arrays can also be accessed by index.  
  - Dictionaries can be accessed by key, with optional default values if the key doesn’t exist.  
  - Sets are unordered, so elements can only be accessed by iteration.
      
💡 Key point:  
  - Arrays are index-based and ordered → good for sequential access.  
  - All collections support iteration, but the method of access depends on the type:  
  - Array: indices + iteration  
  - Set: iteration only  
  - Dictionary: keys, values, or key-value pairs  
  - All three are value types in Swift (copy-on-write).  
      
### 📊Collection Types Comparison  
  
  | Feature / Type           | Array               | Set                                       | Dictionary                               |
| ------------------------ | ------------------- | ----------------------------------------- | ---------------------------------------- |
| **Order**                | Ordered             | Unordered                                 | Unordered                                |
| **Duplicates**           | Allowed             | Not allowed (unique)                      | Keys must be unique                      |
| **Access by Index**      | ✅ Yes               | ❌ No                                      | ❌ No                                     |
| **Iteration**            | ✅ Yes (for-in loop) | ✅ Yes (for-in loop)                       | ✅ Yes (for-in loop over key-value pairs) |
| **Key-Value**            | ❌ No                | ❌ No                                      | ✅ Yes                                    |
| **Value Type**           | ✅ Yes (struct)      | ✅ Yes (struct)                            | ✅ Yes (struct)                           |
| **Mutable with var**     | ✅ Yes               | ✅ Yes                                     | ✅ Yes                                    |
| **Immutable with let**   | ✅ Yes               | ✅ Yes                                     | ✅ Yes                                    |
| **Hashable requirement** | ❌ No                | ✅ Yes (elements must conform to Hashable) | ✅ Yes (keys must conform to Hashable)    |
| **Allows fast lookup**   | ❌ Linear search     | ✅ Constant/near-constant                  | ✅ Constant/near-constant for keys        |

<br><br><br><br>

# 🧭 Swift Control Flow Playground

A complete walkthrough of **Swift Control Flow** concepts — with clear code examples and explanations.  
This Playground is designed for hands-on learning and testing each control flow structure in Swift.

---

## 1️⃣ Loops

### **For-In Loop**
Used to iterate over arrays, ranges, or dictionaries.

```swift
for name in ["Ali", "Sara", "Omar"] {
    print("Hello, \(name) 👋")
}
```
<br>

### **While-In Loop**
Executes a block while a condition is true.

```swift
var count = 3
while count > 0 {
    print("Countdown: \(count)")
    count -= 1
}
```
<br>

### **Repeat-While-In Loop**
Always runs the code at least once before checking the condition.

```swift
var attempt = 1
repeat {
    print("Attempt \(attempt)")
    attempt += 1
} while attempt <= 3
```

<br><br>

## 2️⃣ If / Else If / Else
Used to run code based on conditions.
```swift
let temperature = 30

if temperature > 35 {
    print("It's very hot 🥵")
} else if temperature > 25 {
    print("It's warm 🌤️")
} else {
    print("It's cold 🥶")
}
```
<br><br>

## 3️⃣ Switch Statements
Powerful conditional branching.
Every possible value must be handled (exhaustive).
```swift
let score = 87

switch score {
case 90...100:
    print("A grade")
case 80..<90:
    print("B grade")
case 70..<80:
    print("C grade")
default:
    print("Fail 😔")
}
```
Supports:
- Value matching
- Range matching
- Tuple matching
- where conditions
  You can use where inside a switch case to add a filtering condition.
  ```swift
  let number = 7

	switch number {
	case let x where x % 2 == 0:
    	print("\(x) is even")
	case let x where x % 2 != 0:
    	print("\(x) is odd")
	default:
  	  break
	}

  let numbers = [1, 2, 3, 4, 5, 6]

	for n in numbers where n % 2 == 0 {
   	 print("Even number: \(n)")
	}
	```
  
<br><br>

## ⚙️ 4️⃣ Control Transfer Statements

<br>

| Keyword       | Purpose             | Description                                  |
| ------------- | ------------------- | -------------------------------------------- |
| `continue`    | Skip iteration      | Skips current loop cycle and continues       |
| `break`       | Stop execution      | Exits loop or switch immediately             |
| `fallthrough` | Continue next case  | Forces next case to execute in switch        |
| `return`      | Exit function       | Ends function and optionally returns a value |
| `throw`       | Signal error        | Stops function and throws an error           |
| `defer`       | Cleanup before exit | Runs code before scope exits (even on error) |

<br>

### continue	
Skips the current iteration of a loop and moves directly to the next one.

```swift
	for number in 1...5 {
  	 	 if number == 3 {
     	   print("Skipping 3 🙈")
     	   continue
    	}
    	print("Number: \(number)")
	}
```
<br>

### break	
Immediately exits a loop or switch statement.

```swift
	for number in 1...5 {
    if number == 4 {
        print("Breaking at 4 🚪")
        break
    }
    print("Number: \(number)")
}
```
<br>

### fallthrough	
In a switch, this continues execution to the next case, even if it doesn’t match.

```swift
	let letter = "a"

switch letter {
case "a":
    print("It's an A")
    fallthrough
case "b":
    print("Or maybe a B?")
default:
    print("Something else")
}
```
<br>

### return	
Exits a function and optionally returns a value.

```swift
	func doubleNumber(_ value: Int) -> Int {
    if value == 0 {
        print("Zero detected, returning early ❌")
        return 0
    }
    return value * 2
}

print("Double 5 =", doubleNumber(5))
```

<br>

### throw	
Used to signal an error and exit a throwing function.
The function must be marked with throws.

```swift
	enum LoginError: Error {
    case invalidUser
    case wrongPassword
}

func login(user: String, password: String) throws {
    guard user == "admin" else { throw LoginError.invalidUser }
    guard password == "1234" else { throw LoginError.wrongPassword }
    print("Login successful 🎉")
}

do {
    try login(user: "admin", password: "1234")
    try login(user: "user", password: "0000")
} catch {
    print("Login failed: \(error)")
}
```

<br>

### defer	
Executes code right before exiting the current scope (function, loop, or block),
no matter how you exit — via return, throw, or natural end.

```swift
	func fetchData() {
    print("Start fetching data...")
    defer {
        print("Cleaning up resources 🧹")
    }
    print("Processing data...")
    // defer block will always run last
}

fetchData()
```
<br>

#### 💡 defer is ideal for cleanup tasks like:
- Closing files or network connections
- Releasing resources
- Printing final logs

<br><br><br><br>

# 📘 Swift Functions Playground
Functions are self-contained chunks of code that perform a specific task.

<br>

## 1️⃣ Basic Function
A simple function with no parameters or return value:
```swift
func greet() {
	print("Hello, Swift!")
}
```
<br>

## 2️⃣ Function with Parameters
Pass data into functions:
```swift
func greet(person: String) {
	print("Hello, \(person)!")
}
```
<br>

## 3️⃣ Multiple Parameters
Functions can have multiple inputs:
```swift
func greet(person: String, age: Int) {
	print("Hello \(person), you are \(age) years old!")
}
```
<br>

## 4️⃣ Function with Return Value
Functions can return a value:
```swift
func add(a: Int, b: Int) -> Int {
	return a + b
}
```
<br>

## 5️⃣ External & Internal Parameter Names
Control how parameters are used inside and outside the function:
```swift
	func multiply(_ a: Int, by b: Int) -> Int { ... }
```
<br>

## 6️⃣ Default Parameters
Provide default values for parameters:
```swift
	func greetWithDefault(name: String = "Guest") { ... }
```
<br>

## 7️⃣ Variadic Parameters
Accept multiple values of the same type:
```swift
	func sumAll(numbers: Int...) -> Int { ... }
```
<br>

## 8️⃣ Inout Parameters
Allow modification of external variables:
```swift
	func increment(value: inout Int) { ... }
```
<br>

## 9️⃣ Functions Returning Multiple Values
Use tuples to return multiple results:
```swift
	func minMax(numbers: [Int]) -> (min: Int, max: Int)? { ... }
```
<br>

## 🔟 Nested Functions
Functions can be defined inside other functions:
```swift
	func chooseStepFunction(backward: Bool) -> (Int) -> Int { ... }
```
<br>

## 1️⃣1️⃣ Functions as Parameters
Pass functions as arguments to other functions:
```swift
	func printResult(of operation: (Int, Int) -> Int, a: Int, b: Int) { ... }
```
<br>

## 1️⃣2️⃣ Functions Returning Functions
Return functions from functions:
```swift
	func makeAdder(x: Int) -> (Int) -> Int { ... }
```
<br><br><br><br>


# 🧩 Closure
- A closure is a self-contained block of functionality that can be passed around and used in your code.
- Closures can capture and store references to constants and variables from the context in which they are defined.

<br><br>

## 1️⃣ Basic Closure
A simple closure with no parameters and no return value.
```swift
let simpleClosure = {
	 print("Hello from a closure!")
}
simpleClosure()
```
<br>

## 2️⃣ Closure with Parameters
A closure that accepts parameters.
```swift
let greetClosure: (String) -> Void = { name in
    print("Hello, \(name)!")
}
greetClosure("Mohamed")
```
<br>

## 3️⃣ Closure with Return Value
A closure that takes parameters and returns a value.
```swift
let addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
let sum = addClosure(10, 5)
print("Sum:", sum)
```
<br>

## 4️⃣ Closure as a Function Parameter
Passing a closure as a parameter to a function.
```swift
func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print("Result:", result)
}
performOperation(8, 2, operation: addClosure)
performOperation(8, 2, operation: { $0 * $1 })
```
<br>

## 5️⃣ Trailing Closure Syntax
- If the last parameter of a function is a closure, you can use trailing closure syntax, Using trailing closure syntax for cleaner code
- Single-expression closures can omit the 'return' keyword.
```swift
func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print("Result:", result)
}
performOperation(10, 3) { $0 - $1 }
```
<br>

## 6️⃣ Capturing Values
- Closures can capture constants and variables from the surrounding context.	
- Here, the returned closure "remembers" the value of 'total' even after the function returns.
```swift
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
```
<br>

## 7️⃣ Closures Returning Closures
A closure that returns another closure, allowing dynamic behavior.
```swift
func makeMultiplier(_ factor: Int) -> (Int) -> Int {
    return { number in number * factor }
}
let multiplyByThree = makeMultiplier(3)
print(multiplyByThree(10)) // 30
```
<br>

## 8️⃣ Trailing Closure Syntax
If the last parameter of a function is a closure, you can use trailing closure syntax, Using trailing closure syntax for cleaner code
// Single-expression closures can omit the 'return' keyword.
```swift
func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print("Result:", result)
}
performOperation(10, 3) { $0 - $1 }
```
<br>

## 🔹 Closure Types
### Are closures reference types?
- ✅ Yes. Closures in Swift are reference types — they capture and store values from their surrounding context.	
- Assigning a closure to another variable shares the same captured values.

<br><br>

## 1️⃣ Escaping Closures
Called after the function returns. Useful for async operations and completion handlers.
```swift
var completionHandlers: [() -> Void] = []

@MainActor
func someFunctionWithEscapingClosure(completion: @escaping () -> Void) {
    completionHandlers.append(completion)
}

someFunctionWithEscapingClosure {
    print("Escaping closure called later")
}

completionHandlers.forEach { $0() }
```
<br>

## 2️⃣ Non-Escaping Closures
Executed within the function scope. Default in Swift. Cannot be stored for later use.
```swift
func someFunctionWithNonEscapingClosure(closure: () -> Void) {
    closure()
}

someFunctionWithNonEscapingClosure {
    print("Non-escaping closure executed immediately")
}
```
<br>

## 3️⃣ Autoclosures
Automatically wraps an expression in a closure, delaying its execution until needed.
```swift
func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() { print("True!") } else { print("False!") }
}

logIfTrue(2 > 1)
logIfTrue(3 < 2)
```
<br><br><br><br>

# 🧭 Enums
An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

<br><br>

## 1️⃣Basic enum
Enums define a group of related values in a type-safe way.
```swift
enum CompassPoint {
    case north, south, east, west
}
```
<br>

## 2️⃣ Enum with raw values
- Raw values give each case a constant underlying value.
- Can be of type Int, String, Double, etc.
```swift
enum HTTPStatus: Int {
    case ok = 200
    case created = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
}
let status = HTTPStatus(rawValue: 200)
print("HTTPStatus from raw value 200 →", String(describing: status))
```
<br>

## 3️⃣CaseIterable — Iterate All Cases
CaseIterable allows looping through all enum cases using `allCases`.
```swift
enum Planet: CaseIterable {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

for p in Planet.allCases {
    print("Planet:", p)
}
```
<br>

## 4️⃣ Associated Values
- Enums can store associated data for each case.
- This lets you attach extra information per case.
```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```
<br>

## 5️⃣ Enums with Methods & Computed Properties
Enums can have functions and computed properties to add logic.
```swift
enum Suit: String {
    case hearts, diamonds, clubs, spades

    var color: String {
        switch self {
        case .hearts, .diamonds: return "red"
        case .clubs, .spades: return "black"
        }
    }

    func symbol() -> String {
        switch self {
        case .hearts: return "♥︎"
        case .diamonds: return "♦︎"
        case .clubs: return "♣︎"
        case .spades: return "♠︎"
        }
    }
}
```
<br>

## 6️⃣ Mutating Methods
- Enums are value types (like structs).
- Use `mutating` to modify `self` inside enum methods.
```swift
enum LightSwitch {
    case on, off

    mutating func toggle() {
        self = (self == .on) ? .off : .on
    }
}

var bulb = LightSwitch.off
bulb.toggle()
```
<br>

## 7️⃣ Pattern Matching & Where Clause
Use `switch` with associated values, bindings, and conditions.
```swift
enum Measurement {
    case weight(Double)
    case length(Double)
    case unknown
}

let m = Measurement.weight(65.0)

switch m {
case .weight(let kg) where kg > 50:
    print("Heavy weight:", kg, "kg")
case .weight(let kg):
    print("Weight:", kg, "kg")
case .length(let cm):
    print("Length:", cm, "cm")
case .unknown:
    print("Unknown measurement")
}
```
<br><br><br><br>


# 🧱 Struct - Class - actor 

<br><br>

# 1️⃣ Struct — Value Type
- A Struct is a Value Type that is copied when passed around.
- Each variable has its own independent copy.
```swift
struct UserStruct {
    var name: String
    var age: Int
}

var user1 = UserStruct(name: "Ali", age: 25)
var user2 = user1 // copied value
user2.name = "Omar"

print(user1.name) // Ali
print(user2.name) // Omar
```

<br><br>

# 2️⃣ Class — Reference Type
- A Class is a Reference Type — variables share the same instance.
- Both references point to one object in Heap memory.
```swift
class UserClass {
    var name: String
    init(name: String) { self.name = name }
}

var c1 = UserClass(name: "Ali")
var c2 = c1
c2.name = "Omar"

print(c1.name) // Omar
print(c2.name) // Omar
```

<br><br>

# 3️⃣ Actor — Safe Reference Type (Swift Concurrency)
- An Actor is a Reference Type like a class,
- but it’s thread-safe — no data races.
- Only one task can access its data at a time.
- Other tasks wait until the current one finishes.
```swift
actor UserActor {
    var balance = 100
    
    func deposit(amount: Int) {
        balance += amount
        print("💰 New balance: \(balance)")
    }
    
    func withdraw(amount: Int) {
        balance -= amount
        print("💸 Withdraw, remaining: \(balance)")
    }
}

let sharedAccount = UserActor()

Task { await sharedAccount.deposit(amount: 50) }
Task { await sharedAccount.withdraw(amount: 30) }
Task {
    print("✅ Final balance:", await sharedAccount.balance)
}
```
<br><br>

## 💡 Struct vs Class vs Actor

<br>

| Feature       |    Struct    |     Class    |        Actor       |
| ------------- | :----------: | :----------: | :----------------: |
| Type          |     Value    |   Reference  |      Reference     |
| Memory        |     Stack    |     Heap     |        Heap        |
| Copy Behavior |    Copied    |    Shared    |  Shared (isolated) |
| Inheritance   |       ❌      |       ✅      |          ❌         |
| Thread Safety |       ✅      |       ❌      |          ✅         |
| Performance   |    ⚡ Fast    |   🐢 Medium  | 🐢 Safe but slower |
| Use For       | Models, data | Shared logic | Async shared state |

<br><br>

## Value Type vs Reference Type

<br>

| Concept                                     | Value Type                                 | Reference Type                             |
| ------------------------------------------- | ------------------------------------------ | ------------------------------------------ |
| **Storage**                                 | 🧮 Stack                                   | 📦 Heap                                    |
| **Copy behavior**                           | Creates new independent copy               | Shares the same instance                   |
| **Thread safety**                           | ✅ Safe (no shared data)                    | ⚠️ Not safe (use `actor` for safety)       |
| **Effect on other variables when modified** | ❌ Change in one **does NOT** affect others | ✅ Change in one **affects all** references |
| **Examples**                                | `Struct`, `Enum`, `Tuple`                  | `Class`, `Actor`, `Closure`                |

<br>

### 💡 Explanation:
- When you assign a Value Type, Swift creates a copy → changes in one variable don’t affect another.
- When you assign a Reference Type, Swift just copies the reference (pointer) → both variables point to the same object.

<br><br><br><br>


# 🧱 Properties 
- Properties are values associated with a type (struct, class, or enum).  
- They store or compute data that belongs to that instance or the type itself.


## 1️⃣ Stored Properties
Store constant or variable values inside a type.
```swift
struct Car {
    var brand: String
    var speed: Int
}
```
<br>

## 2️⃣ Lazy Stored Properties
- Initialized only when accessed for the first time.
- Useful for expensive operations.
```swift
struct DataLoader {
    var filename: String
    
    lazy var fileData: String = {
        print("Loading...")
        return "File content of \(filename)"
    }()
}
```
<br>

## 3️⃣ Computed Properties
They don’t store data — they calculate it dynamically.
```swift
struct Rectangle {
    var width: Double
    var height: Double
    var area: Double { width * height }
}

// OR

struct Circle {
    var radius: Double
    var diameter: Double {
        get { radius * 2 }
        set { radius = newValue / 2 }
    }
}

```
<br>

## 4️⃣ Property Observers
Run code before or after a property changes using willSet and didSet.
```swift
class StepCounter {
    var steps: Int = 0 {
        willSet { print("About to set steps to \(newValue)") }
        didSet { print("Added \(steps - oldValue) steps") }
    }
}
```
<br>

## 5️⃣ Type Properties
Belong to the type itself, not an instance.
```swift
struct Student {
    static var schoolName = "Green School"
    var name: String
}
```
<br>

## 6️⃣ Property Wrappers
###💡 Definition
- A property wrapper defines reusable logic for how a property’s value is stored, validated, or transformed.
- Instead of repeating the same didSet or get/set logic everywhere,
- you can define it once and apply it using @YourWrapper.
```swift
@propertyWrapper
struct Capitalized {
    private var text = ""
    var wrappedValue: String {
        get { text }
        set { text = newValue.capitalized }
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

//EXAMPLE 2

@propertyWrapper
struct Clamped<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>
    
    var wrappedValue: Value {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
    
    init(wrappedValue initialValue: Value, _ range: ClosedRange<Value>) {
        self.value = min(max(range.lowerBound, initialValue), range.upperBound)
        self.range = range
    }
}

struct GameSettings {
    @Clamped(0...100) var volume: Int = 50
}

```
<br>

## 7️⃣ Effect of Change (Value Type vs Reference Type)

| Type               | Behavior                              | Example        |
| ------------------ | ------------------------------------- | -------------- |
| **Value Type**     | Each copy is independent              | Structs, Enums |
| **Reference Type** | All references point to same instance | Classes        |

```swift
struct ValueExample { var value = 10 }
class ReferenceExample { var value = 10 }

var v1 = ValueExample()
var v2 = v1
v2.value = 99 // only v2 changed

var r1 = ReferenceExample()
var r2 = r1
r2.value = 99 // both r1 and r2 changed
```
<br><br><br><br>

# 🧩 Methods

<br><br>

## 1️⃣ Simple Instance Methods
An **instance method** belongs to a specific object (instance) of a class, struct, or enum. It can access and modify the properties of that instance.

```swift
class Greeter {
    let prefix: String
    init(prefix: String = "Hello") {
        self.prefix = prefix
    }

    func greet(name: String) {
        print("\(prefix), \(name)!")
    }
}

let g = Greeter()
g.greet(name: "Mohamed")
```

## 2️⃣ Methods with Return Values, Default Parameters, and `inout`
A method can return a value, have **default parameters**, and even take `inout` parameters to modify passed variables directly.

```swift
struct Counter {
    private(set) var count: Int = 0

    mutating func increment(by value: Int = 1) -> Int {
        count += value
        return count
    }

    func doubled(_ x: inout Int) {
        x *= 2
    }
}

var c = Counter()
print("after increment: \(c.increment())")
print("after increment by 5: \(c.increment(by: 5))")

var num = 3
c.doubled(&num)
print("num after doubled: \(num)")
```

**Notes:**
- `mutating` keyword allows a struct or enum method to modify its own properties.
- `inout` allows the caller’s variable to be changed by the method.

---

## 3️⃣ Mutating & Static Methods on Value Types
- **Mutating methods** modify a struct or enum’s internal state.
- **Static methods** belong to the type itself (not an instance). They’re useful for general utilities or shared logic.

```swift
struct Toggle {
    private(set) var isOn: Bool = false
    
    mutating func toggle() {
        isOn.toggle()
    }
    
    // static method — belongs to the struct itself
    static func description() -> String {
        return "Toggle is a simple struct with an on/off state."
    }
}

var t = Toggle()
t.toggle()
print("toggle isOn: \(t.isOn)")
print(Toggle.description())
```
**Notes:**
- Call static methods directly using the type name, e.g. `Toggle.description()`.
- Static methods **cannot access instance properties** because they do not belong to a specific instance.

<br><br><br><br>



