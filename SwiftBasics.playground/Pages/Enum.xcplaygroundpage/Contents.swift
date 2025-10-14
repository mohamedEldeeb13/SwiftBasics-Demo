

import Foundation

// --------------------------------------------------
// 1) Basic enum

enum CompassPoint {
    case north
    case south
    case east
    case west
}

var direction = CompassPoint.north
direction = .west // type inference

print("Direction: \(direction)")


// --------------------------------------------------
// 2) Enum with raw values

enum HTTPStatus: Int {
    case ok = 200
    case created = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
}

let status = HTTPStatus(rawValue: 200)
print("HTTPStatus from raw value 200 -> \(String(describing: status))")

// Raw values automatically assigned
enum DirectionShort: String {
    case n = "N"
    case s = "S"
    case e = "E"
    case w = "W"
}
print("Short east raw value: \(DirectionShort.e.rawValue)")

// --------------------------------------------------
// 3) CaseIterable — iterate cases
// The CaseIterable protocol allows you to access all enum cases as a collection
// through the automatically generated static property `allCases`.
enum Planet: CaseIterable {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

for p in Planet.allCases {
    print("Planet: \(p)")
}

// --------------------------------------------------
// 4) Associated values
// Associated values allow each enum case to store additional data of any type.
// This makes enums more flexible — each case can carry context-specific information.
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem)-\(manufacturer)-\(product)-\(check)")
case .qrCode(let code):
    print("QR code: \(code)")
}

// --------------------------------------------------
// 5) Enums with methods & computed properties
// can add computed variable or methods
enum Suit: String, CustomStringConvertible {
    case hearts, diamonds, clubs, spades

    var color: String {
        switch self {
        case .hearts, .diamonds: return "red"
        case .clubs, .spades: return "black"
        }
    }

    func symbol() -> String {
        switch self {
        case .hearts: return "♥︎"
        case .diamonds: return "♦︎"
        case .clubs: return "♣︎"
        case .spades: return "♠︎"
        }
    }

    var description: String { return "\(rawValue.capitalized) (\(color))" }
}

let s = Suit.spades
print(s.description)
print("symbol: \(s.symbol())")

// --------------------------------------------------
// 6) Mutating method in enum
// make function mutating because enum is value type, This means their properties and state cannot normally be changed inside instance methods.
// you must mark that method as `mutating`. if you want to modify it
enum LightSwitch {
    case on, off

    // Mutating method that flips the current state
    mutating func toggle() {
        self = (self == .on) ? .off : .on
    }
}

var bulb = LightSwitch.off
bulb.toggle()
print("Bulb state after toggle: \(bulb)")

// --------------------------------------------------
// 7) Switch pattern matching, `where`, and value binding
// --------------------------------------------------
enum Measurement {
    case weight(Double)
    case length(Double)
    case unknown
}

let m = Measurement.weight(65.0)

switch m {
case .weight(let kg) where kg > 50:
    print("Heavy weight: \(kg) kg")
case .weight(let kg):
    print("Weight: \(kg) kg")
case .length(let cm):
    print("Length: \(cm) cm")
case .unknown:
    print("Unknown measurement")
}
