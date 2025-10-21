//===========================================================
//MARK: 🧩 Automatic Reference Counting (ARC)

// ARC automatically manages the memory of class instances in Swift.
// It tracks how many *strong references* exist for each instance.
// When the count reaches **zero**, the instance is *deallocated* and
// its `deinit` method runs.
//
// ARC only applies to **class** instances (reference types), not structs or enums.
//
//===========================================================

import Foundation


//===========================================================
// 1️⃣ ARC BASICS — Reference Counting


class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// Example: Strong references
var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "Alice")   // ARC count = 1
ref2 = ref1                    // ARC count = 2
ref3 = ref1                    // ARC count = 3

// ARC won’t free memory until all strong references are nil.
ref1 = nil                     // ARC count = 2
ref2 = nil                     // ARC count = 1
ref3 = nil                     // 💥 deinit runs here — ARC frees Alice


//===========================================================
// 2️⃣ STRONG REFERENCE CYCLES (Retain Cycles)

// When two class instances hold **strong references** to each other,
// their reference counts never reach zero → they stay in memory forever.


class Apartment {
    var tenant: PersonWithApartment?
    deinit { print("Apartment deinitialized") }
}

class PersonWithApartment {
    var name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    deinit { print("PersonWithApartment \(name) deinitialized") }
}

do {
    var john: PersonWithApartment? = PersonWithApartment(name: "John")
    var apt: Apartment? = Apartment()

    john!.apartment = apt       // apt ARC = 2 (held by john + variable)
    apt!.tenant = john          // john ARC = 2 (held by apt + variable)
    // 🔄 Strong reference cycle formed

    john = nil                  // john ARC = 1 (still held by apt)
    apt = nil                   // apt ARC = 1 (still held by john)
    // ❌ Neither deinit runs — retain cycle (memory leak)
}

/*
| Action                        | Person ARC | Apartment ARC | Notes                                                  |
| ----------------------------- | ----------- | --------------| ------------------------------------------------------- |
| After creation                | 1           | 1              | each held by variable                                  |
| After `john!.apartment = apt` | 1           | **2**          | strong ref from `john`                                 |
| After `apt!.tenant = john`    | **2**       | **2**          | cycle begins                                           |
| After `john = nil`            | 1           | 2              | still held by `apt.tenant`                             |
| After `apt = nil`             | 1           | 1              | both keep each other alive — ❌ memory leak             |
| Final state                   | ❌ not deinit | ❌ not deinit | trapped in memory due to retain cycle                  |
*/


//===========================================================
// 3️⃣ BREAKING RETAIN CYCLES — Weak & Unowned References

// 🔹 `weak` → does **not** increase ARC count; can become nil.
// 🔹 `unowned` → does **not** increase ARC count; never nil.
//
// Use `weak` when the reference may go away (e.g., parent-child).
// Use `unowned` when both objects have the same lifetime.



//------------------------------
// Weak Reference Example

class ApartmentWeak {
    weak var tenant: PersonWeak? // weak breaks the cycle
    deinit { print("ApartmentWeak deinitialized") }
}

class PersonWeak {
    var name: String
    var apartment: ApartmentWeak?
    init(name: String) { self.name = name }
    deinit { print("PersonWeak \(name) deinitialized") }
}

do {
    var john: PersonWeak? = PersonWeak(name: "John")
    var apt: ApartmentWeak? = ApartmentWeak()

    john!.apartment = apt
    apt!.tenant = john // weak reference ✅ no cycle

    john = nil  // 💥 PersonWeak deinit runs immediately
    apt = nil   // 💥 ApartmentWeak deinit runs
    // ✅ both released properly
}


//------------------------------
// Unowned Reference Example

class CreditCard {
    let number: UInt64
    unowned let customer: Customer // never becomes nil
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("CreditCard #\(number) deinitialized") }
}

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) { self.name = name }
    deinit { print("Customer \(name) deinitialized") }
}

do {
    var bob: Customer? = Customer(name: "Bob")
    bob!.card = CreditCard(number: 1234_5678_9012_3456, customer: bob!)
    bob = nil // ✅ both deinit properly
}


//===========================================================
// 4️⃣ STRONG REFERENCE CYCLES IN CLOSURES

// Closures are reference types too.
// If a class property holds a closure that captures `self` strongly,
// it can create a **retain cycle**.
//
// Example: self → closure → self


class HTMLElement {
    let name: String
    let text: String?

    // Closure property might capture self strongly ❌
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit { print("\(name) element deinitialized") }
}

do {
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello ARC")
    print(paragraph!.asHTML()) // works fine
    paragraph = nil            // ❌ deinit not called — retain cycle
}


//===========================================================
// 5️⃣ FIXING CLOSURE CYCLES — Capture Lists

// Capture lists let you explicitly control how values are captured.
// `[weak self]` → self becomes optional; may become nil.
// `[unowned self]` → self never nil; used when lifetime is linked.


class HTMLElementFixed {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit { print("\(name) element deinitialized ✅") }
}

do {
    var paragraph: HTMLElementFixed? = HTMLElementFixed(name: "p", text: "ARC works!")
    print(paragraph!.asHTML())
    paragraph = nil // ✅ deinit called properly
}
