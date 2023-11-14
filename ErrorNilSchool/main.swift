//
//  main.swift
//  ErrorNilSchool
//
//Lesson-10 (Дженерики)

import Foundation

//Возвращение первого элемента массива (если он существует):
var x = 5
var y = 10

//Обмен значениями (swap):
func swap(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
// Использование:
swap(&x, &y) // x станет 10, y станет 5

//-----------------------------------------------------------------------------

//Обмен значениями (swap):
func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
// Использование:
swap(&x, &y) // x станет 10, y станет 5

//-----------------------------------------------------------------------------
//Функция, которая находит индекс элемента в массиве:
func findIndex<T: Equatable>(of value: T, in array: [T]) -> Int? {
    for (index, element) in array.enumerated() {
        if element == value {
            return index
        }
    }
    return nil
}

let anyArray = [1, 3, 5, 7]
if let index = findIndex(of: x, in: anyArray) {
    print("Индекс значения \(x) в данном массиве \(index)") //Индекс значения 5 в данном массиве 2
}

//-----------------------------------------------------------------------------

// Проверка на равенство двух элементов с разными типами (через приведение типов):
func areEqual<L: Equatable, R: Equatable>(_ lhs: L, _ rhs: R) -> Bool {
    if let lASr = lhs as? R {
        return lASr == rhs
    }
    return false
}

// Использование:
let result = areEqual(5, "5")  // Возвращает false
let result2 = areEqual(5, "6")
print(result)

//-----------------------------------------------------------------------------
//Функция, которая возвращает элементы в заданном диапазоне:
func filter<T: Comparable>(_ array: [T], between minValue: T, and maxValue: T) -> [T] {
    return array.filter { $0 >= minValue && $0 <= maxValue }
}

let filteredNumbers = filter([1.1,2.2,3.3,4.4,5.5,6.6], between: 3, and: 6)
print(filteredNumbers) // выводит [3., 4, 5, 6]
//-----------------------------------------------------------------------------


enum TypeFighter: CustomStringConvertible, CaseIterable {
case fighter, warrior, mag

    var description: String {
        switch self {
        case .fighter: return "Боец"
        case .warrior: return "Воин"
        case .mag: return "Маг"
        }
    }
}

protocol PeopleProtocol {
    var name: String { get }
    var strength: Int { get set }
    var health: Int { get set }
    var isDead: Bool { get set }
}
extension PeopleProtocol {
    func startTraining() { print ("\(name) начал тренеровку ")}
    var damage: Int { return strength * 10 }
}

protocol FighterProtocol: PeopleProtocol {
    var typeFighter: TypeFighter { get }
}
extension FighterProtocol {
    var type: TypeFighter {
        return typeFighter
    }
}

protocol AttackProtocol { }
extension AttackProtocol {
    var damageMultiply: Int {
        return 10
    }
    func kick() -> Int {
        return damageMultiply
    }
}

protocol WarriorProtocol: FighterProtocol, AttackProtocol{ }
protocol MagProtocol: FighterProtocol, AttackProtocol { }

extension WarriorProtocol {
    var typeFighter: TypeFighter {
        return .warrior
    }
}
extension MagProtocol {
    var typeFighter: TypeFighter {
        return .mag
    }
}
struct People: PeopleProtocol {
    var name: String
    var strength: Int = 0
    var health: Int = 100 {
        didSet {
            if health <= 0 {
                health = 0
                isDead = true
            }
        }
    }
    var isDead: Bool = false
}

struct Fighter: FighterProtocol {

    var name: String
    var strength: Int = 1
    var health: Int = 100 {
        didSet {
            if health <= 0 {
                health = 0
                isDead = true
            }
        }
    }
    var isDead: Bool = false
    var typeFighter: TypeFighter = .fighter
}
struct Warrior: WarriorProtocol {
    var name: String
    var strength: Int  = 4
    var health: Int = 100 {
        didSet {
            if health <= 0 {
                health = 0
                isDead = true
            }
        }
    }
    var isDead: Bool = false
}
struct Mag: MagProtocol {
    var name: String
    var strength: Int = 2
    var health: Int = 80 {
        didSet {
            if health <= 0 {
                health = 0
                isDead = true
            }
        }
    }
    var isDead: Bool = false
}

struct TrainingCentre<T: PeopleProtocol>  {
    var randUpgrade = 3
    func training(people: T) -> FighterProtocol? {
        if randUpgrade == Int.random(in: 3..<5) {
            let type = TypeFighter.allCases
            let typeNumber = Int.random(in: 1..<type.count)
            print("\(people.name) достиг нужных навыков и умений, теперь он стал полноценным бойцом \(type[typeNumber])")

            return type[typeNumber] == .warrior ? Warrior(name: people.name) : Mag(name: people.name)
        } else {
            print("\(people.name) нужно потренероваться еще...")
            return nil
        }
    }
}

struct Game<T: FighterProtocol & AttackProtocol, I: FighterProtocol & AttackProtocol>  {
    func battle(attacker: T, victim: I) {
        var attacker = attacker
        var victim = victim

        while true {
            print("\(attacker.name) атакует \(victim.name) и наносит \(attacker.kick()) урона.")
            victim.health -= attacker.kick()
            print("\(victim.name) осталось \(victim.health) жизней dead = \(victim.isDead)")
            let _ = readLine()
            if victim.isDead {
                print("\(victim.name) побежден.")
                print("\(attacker.name) победил!")
                break
            }

            print("\(victim.name) атакует \(attacker.name) и наносит \(victim.kick()) урона.")
            attacker.health -= victim.kick()
            print("\(attacker.name) осталось \(attacker.health) жизней dead = \(attacker.isDead)")
            let _ = readLine()
            if attacker.isDead {
                print("\(attacker.name) побежден.")
                print("\(victim.name) победил!")
                break
            }
        }
    }
}


let people = People(name: "people")
let fighter = Fighter(name: "fighter")
let warrior = Warrior(name: "Warrior")
let mag: FighterProtocol = Mag(name: "Mag")

let trainingFighter = TrainingCentre<People>()

let newFighter = trainingFighter.training(people: people)

if newFighter is Warrior {
    let game = Game<Warrior, Warrior>()
    game.battle(attacker: warrior, victim: newFighter as! Warrior)
} else if newFighter is Mag {
    let game = Game<Warrior, Mag>()
    game.battle(attacker: warrior, victim: newFighter as! Mag)
}

//-----------------------------------------------------------------------------
/// Пример 1: Базовая форма замыкания без указания типа (Swift может выводить типы на основе контекста).
let sumClosure = { (a: Int, b: Int) -> Int in
    a + b
}
/// Результат выполнения: будет напечатано "20".
print(sumClosure(10, 10))

//-----------------------------------------------------------------------------

/// Пример 2: Замыкание без явного возвращаемого типа. Тип возвращаемого значения выводится автоматически.
let multiplicationClosure: (Int, Int) -> Int = { xValue, yValue in
    xValue * yValue
}
/// Результат выполнения: вернет 56.
let resultMultiplication = multiplicationClosure(7, 8)

//-----------------------------------------------------------------------------

/// Пример 3: Замыкание с использованием сокращенных имен аргументов.
let subtractionClosure: (Int, Int) -> Int = {
    $0 - $1
}

/// Результат выполнения: вернет -1.
let resultSubtraction = subtractionClosure(10, 5)

//-----------------------------------------------------------------------------

/// Пример 4: Явное определение типа замыкания `closure3`, а затем присваивание замыкания этой переменной.
let subtractionClosure2: ((Int, Int) -> Int)

subtractionClosure2 = { xValue, yValue in
    xValue - yValue
}
/// Результат выполнения: вернет -1.
let resultSubtraction2 = subtractionClosure(10, 5)

/// -------------------------------------------------------------

/// Пример 5: Самое короткое определение замыкания для сложения без явного возвращаемого типа и с сокращенными именами аргументов.
let additionClosure: (Int, Int) -> Int = {
    $0 + $1
}

/// Результат выполнения: вернет 15.
let result4 = additionClosure(7, 8)

/// -------------------------------------------------------------

/// Пример 6: Замыкание, которое возвращает другое замыкание.
func makeIncrementer(incrementAmount: Int) -> (Int) -> Int {
    let incrementer: (Int) -> Int = { value in
        return value + incrementAmount
    }
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)

/// Результат выполнения: вернет 9.
let result5 = incrementByTwo(7)

/// -------------------------------------------------------------

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var int1 = 3
var int2 = 4
swapTwoValues(&int1, &int2)
print(int1, int2) // 4, 3

//------------------------------------------------

var string1 = "Hello"
var string2 = "World"
swapTwoValues(&string1, &string2)
print(string1, string2) // World, Hello

//------------------------------------------------
//2. Дженерик структуры:
//Стек, который работает с любым типом данных:
struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        return items.popLast()
    }

    func peek() -> Element? {
        return items.last
    }
}

