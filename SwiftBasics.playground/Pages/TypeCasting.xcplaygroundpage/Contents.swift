// TypeCasting.playground.swift
// Swift playground covering type casting: `is`, `as`, `as?`, `as!`, Any, AnyObject
// Run this file in a Swift Playground (Xcode or Swift Playgrounds).

import Foundation

// =============================
// 1) Basic class hierarchy

class Animal {
    var name: String
    init(name: String) { self.name = name }
    func speak() { print("\(name) makes a sound") }
}

class Dog: Animal {
    var boneCount: Int
    init(name: String, boneCount: Int = 0) {
        self.boneCount = boneCount
        super.init(name: name)
    }
    override func speak() { print("\(name) says: Woof!") }
    func fetch() { print("\(name) fetched a bone. Total: \(boneCount)") }
}

class Cat: Animal {
    var lives: Int = 9
    override func speak() { print("\(name) says: Meow") }
}


// create instances
let animals: [Animal] = [Dog(name: "Rex", boneCount: 3), Cat(name: "Mittens"), Animal(name: "Generic")]


// =============================
// 2) `is` — type checking
// is for checking a is type dog is return true or false
for a in animals {
    if a is Dog {
        print("\(a.name) is a Dog")
    } else if a is Cat {
        print("\(a.name) is a Cat")
    } else {
        print("\(a.name) is some other Animal")
    }
}

// =============================
// 3) `as?` — conditional downcast (safe)
// can return nil

for a in animals {
    if let dog = a as? Dog {
        dog.fetch()
    } else if let cat = a as? Cat {
        print("\(cat.name) has \(cat.lives) lives")
    } else {
        print("\(a.name) cannot be cast to Dog or Cat")
    }
}

// =============================
// 4) `as!` — forced downcast (dangerous)
// Use only when you are 100% sure about the type. If wrong, it will crash.

let maybeDog = animals[0]
let forcedDog = maybeDog as! Dog
forcedDog.fetch()

// The following would crash if uncommented (because animals[2] is not a Dog):
// let crashDog = animals[2] as! Dog

// =============================
// 5) Upcasting with `as` (implicit)

let dog = Dog(name: "Buddy")
let upcasted: Animal = dog // implicit upcast to Animal
upcasted.speak() // calls Dog.speak() because of dynamic dispatch

// =============================
// 6) `Any` and `AnyObject`
// Any can hold any type, including value types (Int, String) and reference types

var miscellaneous: [Any] = [42, "hello", Dog(name: "Spot", boneCount: 1), 3.14]
for item in miscellaneous {
    switch item {
    case let x as Int:
        print("Int: \(x)")
    case let s as String:
        print("String: \(s)")
    case let d as Dog:
        print("Dog named \(d.name)")
    case is Double:
        print("Double encountered")
    default:
        print("Unknown type")
    }
}

// AnyObject holds class instances only (reference types)
var objectArray: [AnyObject] = [Dog(name: "Alpha") as AnyObject, NSDate()]
for o in objectArray {
    print("Object: \(type(of: o))")
}

// =============================
// 7) Casting collections

let mixed: [Any] = ["one", "two", 3, "four"]
// Attempt to cast to [String] — fails because of an Int element
let castToStrings = mixed as? [String]
print("castToStrings is nil? \(castToStrings == nil)")

// Better: use compactMap to extract only Strings
let onlyStrings = mixed.compactMap { $0 as? String }
print("onlyStrings: \(onlyStrings)")

// Casting [Animal] to [Dog] won't work directly. Use compactMap:
let dogs = animals.compactMap { $0 as? Dog }
print("Found \(dogs.count) dogs")

// =============================
// 8) Pattern matching in `switch` with type casts

for item in miscellaneous {
    switch item {
    case let n as Int where n > 10:
        print("Large Int: \(n)")
    case let n as Int:
        print("Small Int: \(n)")
    case let dog as Dog:
        print("Switch: Dog named \(dog.name)")
    case let s as String:
        print("Switch: String \(s)")
    default:
        print("Switch: other")
    }
}
