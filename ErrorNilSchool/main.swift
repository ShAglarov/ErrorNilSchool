//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//

import Foundation

enum TrafficLight {
    case red
    case yellow
    case green

    mutating func next() {
        switch self {
        case .red:
            self = .green
        case .yellow:
            self = .red
        case .green:
            self = .yellow
        }
    }
}

var svetofor = TrafficLight.green

for item in 1..<10  {
    print(svetofor)
    svetofor.next()
}

//////////////////

enum NavigationState {
    case home(String)
    case profile(String)
    case settings(String)
}

// Хранимое свойство для текущего состояния навигации
var currentNavigationState: NavigationState?

// Функция для вывода информации на экран в зависимости от текущего состояния
func displayCurrentState() {
    guard let state = currentNavigationState else {
        print("Текущее состояние навигации не установлено.")
        return
    }
    
    switch state {
    case .home(let homeWindow):
        print("\(homeWindow)\nВы ввели пароль")
    case .profile(let profileWindow):
        print("\(profileWindow) \nФИО: Агларов Ш.Р\nПочта: shamil.aglarov@gmail.com")
    case .settings(let settingsWindow):
        print("\(settingsWindow) \nСтиль - темный\nID-профиля: 39481119484")
    }
}

// Функция для обновления текущего состояния и вывода информации на экран
func navigate(to state: NavigationState) {
    currentNavigationState = state
    displayCurrentState()
}

// Пример использования
navigate(to: .home("Для входа личный кабинет введите пароль"))
navigate(to: .profile("Вы вошли в личный кабинет"))
navigate(to: .settings("Вы вошли в настройки приложения"))

/////////////////

enum HTTPMethod {
    case get
    case post(parameters: [String : String])
    case put(parameters: [String : String])
    case delete
}

func performRequest(method: HTTPMethod) {
    switch method {
    case .get:
        print("Выполнили get запрос")
    case .post(let parameters):
        print("Выполнили post запрос \(parameters.keys) & \(parameters.values)")
    case .put(let parameters):
        print("Выполнили put запрос \(parameters.keys) & \(parameters.values)")
    case .delete:
        print("Выполнили delete запрос")
    }
}

let getMethod = HTTPMethod.get
let postMethod = HTTPMethod.post(parameters: ["key":"value"])
let putMethod = HTTPMethod.put(parameters: ["updateKey":"updateValue"])

performRequest(method: postMethod)


enum TrafficLight {
    case red, green, yellow

    func next() -> TrafficLight {
        switch self {
        case .red:
            return .green
        case .green:
            return .yellow
        case .yellow:
            return .red
        }
    }
}

var currentTraffic = TrafficLight.green

currentTraffic = currentTraffic.next()
currentTraffic = currentTraffic.next()
print()

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

func performBarcode(barcode: Barcode) {
    switch barcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem):\(manufacturer):\(product):\(check)")
    case .qrCode(let productCode):
        print("QR code: \(productCode)")
    }
}

let producBarcode = Barcode.upc(4, 8, 1, 9)
let qrCode = Barcode.qrCode("abcdfj")

performBarcode(barcode: qrCode)

enum MathOperation {
    case add
    case substract
    case multiply
    case divide

    func compute(lhs: Float, rhs: Float) -> Float {
        switch self {
        case .add:
            return lhs + rhs
        case .substract:
            return lhs - rhs
        case .multiply:
            return lhs * rhs
        case .divide:
            return lhs / rhs
        }
    }
}

let multiply = MathOperation.multiply
let adition = MathOperation.add
let divide = MathOperation.divide

func calculate(_ a: Float, _ operation : MathOperation, _ b: Float) {

    print(operation.compute(lhs: a, rhs: b))
}

calculate(5, .multiply, 2)

indirect enum ArifmeticExpression {
    case number(Int)
    case addition(ArifmeticExpression, ArifmeticExpression)
    case multiply(ArifmeticExpression, ArifmeticExpression)

    func result() -> Int {
        switch self {
        case .number(let value):
            return value
        case .addition(let lhs, let rhs):
            return lhs.result() + rhs.result()
        case .multiply(let lhs, let rhs):
            return lhs.result() * rhs.result()
        }
    }
}

let five = ArifmeticExpression.number(5)
let two = ArifmeticExpression.number(2)

let multiply = ArifmeticExpression.multiply(five, two)

print(multiply.result())
