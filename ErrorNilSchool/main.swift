//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson-3

import Foundation

//1. Цикл While - Пока
var numb = 0

while numb <= 5 {
    print("Значение number: \(numb)")
    numb += 1
}
//2. В отличие от while цикла, в repeat-while тело цикла выполнится хотя бы один раз,
//   даже если условие изначально не выполняется.
repeat {
    print("Значение number: \(numb)")
    numb += 1
} while numb <= 5

//2. Найти факториал
func factorial(of n: Int) -> Int {
    var result = 1
    var i = 1
    repeat {
        result *= i
        i += 1
    } while i <= n
    return result
}
let number = 5
let result = factorial(of: number)
print("Факториал \(number) равен \(result).") // Вывод: "Факториал 5 равен 120."

//3. Написать функцию, которая определяет, четное число или нет.
func isMultiple(_ number: Int, of divisor: Int) -> Bool {
    return number % divisor == 0
}

func searchFirstEven(_ array: [Int]) -> Int {
    // Найдем первое четное число в массиве и завершим цикл при его нахождении.
    var firstEvenNumber = Int()

    for number in array {
        if isMultiple(number, of: 2) {
            firstEvenNumber = number
            break
        }
    }
    return firstEvenNumber
}
let numbers = [3, 5, 7, 8, 9, 10]
let even = searchFirstEven(numbers)
print(even)

func searchOdd(_ array: [Int]) -> [Int] {
    // Получим все нечетные числа из массива.
    var oddNumbers = [Int]()
    for number in array {
        isMultiple(number, of: 2) ? oddNumbers.append(number) : ()
    }
    return oddNumbers
}

let odd = searchOdd(numbers)
print(odd)

func greet(person name: String) -> String {
    if name.isEmpty {
        return "Привет незнакомец"
    }
    return "Привет, \(name)!"
}
//print(greet(person: ""))

func greet2(person name: String) -> String {
    guard !name.isEmpty else {
        return "Привет, незнакомец!"
    }
    return "Привет, \(name)!"
}
//print(greet2(person: ""))

func greet3(person name: String?) -> String {
    if name == nil {
        return "Привет, незнакомец!"
    } else {
        return "Привет, \(name ?? "")!"
    }
    
}
print(greet3(person: "dfvd"))

// Объявление опциональной строки
var name: String? = nil

// Пока что значение переменной name - nil
print(name) // Выведет: nil

// Теперь дадим ей какое-то значение
name = "Alex"
print(name) // Выведет: Optional("Alex")

// Чтобы безопасно получить значение из опционала, используем условное связывание (if let)
if let unwrappedName = name {
    print("Hello, \(unwrappedName)!")
} else {
    print("Name is nil.")
}
//---------------------------------------------------------------
// Создадим функцию которая получает от сервера юзера (может получить либо не получить)
func getUser() -> String? {
    return Bool.random() ? "Alex" : nil
}
// Создадим функцию которая получает от сервера почту (может получить либо не получить)
func getEmail() -> String? {
    return Bool.random() ? "anna@mail.com" : nil
}

//---------------------------------------------------------------
//Функция, в которой определенные поля могут быть не заполнены
//(например, email или phoneNumber), поэтому они опциональные.
func registerUser(userName: String? = nil, email: String? = nil) {
    print("Регистрация пользователя!")
    if let userName = userName {
        print("UserName: \(userName)")
    } else {
        print("UserName не предоставлен.")
    }
    guard let userMail = email else {
        print("Email не предоставлен.")
        return
    }
    print("UserEmail: \(userMail)")
}
// Пользователь регистрируется только с именем
registerUser(userName: getUser())
// Пользователь регистрируется с именем и email
registerUser(userName: getUser(), email: getEmail())

let fruit = "яблоко"

switch fruit {
case "банан":
    print("Это банан.")
case "апельсин":
    print("Это апельсин.")
case "яблоко":
    print("Это яблоко.")
default:
    print("Не уверен, что это за фрукт.")
}
// Предположим, у нас есть функция, которая принимает на вход возраст человека
// в виде строки и пытается определить, в какой возрастной категории он находится.
func ageCategory(from age: Int) -> String {
    // Используем switch для определения возрастной категории
    switch age {
    case 0..<13:
        return "Ребенок"
    case 13..<20:
        return "Подросток"
    case 20..<60:
        return "Взрослый"
    case 60...120:
        return "Пожилой"
    default:
        return "Некорректный возраст"
    }
}
let age = ageCategory(from: 11)

