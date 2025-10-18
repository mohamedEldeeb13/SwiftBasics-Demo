//MARK:  🧩 Optional Chaining

// =============================================================
// MARK: 1️⃣ Simple Property Access with Optional Chaining


class Room {
    var name: String
    init(name: String) { self.name = name }
}

class House {
    var livingRoom: Room?
}

var house: House? = House()

// livingRoom is nil -> optional chaining returns nil
print(house?.livingRoom?.name as Any) // prints "nil"

// make living room
house?.livingRoom = Room(name: "Main")

// now optional chaining retrieves the name as an optional String
print(house?.livingRoom?.name as Any) // Optional("Main")

// because result is optional, you can use nil-coalescing
print(house?.livingRoom?.name ?? "No room") // "Main"


// =============================================================
// MARK: 2️⃣ Calling Methods via Optional Chaining

class Dog {
    func bark() -> String { "Woof" }
}

class Person {
    var dog: Dog?
}

var person: Person? = Person()

// dog is nil -> call returns nil
let barkResult = person?.dog?.bark()
print(type(of: barkResult), barkResult as Any) // Optional<String>

// add a dog & call again
person?.dog = Dog()
print(person?.dog?.bark() as Any) // Optional("Woof")


// =============================================================
// MARK: 🔹 How to Safely Unwrap Optionals

// 4 main ways to handle optionals safely instead of force unwrapping (!).

// -------------------------------------------------------------
// 1️⃣ Optional Binding (if let)

class Address { var city: String; init(city: String) { self.city = city } }
class User { var address: Address? }

let user1 = User()
user1.address = Address(city: "Cairo")

if let city = user1.address?.city {
    print("City is \(city)")
} else {
    print("City not available")
}

// -------------------------------------------------------------
// 2️⃣ Guard Binding (guard let)

func showCity(for user: User?) {
    guard let city = user?.address?.city else {
        print("No city found")
        return
    }
    print("City is \(city)")
}

showCity(for: user1)
showCity(for: nil)

// -------------------------------------------------------------
// 3️⃣ Nil-Coalescing Operator (??)

let user2 = User()
let cityName = user2.address?.city ?? "Unknown City"
print(cityName) // "Unknown City"

// -------------------------------------------------------------
// 4️⃣ Force Unwrap (!) — Avoid unless absolutely sure

let user3 = User()
user3.address = Address(city: "Alexandria")

// ✅ Works fine (non-nil)
let safeCity = user3.address!.city
print("Force unwrapped city:", safeCity)

// ❌ Uncommenting below line will crash the app if address is nil
// let crashCity = user2.address!.city
