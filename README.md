# SwiftBasics-Demo
A complete Swift fundamentals demo project with code examples and explanations for every major language concept


 # 🧮 Swift Operators Summary

1. Arithmetic Operators  
Perform basic math on numeric values: +, -, *, /, %  
Used to perform basic mathematical operations.  
let a = 12     
let b = 5  
print(a + b) ---> 17  

  
2. Unary Operators  
Work on a single value (prefix or postfix):  
-a → Unary minus (negates the value)  
!a → Logical NOT (inverts the boolean value)  

  
3. Binary Operators  
Work on two values (infix operators).  
Examples:  
a + b   ---> Addition    
a - b   ---> Subtraction    
a * b   ---> Multiplication    
a / b   ---> Division    
a % b   ---> Remainder    


    Comparison Operators:  
    ==, !=, >, <, >=, <=  
    Used to compare two values and return a Boolean result.  

    
4. Compound Assignment Operators  
Combine operation and assignment in one step.  
Examples:  
+=, -=, *=, /=, %=  

    var score = 10   
    score += 5  ---> 15  
    score *= 2  ---> 30  
  
  
5. Logical Operators  
&&, ||, !  
Used to combine or modify Boolean values.  

    
6. Ternary Conditional Operator  
Short form of if...else.  
let age = 18  
let status = age >= 18 ? "Adult" : "Minor"  

    
7. Range Operators  
Used to define sequences of values.  

    Closed Range (a...b) → Includes both start and end.  
      . for i in 1...5 { print(i) } ---> 1 2 3 4 5  

    Half-Open Range (a..<b) → Includes start, excludes end.    
      . for i in 1..<5 { print(i) } ---> 1 2 3 4    

    One-Sided Ranges (a..., ..<b)  
      let numbers = [10, 20, 30, 40, 50]  
      print(numbers[2...])  ---> [30, 40, 50]  
      print(numbers[..<3])  ---> [10, 20, 30]
        
                
	                 
📘 Playground Page 	  
Name: Operators  
Purpose: Demonstrate all operator types with practical examples.  








 # 📚 Collection Types in Swift  
Swift provides three primary collection types: Arrays, Sets, and Dictionaries.  

          
1. Arrays  
  - Ordered collection of elements.  
  - Allows duplicates.  
  - Index-based access.  
  - Value type (copied when assigned or passed).  
  - Mutable if declared with var; immutable with let.  
    
    Example:  
    var numbers = [1, 2, 3]  
    numbers.append(4)       // Add element  
    numbers[0] = 10         // Update element  
    numbers.remove(at: 1)   // Remove element  
    print(numbers)          // [10, 3, 4]  
  
    Common methods:  
          append(), insert(), remove(at:), count, contains(), first, last, sorted(), reverse()  
  
  
  
2. Sets  
  - Unordered collection of unique elements.  
  - Fast lookup and set operations.  
  - Value type (copied on assignment).  
  - Mutable with var, immutable with let.  
  - Hashable requirement:  
      - A type must conform to the Hashable protocol to be stored in a set.  
      - This is because sets rely on hash values to ensure uniqueness and fast lookup.  
       
    Example:  
    var fruits: Set = ["Apple", "Banana", "Orange"]  
    fruits.insert("Mango")  
    fruits.remove("Banana")  
    print(fruits.contains("Apple")) // true  
  

3. Dictionaries  
  - Key-value pairs (keys must be unique).  
  - Unordered.  
  - Value type.  
  - Mutable with var; immutable with let.
     
    Example:  
    var person: [String: Any] = ["name": "Mohamed", "age": 30]  
    person["city"] = "Cairo"  
    person["age"] = 31   
    person.removeValue(forKey: "city")  
    print(person) ---> ["name": "Mohamed", "age": 31]


    


//MARK: -  Notes -

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
      
📊 Collection Types Comparison  
  
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

