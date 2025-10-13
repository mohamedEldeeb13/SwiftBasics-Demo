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
