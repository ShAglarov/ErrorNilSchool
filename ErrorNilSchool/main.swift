//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson - 2

import Foundation

//-----------------------------------------------------------------------
//Тернарный оператор
//[первый операнд - условие] ? [второй операнд] : [третий операнд]
var num1 = 5
var num2 = 2

var res1 = num1 > num2 ? "\(num1) больше чем \(num2)" : "\(num2) больше чем \(num1)" // 5 больше чем 2
var res2 = num1 > num2 ? num1 * num2 : num1 + num2 // 10


//-----------------------------------------------------------------------
//Цикл for-in

for item in 1...5 {
    print(item)
}
for i in 0...10 where i % 2 == 0 {
 
    print(i) // 0, 2, 4, 6, 8, 10
}
//-----------------------------------------------------------------------
//Функции
func printName(){
 
    print("Меня зовут Том")
}

func printInfo(name: String, age: Int){
 
    print("Имя: \(name) ; возраст: \(age)")
}
 
printInfo(name: "Tom", age: 18)   // Имя: Tom ; возраст: 18
printInfo(name: "Bob", age: 35)   // Имя: Bob ; возраст: 35
//-----------------------------------------------------------------------
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

for index in 0..<5 {
    sleep(1)
    print(index)
}
