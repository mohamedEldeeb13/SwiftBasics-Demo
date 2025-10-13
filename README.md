# SwiftBasics-Demo
A complete Swift fundamentals demo project with code examples and explanations for every major language concept


🧮 Swift Operators Summary

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



