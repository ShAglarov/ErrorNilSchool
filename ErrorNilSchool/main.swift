//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson-5

import Foundation

enum CompassPoint {
    case north //север
    case south // юг
    case east // восток
    case west // запад
}

let direction = CompassPoint.north

enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

let today: DayOfWeek = .wednesday
print("Сегодня \(today)")

// ---------------------------

//Enum с неявно установленными значениями
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

if let possiblePlanet = Planet(rawValue: 3) {
    switch possiblePlanet {
    case .earth:
        print("Наши дома!")
    default:
        print("Не на Земле.")
    }
}

// ---------------------------

//Enum со связанными значениями
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

let productBarcode = Barcode.upc(8, 85909, 51226, 3)
let qrCode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

//--------------------------

//Текстовый квест
enum Decision {
    case optionA, optionB
}
func startQuest() {
    print("Вы стоите у развилки дорог. Куда вы пойдете?")
    print("A: Налево")
    print("B: Направо")
    
    // Здесь вы можете использовать ввод данных для выбора
    let decision: Decision = .optionA // пример

    switch decision {
    case .optionA:
        print("Вы напали на медведя!")
    case .optionB:
        print("Вы нашли заброшенный дом.")
    }
}

startQuest()

//--------------------------
//Enum с методами
enum Beverage: String {
    case coffee, tea, juice
    
    var description: String {
        switch self {
        case .coffee:
            return "кофе"
        case .tea:
            return "чай"
        case .juice:
            return "сок"
        }
    }
    
    func describe() -> String {
        switch self {
        case .coffee:
            return "Просыпайся с чашечкой \(self.description)."
        case .tea:
            return "Расслабьтесь с чашечкой \(self.description)."
        case .juice:
            return "Получите витамины со стаканом \(self.description)."
        }
    }
}

let drink = Beverage.coffee
print(drink.describe()) // Output: Просыпайтесь с чашечкой кофе.

//--------------------------

//Пример 5: Enum с вычисляемыми свойствами
enum RectangleProperties {
    case width(Double), height(Double)
    
    var description: String {
        switch self {
        case .width(let value):
            return "Ширина \(value) единицы."
        case .height(let value):
            return "Высота \(value) единицы."
        }
    }
}

let widthProperty = RectangleProperties.width(20.0)
print(widthProperty.description) // Output: Width is 20.0 units.

//--------------------------

//Enum с функциями, принимающими аргументы
enum MathOperations {
    case add, subtract, multiply, divide
    
    func compute(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .multiply:
            return lhs * rhs
        case .divide:
            guard rhs != 0 else {
                fatalError("Cannot divide by zero")
            }
            return lhs / rhs
        }
    }
}

let addition = MathOperations.add
let result = addition.compute(lhs: 10, rhs: 20) // result is 30

//--------------------------

//Enum с вычисляемыми свойствами
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
    
    var result: Int {
        switch self {
        case .number(let value):
            return value
        case .addition(let left, let right):
            return left.result + right.result
        case .multiplication(let left, let right):
            return left.result * right.result
        }
    }
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

print("Результат умножения: \(product.result)") // 18

/// ------------------------------------------
//Пример 1: Вложенные Enum
enum Transportation {
    enum Car {
        case sedan, suv, coupe
    }
    enum Boat {
        case sail, motor, row
    }
}

let myCar = Transportation.Car.sedan
let myBoat = Transportation.Boat.sail

/// ------------------------------------------

enum Result {
    case success(String)
    case failure(String)
}

func fetchData(for request: String) -> Result {
    let data = "Получены данные для \(request)"
    let error = "Не удалось получить данные для \(request)"
    
    let isFetchingSuccess = true
    
    if isFetchingSuccess {
        return .success(data)
    } else {
        return .failure(error)
    }
}

// Использование
let result2 = fetchData(for: "myRequest")
switch result2 {
case .success(let data):
    print("Data: \(data)")
case .failure(let errorMessage):
    print("Error: \(errorMessage)")
}
///
