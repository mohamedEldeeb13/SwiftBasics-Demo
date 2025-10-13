//  ControlFlow.playground
//  Created by Mohamed on 2025-10-13
//

import Foundation

//==================================================
// MARK: - 🧭 CONTROL FLOW IN SWIFT
//==================================================



//==================================================
// MARK: - 1️⃣ LOOPS (For-In, While, Repeat-While)
//==================================================

//--------------------------------------------------
// 🔹 For-In Loop
//--------------------------------------------------
// Used to iterate over sequences like arrays, ranges, dictionaries, etc.

let names = ["Ali", "Sara", "Omar"]

for name in names {
    print("Hello, \(name) 👋")
}

// Using ranges
for number in 1...5 {
    print("Number is \(number)")
}

// You can also ignore the loop variable using underscore:
for _ in 1...3 {
    print("Looping without using the variable")
}


//--------------------------------------------------
// 🔹 While Loop
//--------------------------------------------------
// Executes a block of code while the condition is true.

var countdown = 3
while countdown > 0 {
    print("Countdown: \(countdown)")
    countdown -= 1
}


//--------------------------------------------------
// 🔹 Repeat-While Loop
//--------------------------------------------------
// Similar to `while`, but it executes the block **at least once**.

var attempt = 1
repeat {
    print("Attempt \(attempt)")
    attempt += 1
} while attempt <= 3



//==================================================
// MARK: - 2️⃣ IF / ELSE IF / ELSE
//==================================================
// Used to execute different code blocks based on conditions.

let temperature = 30

if temperature > 35 {
    print("It's very hot 🥵")
} else if temperature > 25 {
    print("It's warm 🌤️")
} else if temperature > 15 {
    print("It's cool 🌥️")
} else {
    print("It's cold 🥶")
}

// You can combine multiple conditions using && (and) or || (or)
let isSunny = true
if temperature > 25 && isSunny {
    print("Perfect day for the beach 🏖️")
}



//==================================================
// MARK: - 3️⃣ SWITCH STATEMENTS
//==================================================
// Switch statements let you match a value against multiple cases.
// They must be exhaustive — all possible values must be handled.

let grade = "B"

switch grade {
case "A":
    print("Excellent 🎉")
case "B":
    print("Good 👍")
case "C":
    print("Average 😐")
case "D":
    print("Needs improvement 😬")
default:
    print("Invalid grade ❌")
}

// Matching numeric ranges
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



//==================================================
// MARK: - 4️⃣ CONTROL TRANSFER STATEMENTS
//==================================================
// These statements change the order in which code executes.
// Includes: continue, break, fallthrough, return, throw, and defer.


//--------------------------------------------------
// 🔸 continue
//--------------------------------------------------
// Skips the current iteration of a loop and moves to the next one.

for number in 1...5 {
    if number == 3 {
        print("Skipping 3 🙈")
        continue // skip printing 3
    }
    print("Number: \(number)")
}


//--------------------------------------------------
// 🔸 break
//--------------------------------------------------
// Immediately exits a loop or switch statement.

for number in 1...5 {
    if number == 4 {
        print("Breaking at 4 🚪")
        break
    }
    print("Number: \(number)")
}


//--------------------------------------------------
// 🔸 fallthrough
//--------------------------------------------------
// In a switch statement, moves execution to the next case
// even if it doesn’t match. Used intentionally to combine logic.

let letter = "a"

switch letter {
case "a":
    print("It's an A")
    fallthrough // continues to next case
case "b":
    print("Or maybe a B?")
default:
    print("Something else")
}


//--------------------------------------------------
// 🔸 return
//--------------------------------------------------
// Exits the current function immediately and optionally returns a value.

func doubleNumber(_ value: Int) -> Int {
    if value == 0 {
        print("Zero detected, returning early ❌")
        return 0 // early exit
    }
    return value * 2
}

print("Double 5 =", doubleNumber(5))
print("Double 0 =", doubleNumber(0))


//--------------------------------------------------
// 🔸 throw
//--------------------------------------------------
// Used to signal an error and exit from a function.
// The function must be marked with `throws`.

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


//--------------------------------------------------
// 🔸 defer
//--------------------------------------------------
// Executes code **just before leaving** the current scope
// (function, loop, or block), no matter how you exit (return or throw).
// Useful for cleanup tasks like closing files or releasing resources.

func fetchData() {
    print("Start fetching data...")
    defer {
        print("Cleaning up resources 🧹")
    }
    print("Processing data...")
    // return early or throw still calls the defer block
}

fetchData()
