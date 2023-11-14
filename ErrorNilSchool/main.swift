//
//  main.swift
//  ErrorNilSchool
//
//  Lesson-12

import Foundation

enum SimpleError: Error {
    case invalidInput
    case divisionByZero
}

func divide(_ dividend: Double, by divisor: Double) throws -> Double {
    if divisor == 0 {
        throw SimpleError.divisionByZero
    }
    return dividend / divisor
}

do {
    try print(divide(10, by: 0))
} catch SimpleError.divisionByZero {
    print("Ошибка: деление на ноль!")
} catch {
    print("Неизвестная ошибка")
}

//----------------------------------------------------------------------------

//либо так
let result = try? divide(10, by: 0)

if let unwrappedResult = result {
    print("Результат: \(unwrappedResult)")
} else {
    print("Произошла ошибка при делении.")
}

//----------------------------------------------------------------------------
// Если мы уверены что функция не вызовит ошибки
func safeFunction() -> Int {
    return 42
}

let result2 = try! safeFunction() // Не вызывает ошибку, так что это безопасно
print(result)  // Выводит: 42

//----------------------------------------------------------------------------
//MARK: - ПРОБРАСЫВАНИЕ ОШИБОК
//Допустим, у нас есть приложение для чтения и анализа данных из файла:
//
//readFile(at:): читает файл.
//parse(data:): разбирает данные из файла.
//analyze(parsedData:): анализирует разобранные данные.

enum FileError: Error {
    case fileNotFound
    case invalidFormat
    case analysisFailed
}

func readFile(at path: String) throws -> Data {
    // Предположим, что здесь может возникнуть ошибка FileError.fileNotFound
    // ...
    return Data() // вернем пустые данные для примера
}

func parse(data: Data) throws -> [String: Any] {
    // Предположим, что здесь может возникнуть ошибка FileError.invalidFormat
    // ...
    return [:] // вернем пустой словарь для примера
}

func analyze(parsedData: [String: Any]) throws -> String {
    // Предположим, что здесь может возникнуть ошибка FileError.analysisFailed
    // ...
    return "Analysis Result"
}

func processData(from path: String) throws -> String {
    let data = try readFile(at: path)
    let parsedData = try parse(data: data)
    let result = try analyze(parsedData: parsedData)
    return result
}

do {
    try print(processData(from: "path/to/file"))
} catch {
    print("Ошибка: \(error)")
}

//----------------------------------------------------------------------------
//MARK: - try? в сочетании с оператором ?? для предоставления значения по умолчанию в случае ошибки:

enum SimpleError: Error {
    case someError
}

func riskyFunction() throws -> Int {
    throw SimpleError.someError
    return 42
}

let result = (try? riskyFunction()) ?? -1
print(result)  // Выводит: -1, так как функция выбросила ошибку

//----------------------------------------------------------------------------
//MARK: - Имитируем сетевой запрос

typealias ResultQuery = (Result<Data, NetworkError>) -> Void

enum NetworkError: Error {
    case urlError
    case serverError
}

func fetchData(from url: String, completion: @escaping ResultQuery) {
    // Случайное значение для имитации успешного или неудачного ответа
    let isSuccessfulResponse = Bool.random()

    if url == "validURL" && isSuccessfulResponse {
        let data = Data() // некие полученные данные
        completion(.success(data))
    } else if url != "validURL" {
        completion(.failure(.urlError))
    } else {
        completion(.failure(.serverError))
    }
}

// ИСПОЛЬЗОВАНИЕ

fetchData(from: "validURL") { result in
    switch result {
    case .success(let data):
        print("Данные успешно получены: \(data)")
    case .failure(let error):
        switch error {
        case .urlError:
            print("Ошибка: неверный URL")
        case .serverError:
            print("Ошибка: проблемы на сервере")
        }
    }
}
 //defer для выполнения кода перед выходом из блока кода, в котором может произойти ошибка. 
 //Это может быть полезно для очистки или закрытия ресурсов независимо от того, произошла ли ошибка или нет.
 enum DatabaseError: Error {
    case connectionFailed
    case invalidQuery
}

func fetchDataFromDatabase() throws -> [String] {
    // Предположим, что здесь устанавливается соединение с базой данных
    print("Установка соединения с базой данных")

    defer {
        // Этот код выполнится при выходе из функции,
        // независимо от того, произошла ли ошибка
        print("Закрытие соединения с базой данных")
    }

    let isSuccess = Bool.random()
    if !isSuccess {
        throw DatabaseError.connectionFailed
    }

    // Возвращаем данные, если соединение успешно
    return ["Data1", "Data2"]
}

do {
    let data = try fetchDataFromDatabase()
    print("Полученные данные: \(data)")
} catch DatabaseError.connectionFailed {
    print("Ошибка: не удалось подключиться к базе данных")
} catch {
    print("Неизвестная ошибка")
}
//В этом примере, независимо от того, возникает ли ошибка при подключении к базе данных или операция проходит успешно, блок defer гарантирует, 
//что соединение с базой данных будет закрыто. Это помогает предотвратить утечку ресурсов, таких как открытые соединения или файловые дескрипторы.