

//MARK: - Methods -


// 1️⃣ Simple Instance Methods
class Greeter {
    let prefix: String
    init(prefix: String = "Hello") {
        self.prefix = prefix
    }

    func greet(name: String) {
        print("\(prefix), \(name)!")
    }
}

let g = Greeter()
g.greet(name: "Mohamed")



// ===========================
// 2️⃣ Methods with Return Values, Default Parameters, and inout
struct Counter {
    private(set) var count: Int = 0

    mutating func increment(by value: Int = 1) -> Int {
        count += value
        return count
    }

    func doubled(_ x: inout Int) {
        x *= 2
    }
}

var c = Counter()
print("after increment: \(c.increment())")
print("after increment by 5: \(c.increment(by: 5))")

var num = 3
c.doubled(&num)
print("num after doubled: \(num)")



// ===========================
// 3️⃣ Mutating & Static Methods on Value Types
struct Toggle {
    private(set) var isOn: Bool = false
    
    mutating func toggle() {
        isOn.toggle()
    }
    
    // static method — belongs to the struct itself
    static func description() -> String {
        return "Toggle is a simple struct with an on/off state."
    }
}

var t = Toggle()
t.toggle()
print("toggle isOn: \(t.isOn)")
print(Toggle.description())

