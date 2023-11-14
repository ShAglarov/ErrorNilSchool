//
//  main.swift
//  ErrorNilSchool
//
// Lesson-11

import Foundation

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

// -------------------------------------------------------------

struct MyArray<Element: Comparable> {
    let elements: [Element]
    
    init(_ elements: [Element]) {
        self.elements = elements
    }
    
    // Функция, которая сортирует элементы по возрастанию
    func sortAscending() -> MyArray<Element> {
        let sortedElements = elements.sorted { $0 < $1 }
        return MyArray<Element>(sortedElements)
    }
    
    //    //Функция, сортирующая элементы в порядке возрастания.
    func sortAscending2() -> [Element] {
        return elements.sorted { $0 < $1 }
    }
}


let numbers = MyArray([10, 3, 2, 5, 4, 7, 1, 9])
let sortedArray = numbers.elements
let sortedArray2 = numbers.sortAscending2()

sortedArray.forEach({ element in
    print(element, terminator: " ")
})
print()
sortedArray2.forEach( { print($0, terminator: " ") })
print()

/// -------------------------------------------------------------

extension MyArray {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for item in self.elements {
            result.append(transform(item))
        }
        return result
    }
}

let incrementedNumbers = numbers.myMap { $0 + 1 }
print(incrementedNumbers) // Выведет: [11, 4, 3, 6, 5, 8, 2, 10]

/// -------------------------------------------------------------

extension MyArray {
    func myFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        for item in self.elements {
            if isIncluded(item) {
                result.append(item)
            }
        }
        return result
    }
}

let evenNumbers = numbers.myFilter { $0 % 2 == 0 }
let evenNumbers2 = numbers.myFilter( { element in
    element % 2 == 0
})
print(evenNumbers) // Выведет: [10, 2, 4]
print(evenNumbers2) // Выведет: [10, 2, 4]