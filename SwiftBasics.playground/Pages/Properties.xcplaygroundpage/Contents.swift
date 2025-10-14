import Foundation



//MARK: - Properties -

//Properties are values associated with a type (class, struct, or enum).
//They store or compute values that belong to instances or the type itself.


// ==========================================================
// 1️⃣ Stored Properties

struct Person {
    var name: String // Variable stored property
    let birthYear: Int // Constant stored property
}

var person = Person(name: "Mohamed", birthYear: 1998)
person.name = "Ali"
print("Stored Properties → Name: \(person.name), Birth: \(person.birthYear)")



// ==========================================================
// 2️⃣ Lazy Stored Properties
// A property that is not created until it’s first used — helpful when initialization is expensive.

struct DataLoader {
    var filename: String
    
    lazy var fileData: String = {
        print("   ⏳ Loading file...")
        return "📁 File content of \(filename)"
    }()
}

var loader = DataLoader(filename: "data.txt")
print("Lazy Stored Properties → Before accessing fileData")
print(loader.fileData) // Triggers loading
print("Lazy Stored Properties → After accessing fileData")



// ==========================================================
// 3️⃣ Computed Properties
// These don’t store a value — they calculate it each time it’s accessed.

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        return width * height
    }
}

let rect = Rectangle(width: 5, height: 10)
print("Computed Properties → Area: \(rect.area)")

// With get/set
struct Circle {
    var radius: Double
    var diameter: Double {
        get { radius * 2 }
        set { radius = newValue / 2 }
    }
}

var circle = Circle(radius: 4)
print("   Before → Radius: \(circle.radius), Diameter: \(circle.diameter)")
circle.diameter = 10
print("   After → Radius: \(circle.radius), Diameter: \(circle.diameter)")



// ==========================================================
// 4️⃣ Property Observers
// Run code before or after a stored property changes.
// willSet → called before change, didSet → after change.

class StepCounter {
    var steps: Int = 0 {
        willSet {
            print(" 🚶‍♂️ About to set steps to \(newValue)")
        }
        didSet {
            print(" ✅ Added \(steps - oldValue) steps (Now: \(steps))")
        }
    }
}

let counter = StepCounter()
print("Property Observers → Start counting")
counter.steps = 10
counter.steps = 25



// ==========================================================
// 5️⃣ Type Properties
// Belong to the type itself, not to an instance.
// Use static for structs/enums, and class (or static) for classes.

@MainActor
struct Student {
    static var schoolName = "Green School"
    var name: String
}

let s1 = Student(name: "Ali")
let s2 = Student(name: "Sara")
print("Type Properties → All students study at: \(Student.schoolName)")

Student.schoolName = "Blue Academy"
print("   Updated school name: \(Student.schoolName)")



// ==========================================================
// 6️⃣ Effect of Change (Value Type vs Reference Type)


struct ValueExample {
    var value: Int
}

class ReferenceExample {
    var value: Int
    init(value: Int) { self.value = value }
}

var v1 = ValueExample(value: 10)
var v2 = v1
v2.value = 99
print("7️⃣ Value Type → v1: \(v1.value), v2: \(v2.value)")

var r1 = ReferenceExample(value: 10)
var r2 = r1
r2.value = 99
print("7️⃣ Reference Type → r1: \(r1.value), r2: \(r2.value)")



// ==========================================================
// 7️⃣ Property Wrappers

// 💡 Description:
// Property Wrappers let you define reusable logic around how a property’s value
// is stored, validated, or transformed.
//
// 🔹 WHY USE THEM?
// When you have the same logic used in multiple properties (e.g., capitalizing names,
// clamping values to a range, trimming spaces, saving to UserDefaults, etc.),
// instead of repeating the same code again and again (like in didSet or get/set),
// you can define that logic ONCE in a @propertyWrapper and reuse it everywhere.
//
// 🔹 HOW THEY WORK:
// - You create a struct/class/enum marked with @propertyWrapper.
// - Inside, define a `wrappedValue` property that holds the real value.
// - When you apply @YourWrapper to a property, Swift automatically uses that wrapper.
//
// 🔹 BENEFIT:
// You write the rule once → reuse it across your app, keeping your code clean and DRY



@propertyWrapper
struct Capitalized {
    private var text: String = ""
    
    var wrappedValue: String {
        get { text }
        set { text = newValue.capitalized }
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

var user = User()
user.firstName = "mohamed"
user.lastName = "abd elhakam"
print("8️⃣ Property Wrapper → \(user.firstName) \(user.lastName)")
// Output: Mohamed Abd Elhakam


// Example 2: Wrapper with default value
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

var settings = GameSettings()
settings.volume = 150
print("   Clamped volume: \(settings.volume)") // 100
settings.volume = -5
print("   Clamped volume: \(settings.volume)") // 0

