//MARK: 🧩 Swift Initializers & Deinitializers

//MARK: - Initializer -
// ➤ An initializer is a special method that prepares a new instance of a class, struct, or enum for use.
// ➤ It ensures **all stored properties** have initial values before the object is used.
// ➤ Defined using the `init` keyword.


// ==========================================================
// 1️⃣ Simple Custom Initializer

struct User {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("✅ User \(name) initialized with age \(age)")
    }
}

let user = User(name: "Mohamed", age: 25)


// ==========================================================
// 2️⃣ Default Initializers

// ➤ Swift automatically provides a default initializer if
//    all stored properties have default values.

struct Point {
    var x = 0.0
    var y = 0.0
}

let p1 = Point()
let p2 = Point(x: 3.0, y: 5.0)
print("📍 Points:", p1, p2)


// ==========================================================
// 3️⃣ Memberwise Initializer (Struct Only)

// ➤ Swift automatically provides a *memberwise initializer* for structs.
// ➤ You can initialize properties directly by name.

struct Size {
    var width: Double
    var height: Double
}

let box = Size(width: 10, height: 5)
print("📦 Box size:", box)


// ==========================================================
// 4️⃣ Designated Initializer (Class Only)

// 🧠 Definition
// ➤ A **Designated Initializer** is the main initializer of a class.
// ➤ It ensures all stored properties are fully initialized before the class instance is ready.
// ➤ Every class must have at least one designated initializer (unless it inherits one).
// ➤ Designated initializers always call `super.init()` to initialize superclass properties.

class Vehicle {
    var wheels: Int
    
    // Designated initializer
    init(wheels: Int) {
        self.wheels = wheels
        print("🚘 Vehicle initialized with \(wheels) wheels")
    }
}

class Car: Vehicle {
    var brand: String
    
    // Designated initializer
    init(brand: String, wheels: Int) {
        self.brand = brand
        super.init(wheels: wheels)
        print("🚗 \(brand) car initialized (Designated)")
    }
}

let truck = Car(brand: "Truck", wheels: 6)


// ==========================================================
// 5️⃣ Convenience Initializer (Class Only)

// 🧠 Definition
// ➤ A **Convenience Initializer** is a *secondary initializer* that calls another initializer
//    in the same class (usually a designated one).
// ➤ Used to provide default values or simplify initialization calls.
// ➤ Must always call another initializer in the same class using `self.init(...)`
//    — it cannot call `super.init()` directly.

class Phone {
    var brand: String
    var model: String
    
    // Designated initializer
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
        print("📱 Phone initialized with brand: \(brand), model: \(model)")
    }
    
    // Convenience initializer
    convenience init(brand: String) {
        self.init(brand: brand, model: "Default")
        print("🛞 Convenience initializer used for \(brand)")
    }
}

let iphone = Phone(brand: "iPhone")
let samsung = Phone(brand: "Samsung", model: "S24")


// ==========================================================
// 6️⃣ Failable Initializer (init?)

// ➤ Used when initialization can fail (e.g., invalid input or missing data).

struct Product {
    let name: String
    let price: Double
    
    init?(name: String, price: Double) {
        if price < 0 { return nil }
        self.name = name
        self.price = price
        print("💰 Product \(name) created at price \(price)")
    }
}

if let valid = Product(name: "iPhone", price: 999) {
    print("✅ Product:", valid.name)
} else {
    print("❌ Failed to create product")
}

if let invalid = Product(name: "Error", price: -5) {
    print("✅ Product:", invalid.name)
} else {
    print("⚠️ Initialization failed due to negative price")
}


// ==========================================================
// 7️⃣ Required Initializer

// ➤ Ensures every subclass implements this initializer.

class Shape {
    required init() {
        print("🔺 Shape initialized")
    }
}

class Circle: Shape {
    var radius: Double = 0.0
    
    required init() {
        super.init()
        print("⚪️ Circle initialized")
    }
}

let c = Circle()


// ==========================================================
// 8️⃣ Initializer Delegation in Structs
//
// ➤ Structs can call their own initializers using `self.init(...)`.
// ➤ This helps reuse existing initialization logic instead of repeating code.

struct Rectangle {
    var width: Double
    var height: Double
    
    // 1️⃣ Main initializer
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    // 2️⃣ Secondary initializer (for creating a square)
    init(squareWithSide side: Double) {
        // ✅ This delegates to the main initializer
        // Instead of repeating: self.width = side, self.height = side
        self.init(width: side, height: side)
        print("🟥 Square initialized")
        
        // ❌ If we DID NOT use self.init(...)
        // We would have to manually assign all stored properties like this:
        // self.width = side
        // self.height = side
        // print("🟥 Square initialized")
    }
}

let square = Rectangle(squareWithSide: 6)



// ==========================================================
// 🧠 Definition: Deinitializer

// ➤ A **deinitializer** (`deinit`) runs just before a class instance is deallocated.
// ➤ Used for cleanup tasks (closing files, releasing memory, removing observers).
// ➤ Only classes can have a `deinit`.

class FileHandler {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
        print("📂 Opened file:", fileName)
    }
    
    func readFile() {
        print("📖 Reading file:", fileName)
    }
    
    deinit {
        print("🧹 Closing file:", fileName)
    }
}

do {
    let file = FileHandler(fileName: "data.txt")
    file.readFile()
} // When the scope ends, deinit is automatically called


// ==========================================================
// 🧠 Definition: Lazy Property

// ➤ A **lazy property** is initialized only when first accessed.
// ➤ Useful when initialization is expensive or not always needed.

class DataLoader {
    lazy var data: [Int] = loadData()
    
    func loadData() -> [Int] {
        print("📦 Loading data now...")
        return [1, 2, 3, 4, 5]
    }
}

let loader = DataLoader()
print("⏳ Accessing data for the first time...")
print(loader.data) // triggers lazy initialization
