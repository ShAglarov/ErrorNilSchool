//
//  main.swift
//  ErrorNilSchool
//
//  Created by Shamil Aglarov on 12.10.2023.
//

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

//Массивы
var numbers: [Int] = [1, 2, 3, 4, 5]
print(numbers)

//Инициализация
var numbers = [Int]()
// или так
var numbers2 : [Int] = []
print("В массиве numbers \(numbers.count) элементов")   // В массиве numbers 0 элементов

//count и isEmpty
var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
print("В массиве numbers \(numbers.count) элементов")

var numbers: [Int] = [1, 4, 8]
if numbers.isEmpty {
    print("массив пуст")
} else {
    print("в массиве есть элементы")
}
//Перебор массива
var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]

for i in numbers {
    print(i) // 1, 2, 3, 4, 5, 6, 7, 8,
}
//Перебор массива через индексы:
var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]

for i in 0 ..< numbers.count {
    print(numbers[i]) // 1, 2, 3, 4, 5, 6, 7, 8,
}
//С помощью метода enumerated() можно одновременно получить индекс и значение элемента:
var names: [String] = ["Tom", "Alice", "Kate"]

names.enumerated().forEach({print("\($0) - \($1)")})

for (index, value) in names.enumerated() {
    print("\(index) - \(value)")
}
//Создание массива из последовательности
var numbers = Array (1...5)     // [1, 2, 3, 4, 5]
var numbers2 = [Int] (3..<7)    // [3, 4, 5, 6]
var array1 = Array(stride(from: 1, to: 5, by: 1)) // [1, 2, 3, 4]
var array2 = Array(stride(from: 5, through: 1, by: -1)) // [5, 4, 3, 2, 1]

print(array1)
print(array2)

//Сравнение массивов
var numbers: [Int] = [1, 2, 3, 4, 5]
let nums = [1, 2, 3, 4, 5]

if numbers == nums{
    print("массивы равны")
}
else {
    print("массивы не равны")
}
//Копирование массива
var numbers: [Int] = [1, 2, 3, 4, 5]
var nums: [Int] = numbers

//Добавление в массив
var numbers  = [8, 11, 13, 14]
numbers.append(20)
print(numbers)  // 8, 11, 13, 14, 20

//Удаление из массива
var numbers = [8, 11, 13, 14]
numbers.remove(at: 2)   // удаляем 3-й элемент
print(numbers)  // 8, 11, 14

// Некоторые системные методы для выполнения домашней работы

var wordsText = "1:2:3:4:5"
var wordsArray = wordsText.split(separator: "") // [1,2,3,4,5]

var wordUppercased = "WORD"
var wordLowerased = wordUppercased.lowercased() // word
var originalWordUppeccased = wordLowerased.uppercased() //WORD

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

// Пересечение - intersection (НАЙТИ ПОЛЬЗОВАТЕЛЕЙ КОТОРЫЕ БЫЛМ РАНЕЕ ЗАРЕГЕСТРИРОВАНЫ
var users = Set<String>(["alex", "valera", "uriy", "sergey"])

var newUsers = Set<String>([])

newUsers.insert("vova")
newUsers.insert("ivan")
newUsers.insert("sergey")
newUsers.insert("alex")

print("\(users.intersection(newUsers)) - уже зарегестрированы в системе")

///////////////////////////////-----------------------------------------------------------------------------------------------------------------------------------------

//Разность subtracting (НАЙТИ ПОЛЬЗОВАТЕЛЕЙ КОТОРЫЕ БЫЛИ РАНЕЕ ЗАРЕГЕСТРИРОВАНЫ НО НЕТ В НОВОМ СПИСКЕ

print("ПОЛЬЗОВАТЕЛИ КОТОРЫЕ БЫЛИ РАНЕЕ ЗАРЕГЕСТРИРОВАНЫ НО НЕТ В НОВОМ СПИСКЕ \(users.subtracting(newUsers))")

///////////////////////////////-----------------------------------------------------------------------------------------------------------------------------------------

// Исключающее или (элементы, которые присутствуют только в одном из множеств)

//Разность symmetricDifference (НАЙТИ ПОЛЬЗОВАТЕЛЕЙ КОТОРЫЕ ЕСТЬ СПИСКАХ НО НЕ В ОБОИХ ОДНОВРЕМЕННО

print("ПОЛЬЗОВАТЕЛЕЙ КОТОРЫЕ ЕСТЬ СПИСКАХ НО НЕ В ОБОИХ ОДНОВРЕМЕННО \(users.symmetricDifference(newUsers))")

// НАЙТИ ЛЮБОЙ ЭЛЕМЕНТ В МАССИВЕ МОЖНО С ПОМОЩЬЮ CONTINUE

print("\(users.contains("alex") ? "Алекс есть в списке USERS" : "Алекса нет в списке USERS")")

// Функции

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