/// Возвращает временной интервал дня на основе заданного времени.
/// - Parameter hour: Текущий час (от 0 до 23).
/// - Returns: Временной интервал дня.
func getTimeOfDay(for hour: Int) -> String {
    return hour > 23 ? "Некорректный час" :
        isMorning(hour) ? "Утро" :
        isDay(hour) ? "День" :
        isEvening(hour) ? "Вечер" :
        isNight(hour) ? "Ночь" : "Неопределенное время"
}

/// Проверяет, является ли указанный час утром.
/// - Parameter hour: Текущий час.
/// - Returns: `true`, если это утро.
func isMorning(_ hour: Int) -> Bool {
    return hour >= 6 && hour < 12
}

/// Проверяет, является ли указанный час днем.
/// - Parameter hour: Текущий час.
/// - Returns: `true`, если это день.
func isDay(_ hour: Int) -> Bool {
    return hour >= 12 && hour < 18
}

/// Проверяет, является ли указанный час вечером.
/// - Parameter hour: Текущий час.
/// - Returns: `true`, если это вечер.
func isEvening(_ hour: Int) -> Bool {
    return hour >= 18 && hour < 22
}

/// Проверяет, является ли указанный час ночью.
/// - Parameter hour: Текущий час.
/// - Returns: `true`, если это ночь.
func isNight(_ hour: Int) -> Bool {
    return hour < 6 || hour >= 22
}
print(getTimeOfDay(for: 24))


//В Swift, словари (Dictionary) представляют собой неупорядоченные коллекции.
// 1. Создание словаря
var fruitColors: [String: String] = [
    "apple": "red",
    "banana": "yellow",
    "cherry": "red"
]

// Вывод словаря
print(fruitColors) // ["apple": "red", "banana": "yellow", "cherry": "red"]

// 2. Добавление и изменение значений
fruitColors["grape"] = "purple" // Добавление нового значения
print(fruitColors) // ["apple": "red", "banana": "yellow", "cherry": "red", "grape": "purple"]

fruitColors["apple"] = "green" // Изменение существующего значения
print(fruitColors) // ["apple": "green", "banana": "yellow", "cherry": "red", "grape": "purple"]

// 3. Удаление значений
fruitColors["cherry"] = nil // Удаление значения по ключу
print(fruitColors) // ["apple": "green", "banana": "yellow", "grape": "purple"]

// 4. Проход по словарю
for (fruit, color) in fruitColors {
    print("\(fruit) has \(color) color.")
}
// Вывод:
// apple has green color.
// banana has yellow color.
// grape has purple color.

// 1. Создание множества
var fruits: Set<String> = ["apple", "banana", "cherry"]

print(fruits) // ["banana", "apple", "cherry"] (порядок может быть другим)

// 2. Добавление и удаление элементов
fruits.insert("orange") // Добавление элемента
print(fruits) // ["orange", "banana", "apple", "cherry"]

fruits.remove("banana") // Удаление элемента
print(fruits) // ["orange", "apple", "cherry"]

// 3. Основные операции с множествами
let tropicalFruits: Set<String> = ["banana", "mango", "papaya"]

// Объединение
print(fruits.union(tropicalFruits)) // ["mango", "papaya", "orange", "banana", "apple", "cherry"]

// Пересечение
print(fruits.intersection(tropicalFruits)) // ["banana"]

// Разность
print(fruits.subtracting(tropicalFruits)) // ["orange", "apple", "cherry"]

// Исключающее или (элементы, которые присутствуют только в одном из множеств)
print(fruits.symmetricDifference(tropicalFruits)) // ["mango", "papaya", "orange", "apple", "cherry"]

// 4. Проверка на наличие элементов
print(fruits.contains("apple")) // true
print(fruits.contains("grape")) // false
