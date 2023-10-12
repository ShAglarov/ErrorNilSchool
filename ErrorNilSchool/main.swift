//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
// Урок - 1

import Foundation

//Основы Swift - 3.1. Переменные и константы
var name = "Анна"
let birthYear = 2000

//2. Основные типы данных
// String, Int, Double, Bool.
var stringVar: String = "Hello, Swift!"
var intVar: Int = 10
var doubleVar: Double = 3.14
var boolVar: Bool = true

//1. String (Строки)
//Строки используются для хранения текстовой информации.
var hello: String = "Привет"
var world: String = "мир"
var greeting = hello + ", " + world + "!"
print(greeting) // Выведет: "Привет, мир!"

//2. Int (Целые числа)
//Для хранения целых чисел.
var age: Int = 25
var yearOfBirth = 2023 - age
print(yearOfBirth) // Выведет: 1998

//3. Double и Float (Вещественные числа)
//Для хранения чисел с плавающей запятой. Double имеет большую точность по сравнению с Float.
var piDouble: Double = 3.141592653589793
var piFloat: Float = 3.141592

/*
 Точность Float и Double определяется не количеством знаков после запятой, 
 а количеством битов, выделенных для их представления, а также структурой стандарта IEEE 754, который
 используется для представления чисел с плавающей запятой.

Float: Это число с плавающей запятой одинарной точности. 
Оно использует 32 бита:

Double: Это число с плавающей запятой двойной точности. 
Оно использует 64 бита:

Таким образом:
Float: примерно 6-9 десятичных знаков
Double: примерно 15-17 десятичных знаков
 */

//4. Bool (Булевы значения)
//Для представления логических значений true или false.
var isDay: Bool = true
var isNight = !isDay

//Для большинства встроенных типов данных Swift предоставляет свойства,
//позволяющие определить минимальные и максимальные значения. Вот примеры:
//1. Int
let minIntValue = Int.min
let maxIntValue = Int.max
print("Int: (\(minIntValue) ... \(maxIntValue))")

//1.2 Int8
let minInt8Value = Int8.min
let maxInt8Value = Int8.max
print("Int8: (\(minInt8Value) ... \(maxInt8Value))")
//1.3 Int16
let minInt16Value = Int16.min
let maxInt16Value = Int16.max
print("Int8: (\(minInt16Value) ... \(maxInt16Value))")
//1.4 Int32
let minInt32Value = Int32.min
let maxInt32Value = Int32.max
print("Int8: (\(minInt32Value) ... \(maxInt32Value))")
//1.5 Int64
let minInt64Value = Int64.min
let maxInt64Value = Int64.max
print("Int8: (\(minInt64Value) ... \(maxInt64Value))")

//3. UInt, UInt8, UInt16, UInt32, UInt64
//Пример для UInt (беззнаковый целочисленный тип):
let minUIntValue = UInt.min
let maxUIntValue = UInt.max
print("UInt: (\(minUIntValue) ... \(maxUIntValue))")

//4. Double
let minDoubleValue = Double.leastNormalMagnitude
let maxDoubleValue = Double.greatestFiniteMagnitude
print("Double: (\(minDoubleValue) ... \(maxDoubleValue))")

//5. Float
let minFloatValue = Float.leastNormalMagnitude
let maxFloatValue = Float.greatestFiniteMagnitude
print("Float: (\(minFloatValue) ... \(maxFloatValue))")

//3. Условные операторы
let age = 18

if age >= 18 {
    print("Вы совершеннолетний!")
} else {
    print("Вы еще не совершеннолетний.")
}
//3.4. Циклы
//Пример с for-in:
for i in 1...5 {
    print(i)
}



//Операции сравнения
//Операции сравнения сравнивают два значения и в зависимости от результата сравнения
//возвращают объект типа Bool: true или false.

//Оператор равенства (==): Проверяет, равны ли два значения.
let a = 5
let b = 5
if a == b {
    print("a равно b")
}
//Оператор неравенства (!=): Проверяет, не равны ли два значения.

let x = 10
let y = 20
if x != y {
    print("x не равно y")
}

//Оператор больше (>): Проверяет, является ли значение слева от оператора больше значения справа.

let m = 15
let n = 10
if m > n {
    print("m больше n")
}
//Оператор меньше (<): Проверяет, является ли значение слева от оператора меньше значения справа.

let p = 25
let q = 30
if p < q {
    print("p меньше q")
}
//Оператор больше или равно (>=): Проверяет, является ли значение слева от оператора больше или равным значению справа.

let a = 10
let b = 10
if a >= b {
    print("a больше или равно b")
}
//Оператор меньше или равно (<=): Проверяет, является ли значение слева от оператора меньше или равным значению справа.

let x = 20
let y = 30
if x <= y {
    print("x меньше или равно y")
}

//В арифметических операциях все операнды должны представлять один и тот же тип данных.
//Результатом операции является значение того же типа, что и тип операндов:
var a: Int8 = 10
var b: Int8 = 8
var c: Int8 = a + b
print(c)        // 18

let num1 = 22
let num2 = 15
if num1 > num2{
     
    print("num1 больше чем num2")
}

if num1{
     
    print("num1 больше чем num2")
}

let num1 = 22
let num2 = 15
if num1 > num2{
     
    print("num1 больше чем num2")
}
else{
    print("num1 меньше чем num2")
}

/*
 Но при сравнении чисел мы можем насчитать три состояния:
 первое число больше второго,
 первое число меньше второго и числа равны.
 Используя конструкцию else if, мы можем обрабатывать дополнительные условия:
 */

let num1 = 22
let num2 = 15
if num1 > num2{
     
    print("num1 больше чем num2")
}
else if (num1 < num2){
 
    print("num1 меньше чем num2")
}
else {
 
    print("num1 и num2 равны")
}

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

let isSunny = true
let isWarm = true

//Пример 2: Логическое "ИЛИ" (||)

let isWeekend = true
let isHoliday = false

if isWeekend || isHoliday {
    print("Сегодня можно отдохнуть.")
} else {
    print("Сегодня рабочий день.")
}

//Пример 3: Логическое отрицание (!)

let isRainy = true

if !isRainy {
    print("Сегодня не идет дождь.")
} else {
    print("Сегодня идет дождь.")
}

if isSunny && isWarm {
    print("Сегодня хороший день для прогулки.")
} else {
    print("Погода не подходит для прогулки.")
}

// Преобразование из Int в Double
let integerNumber = 42
let doubleNumber = Double(integerNumber)

// Преобразование из Double в Int
let doubleValue = 3.14159
let intValue = Int(doubleValue)

// Преобразование строки в целое число (Int)
let numberString = "123"
if let convertedNumber = Int(numberString) {
    print("Преобразованное число: \(convertedNumber)")
} else {
    print("Невозможно преобразовать строку в число")
}

// Преобразование числа в строку
let someNumber = 456
let stringFromNumber = String(someNumber)

//Конкатенация строк
//Для конкатенации (объединения) строк используется оператор + (плюс):
var str: String = ""    // ""
str += "hello"          // "hello"
str = str + " world"    // "hello word"

//Интерполяция строк

var age: Int = 22
var str: String = "Age: \(age)"     // "Age: 22"
 
var weight: Double = 70.58
str = "Age: \(age) and weight: \(weight)"       // "Age: 22 and weight: 70.58"
