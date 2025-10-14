import Foundation


//MARK: - Subscript -


struct DaysOfWeek {
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

let week = DaysOfWeek()
print("1️⃣ Basic Subscript Example:")
print(week[0]) // Sunday
print(week[3]) // Wednesday
print("---------------------------\n")


// ==========================================================
// 1️⃣ Subscript with Get and Set
// ==========================================================

struct SquareTable {
    var data = [1: 1, 2: 4, 3: 9]
    
    subscript(number: Int) -> Int {
        get {
            return data[number] ?? 0
        }
        set(newValue) {
            data[number] = newValue
        }
    }
}

var table = SquareTable()
print("Subscript with Get and Set:")
print("Before:", table.data)
print("Value for 2:", table[2])   // 4
table[4] = 16
print("After adding 4:", table.data)
print("---------------------------\n")


// ==========================================================
// 2️⃣ Subscript with Multiple Parameters
// ==========================================================

struct Matrix {
    var grid: [[Int]]
    
    subscript(row: Int, column: Int) -> Int {
        get { grid[row][column] }
        set(newValue) { grid[row][column] = newValue }
    }
}

var matrix = Matrix(grid: [[1, 2], [3, 4]])
print("Subscript with Multiple Parameters:")
print("Before:", matrix.grid)
print(matrix[0, 1]) // 2
matrix[1, 0] = 10
print("After:", matrix.grid)
print("---------------------------\n")


// ==========================================================
// 3️⃣ Subscript with Custom Parameter Types
// ==========================================================

struct PersonDirectory {
    var records: [String: String]
    
    subscript(name: String) -> String {
        get { records[name] ?? "Not Found" }
        set { records[name] = newValue }
    }
}

var directory = PersonDirectory(records: ["Mohamed": "12345"])
print("Subscript with Custom Parameter Types:")
print(directory["Mohamed"]) // 12345
directory["Sara"] = "67890"
print(directory.records)
print("---------------------------\n")


// ==========================================================
//  4️⃣ Subscript Overloading
// ==========================================================

struct DataStorage {
    var numbers = [1, 2, 3, 4]
    var words = ["One", "Two", "Three"]
    
    subscript(index: Int) -> Int {
        return numbers[index]
    }
    
    subscript(index: String) -> String {
        return words[Int(index)! - 1]
    }
}

let storage = DataStorage()
print("Subscript Overloading:")
print(storage[1])     // 2
print(storage["2"])   // Two
print("---------------------------\n")


// ==========================================================
// 5️⃣ Read-Only Subscript
// ==========================================================

struct MultiplicationTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        multiplier * index
    }
}

let threeTimes = MultiplicationTable(multiplier: 3)
print(" Read-Only Subscript:")
print(threeTimes[4])  // 12
print("---------------------------\n")
