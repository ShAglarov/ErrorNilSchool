//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//

import Foundation

//3. Условные операторы
//Операции сравнения
//Операции сравнения сравнивают два значения и в зависимости от результата сравнения
//возвращают объект типа Bool: true или false.

let age = 18

if age >= 18 {
    print("Вы совершеннолетний!")
} else {
    print("Вы еще не совершеннолетний.")
}

if age > 150 {
    print("Некорректный возраст")
} else if age < 18 {
    print("Вы еще не совершеннолетний")
} else if age > 18 {
    print("Вы совершеннолетний")
} else {
    print("Вам ровно 18")
}

////////////


/*
 Однако в силу различных причин не всегда операнды представляют один и тот же тип.
 И также не всегда тип переменной или константы, которой присваивается результат операции,
 совпадает с типом операндов.
 И в подобных случаях необходимо выполнять преобразования типов.
 */

// Логические операции ! && ||

//Пример 1: Логическое "И" (&&)

let isSunny = true
let isWarm = true

if isSunny && isWarm {
    print("Сегодня хороший день для прогулки.")
} else {
    print("Погода не подходит для прогулки.")
}

let isWeekend = true
let isHoliday = false

if isWeekend || isHoliday {
    print("Сегодня можно отдохнуть.")
    !isSunny ? print("Останусь дома, погода не подоходит для поргулки") :
    print("Погода сегодня отличная можно выйти погулять")
} else {
    print("Сегодня рабочий день.")
}

//Тернарный оператор
//[первый операнд - условие] ? [второй операнд] : [третий операнд]
var num1 = 5
var num2 = 2

var res1 = num1 > num2 ? "\(num1) больше чем \(num2)" : "\(num2) больше чем \(num1)" // 5 больше чем 2
var res2 = num1 > num2 ? num1 * num2 : num1 + num2 // 10

// Предположим, у нас есть функция, которая принимает на вход возраст человека
// в виде строки и пытается определить, в какой возрастной категории он находится.
// Используем switch для определения возрастной категории
switch age {
case 0..<13:
    print("Ребенок")
case 13..<20:
    print("Подросток")
case 20..<60:
    print("Взрослый")
case 60...120:
    print("Пожилой")
default:
    print("Некорректный возраст")
}

switch age {
case let x where x > 100:
    print("Некорректный возраст")
case let x where x > 18:
    print("Взрослый")
default:
    print("Не взрослый")
}


//-----------------------------------------------------------------------
//3.4. Циклы
//Пример с for-in:

for item in 1...5 {
    print(item)
}
for i in 0...10 where i % 2 == 0 {
    
    print(i) // 0, 2, 4, 6, 8, 10
}

for i in 0...10 {
    if i % 2 != 0 {
        continue
    }
    print(i)
}

// опциональный тип

var optionalName: String? = "Иван"

if let name = optionalName {
    print("Привет \(name)")
} else {
    print("Привет аноним")
}

let optionalAge: Int? = nil
let newAge = optionalAge ?? 0

------------
------------

var optionalName: String? = "Иван"
var optionalAge: Int? = nil


if let name = optionalName,
   let age = optionalAge {
    print("Привет \(name) тебе \(age) лет")
} else {
    print("Привет аноним")
}

guard let name = optionalName,
      let age = optionalAge else { return }

print(name)
print(age)

В режиме дебаггера Xcode:

Использование p для вывода значения переменной:

Copy code
(lldb) p intValue
Команда po для вывода описания объекта:

Copy code
(lldb) po objectName
expression для изменения значения переменной во время отладки:

Copy code
(lldb) expression intValue = 100
frame variable для просмотра переменных текущего фрейма:

Copy code
(lldb) frame variable