var intStack = Stack<Int>()
intStack.push(5)
intStack.push(10)
print(intStack.peek() ?? "Empty") // 10

var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("Generics")
print(stringStack.peek() ?? "Empty") // Generics

//------------------------------------------------
1. Дженерик с несколькими параметрами:

func pair<T, U>(_ first: T, _ second: U) -> (T, U) {
    return (first, second)
}

let result = pair("Hello", 42)
print(result) // ("Hello", 42)

//------------------------------------------------
1. Применение дженериков с протоколами и условиями:
func areEqual<T: Equatable>(_ x: T, _ y: T) -> Bool {
    return x == y
}

print(areEqual(4, 4))           // true
print(areEqual("a", "b"))       // false

//------------------------------------------------

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class AnimalBox<T: Animal> {
    var animal: T?
    
    init(_ animal: T?) {
        self.animal = animal
    }
}

class Dog: Animal {}
class Cat: Animal {}

let dogBox = AnimalBox(Dog(name: "Buddy"))
let catBox = AnimalBox(Cat(name: "Whiskers"))

//------------------------------------------------
//4. Дженерик-функция с ограничением для типов, реализующих протокол:
protocol HasDescription {
    var description: String { get }
}

func printDescription<T: HasDescription>(_ item: T) {
    print(item.description)
}

extension Int: HasDescription {
    var description: String {
        return "Integer value is \(self)"
    }
}

printDescription(42)  // Integer value is 42

//------------------------------------------------
//Дженерики с условиями в расширениях:

extension Array where Element: Equatable {
    func containsElement(_ element: Element) -> Bool {
        return self.contains(element)
    }
}

let stringArray = ["apple", "orange", "banana"]
print(stringArray.containsElement("apple"))  // true

struct CustomStruct {
    var id: Int
}

let customArray: [CustomStruct] = [CustomStruct(id: 1)]
// customArray.containsElement(CustomStruct(id: 1)) 
// Этот код вызовет ошибку компиляции, так как CustomStruct не реализует Equatable
//------------------------------------------------