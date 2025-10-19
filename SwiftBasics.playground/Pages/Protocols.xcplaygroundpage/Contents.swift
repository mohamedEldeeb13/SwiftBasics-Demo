//===========================================================
//MARK:  🧩 Swift Protocols Playground
// A protocol defines a blueprint of methods, properties, and
// other requirements that suit a particular piece of functionality.

import Foundation

//===========================================================
// 1️⃣ Defining a Protocol

protocol Greetable {
    var name: String { get }
    func greet()
}

// Conforming to the protocol
struct Person: Greetable {
    var name: String
    func greet() {
        print("Hello, I'm \(name) 👋")
    }
}

let person = Person(name: "Mohamed")
person.greet()


//===========================================================
// 2️⃣ Property Requirements

// - `get` means read-only
// - `get set` means read/write required

protocol Vehicle {
    var brand: String { get }
    var currentSpeed: Double { get set }
    func accelerate()
}

struct Car: Vehicle {
    let brand: String
    var currentSpeed: Double = 0.0
    
    func accelerate() {
        print("\(brand) accelerating at \(currentSpeed) km/h 🚗💨")
    }
}

var car = Car(brand: "Toyota", currentSpeed: 80)
car.accelerate()


//===========================================================
// 3️⃣ Mutating Method Requirements

// Mutating methods can modify `self` inside structs/enums

protocol Togglable {
    mutating func toggle()
}

enum SwitchState: Togglable {
    case on, off
    
    mutating func toggle() {
        self = (self == .on) ? .off : .on
    }
}

var light = SwitchState.off
light.toggle()
print("Light is now: \(light) 💡")


//===========================================================
// 4️⃣ Initializer Requirements

protocol Initializable {
    init(value: Int)
}

class Example: Initializable {
    required init(value: Int) {
        print("Example initialized with \(value)")
    }
}

let ex = Example(value: 5)


//===========================================================
// 5️⃣ Protocol Inheritance

protocol Shape {
    var area: Double { get }
}

protocol ColoredShape: Shape {
    var color: String { get }
}

struct Circle: ColoredShape {
    var radius: Double
    var color: String
    var area: Double { .pi * radius * radius }
}

let circle = Circle(radius: 3, color: "Red")
print("Circle area: \(circle.area), color: \(circle.color) 🎨")


//===========================================================
// 6️⃣ Protocol Composition

// Combine multiple protocols temporarily with `&`

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

struct User: Named, Aged {
    var name: String
    var age: Int
}

func celebrateBirthday(of celebrator: Named & Aged) {
    print("🎂 Happy birthday, \(celebrator.name), now \(celebrator.age + 1)!")
}

let user = User(name: "Sara", age: 24)
celebrateBirthday(of: user)


//===========================================================
// 7️⃣ Protocol Extensions (Default Implementations)

protocol Describable {
    func describe()
}

extension Describable {
    func describe() {
        print("This is a describable type 🧱")
    }
}

struct Book: Describable {}
let b = Book()
b.describe()


//===========================================================
// 8️⃣ Protocols with Associated Types

// Associated type acts as a placeholder type within a protocol

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    var items = [Int]()
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    var count: Int { items.count }
    
    subscript(i: Int) -> Int {
        items[i]
    }
}

var stack = IntStack()
stack.append(10)
stack.append(20)
print("Stack count: \(stack.count), top: \(stack[1]) 📦")



//===========================================================
// 9️⃣ ❓ Protocol is value type or reference type ?
//===========================================================

// 🧠 Answer:
// A protocol itself is **not** a type like struct or class.
// It’s a **blueprint** — and it takes on the type of whatever
// conforms to it.

// ➤ If a struct conforms to a protocol → behaves as value type
// ➤ If a class conforms to a protocol → behaves as reference type

protocol ExampleProtocol {
    func showType()
}

struct ValueTypeStruct: ExampleProtocol {
    func showType() { print("I'm a struct ➡️ value type ✅") }
}

class ReferenceTypeClass: ExampleProtocol {
    func showType() { print("I'm a class ➡️ reference type 🔁") }
}

var value: ExampleProtocol = ValueTypeStruct()
var reference: ExampleProtocol = ReferenceTypeClass()

value.showType()
reference.showType()

// Let's verify copy behavior:
var a = ValueTypeStruct()
var bb = a // Copy (value type)
print("Struct copied independently ✅")

var c = ReferenceTypeClass()
var d = c // Reference (same object)
print("Class shares same instance 🔁")
