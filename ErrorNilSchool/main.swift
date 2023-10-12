//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson-4

import Foundation

//Определитель зодиака:
func getZodiacSign(day: Int, month: Int) -> String {
    switch (month, day) {
    case (3, 21...31), (4, 1...19):
        return "Овен"
    case (4, 20...30), (5, 1...20):
        return "Телец"
    case (5, 21...31), (6, 1...20):
        return "Близнецы"
    default:
        return "Неизвестный"
    }
}

while true {
    print("\nВведите день вашего рождения:")
    guard let day = Int(readLine() ?? ""), day >= 1 && day <= 31 else {
        print("Неверный день!")
        continue
    }

    print("Введите месяц вашего рождения:")
    guard let month = Int(readLine() ?? ""), month >= 1 && month <= 12 else {
        print("Неверный месяц!")
        continue
    }

    let zodiac = getZodiacSign(day: day, month: month)
    print("Ваш знак зодиака: \(zodiac).\n")
}
//--------------------

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

//Конвертер валют
var exchangeRates: [String: Double] = ["USD": 1.0, "EUR": 0.85, "RUB": 73.0]

func convertCurrency(amount: Double, fromCurrency: String, toCurrency: String) -> Double? {
    if let fromRate = exchangeRates[fromCurrency], let toRate = exchangeRates[toCurrency] {
        return amount * fromRate / toRate
    }
    return nil
}
//--------------------------------------------------------
var weatherData: [String: [String: Int]] = ["Moscow": ["temperature": 15, "humidity": 60], "New York": ["temperature": 20, "humidity": 70]]

func getWeather(city: String) -> [String: Int]? {
    return weatherData[city]
}

if let moscowWeather = getWeather(city: "Moscow") {
    print("Weather in Moscow: \(moscowWeather)")
} else if let newYork = getWeather(city: "New York") {
    print("Weather in New York: \(newYork)")
}

//Калькулятор калорий
var calorieData: [String: Double] = ["apple": 52, "banana": 96, "chicken": 335]

func calculateCalories(food: String, weight: Double) -> Double? {
    if let caloriesPer100g = calorieData[food] {
        return caloriesPer100g * weight / 100
    }
    return nil
}
// HomeWork
//Тенажер таблицы умножения
// монета, монеты, монет

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

///----------------------------
