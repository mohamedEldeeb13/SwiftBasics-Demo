
import Foundation


//MARK: - 1️⃣ STRUCT -

// Struct = Value Type
// Used for simple data models that don’t need inheritance.
// When you assign or pass a struct, Swift copies it (each variable has its own copy).

struct UserStruct {
    var name: String
    var age: Int
}

// Example
var user1 = UserStruct(name: "Ali", age: 25)
var user2 = user1 // copied value
user2.name = "Omar"

print("user1 name: \(user1.name)") // Ali
print("user2 name: \(user2.name)") // Omar
// ✅ user1 didn’t change → Struct is VALUE TYPE (copied, not shared)





//MARK: - 2️⃣ CLASS -

// Class = Reference Type
// Used when you need inheritance, shared state, or identity.
// When you assign or pass a class instance, Swift copies the *reference* (both point to the same object).

class UserClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var c1 = UserClass(name: "Ali", age: 25)
var c2 = c1 // same reference
c2.name = "Omar"

print("c1 name: \(c1.name)") // Omar
print("c2 name: \(c2.name)") // Omar
// ⚠️ c1 changed because both point to the same object → Class is REFERENCE TYPE





//MARK: -  3️⃣ ACTOR -
// Actor = Reference Type (like a class) but THREAD-SAFE 🔒

//  💡 Why Actor?
// In multi-threaded code, multiple tasks may try to access or
// modify the same variable at the same time — causing a DATA RACE.
//
// ➤ Data race = when two or more threads access the same variable
//    simultaneously and at least one of them modifies it.
//
// 🧠 Actor solves this by isolating its data:
// - Only one task can access its internal state at a time.
// - Other tasks wait until the current one finishes.
// - You must use `await` to safely access or modify its properties.
//
// ---------------------------------------------
// 🧩 Example: Thread-safe user data update
// ---------------------------------------------

actor UserActor {
    var name: String
    var balance: Int
    
    init(name: String, balance: Int) {
        self.name = name
        self.balance = balance
    }
    
    // Safe update inside the actor
    func deposit(amount: Int) {
        balance += amount
        print("💰 \(name) new balance: \(balance)")
    }
    
    func withdraw(amount: Int) {
        if balance >= amount {
            balance -= amount
            print("💸 \(name) withdrew \(amount). Remaining: \(balance)")
        } else {
            print("⚠️ Not enough balance for \(name)")
        }
    }
    
    func getBalance() -> Int {
        return balance
    }
}

let sharedAccount = UserActor(name: "Ali", balance: 100)

// ---------------------------------------------
// ⚙️ Simulate parallel requests (concurrent access)
// ---------------------------------------------
// Two tasks try to modify the same balance AT THE SAME TIME.
// Without actor → DATA RACE ❌
// With actor → Swift ensures one runs after the other ✅

Task {
    // Task 1: Deposit
    await sharedAccount.deposit(amount: 50)
}

Task {
    // Task 2: Withdraw
    await sharedAccount.withdraw(amount: 30)
}

Task {
    // Task 3: Get final balance
    let final = await sharedAccount.getBalance()
    print("✅ Final balance safely: \(final)")
}

// ---------------------------------------------
// 🧩 Behind the scenes
// ---------------------------------------------
// When multiple Tasks call actor methods at once:
//  - Swift creates a queue for that actor.
//  - Each task’s access is serialized automatically.
//  - Only one function inside the actor runs at a time.
//  - Others wait until the current call completes.
// So no data races can ever happen on `balance`.
//
// ---------------------------------------------
// 📦 Notes
// ---------------------------------------------
// 🔸 Actor is a REFERENCE TYPE (like class).
// 🔸 Actor data stored on the HEAP.
// 🔸 Thread-safe automatically (no need for locks).
// 🔸 Must use `await` when calling its methods or reading vars.
//
// ✅ Summary
// - Struct → Fast & safe, but
