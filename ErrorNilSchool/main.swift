//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson-6

/*
 Структуры в Swift могут включать в себя множество различных функциональных возможностей, например:

 1. Вычисляемые свойства: Свойства, которые вычисляют значения на основе других свойств.
 Свойства и методы типа (Static properties/methods): Свойства и методы, которые принадлежат самому типу, а не его экземплярам.
 2. Подпрограммы: Структуры могут содержать функции, которые принимают параметры и/или возвращают значения.
 4. Сабскрипты: Определения, которые позволяют использовать объекты структуры с квадратными скобками, чтобы получить или установить значения, как если бы объект был массивом или словарем.
 5. Расширения (Extensions): Структуры могут быть расширены с помощью расширений для добавления новой функциональности.
 6. Соблюдение протоколов (Conformance to protocols): Структуры могут соблюдать протоколы для предоставления стандартной функциональности.
 Вот примеры, демонстрирующие некоторые из этих возможностей:
 */

import Foundation

struct People {
    
    var name: String
    
    // Наблюдатели свойств willSet/didSet
    var age: Int {
        willSet(newAge) {
            print("\(name) собирается отметить день рождения! Ему будет \(newAge)!")
        }
        didSet {
            if age != oldValue {
                print("Поздравляем, \(name)! Теперь тебе \(age) лет.")
            }
        }
    }
    // вычисляемое свойство
    var status: String {
        if age >= 18 {
            return "\(name) является взрослым"
        } else {
            return "\(name) ещё ребенок"
        }
    }
    
    init?(data: String) {
        let components = data.split(separator: ",")
        
        if components.count != 2 { return nil }
        
        let nameComponent = components[0].trimmingCharacters(in: .whitespaces)
        let ageComponent = components[1].trimmingCharacters(in: .whitespaces)
        
        guard let age = Int(ageComponent) else { return nil }
        
        self.name = String(nameComponent)
        self.age = age
    }
    
    mutating func haveBirthday() {
        self.age += 1
    }
    
    func displayInfo() {
        print("Имя: \(name), Возраст \(age)")
    }
    
    subscript(index: Int) -> String {
        switch index {
        case 0:
            return String(name.first ?? Character(" "))
        case 1:
            return String(status.first ?? Character(" "))
        default:
            return "Неверный индекс"
        }
    }
}

extension People {
    func wishHappyBirthday() {
        print("С Днем Рождения, \(name)! Тебе исполнилось \(age) лет!")
    }
}


var alex = People(data: "   Alex  ,   17")

alex?.displayInfo()  // Вывод: Имя: Alex, Возраст 17
print(alex?.status ?? "No data")  // Вывод: Alex ещё ребенок

alex?.haveBirthday()  // Ваш возраст изменился и теперь составляет 18
print(alex?.status ?? "No data")  // Вывод: Alex является взрослым

alex?.wishHappyBirthday()  // Вывод: С Днем Рождения, Alex! Тебе исполнилось 18 лет!

if let alex = alex {
    print(alex[0])  // Вывод: A
    print(alex[1])  // Вывод: A
    print(alex[2])  // Вывод: Неверный индекс
}

struct Smartphone {
    // Приватные свойства
    private var batteryPercentage: Int
    private var maxBatteryPercentage: Int = 100
    
    // Вычисляемое свойство для представления уровня заряда батареи в виде строки.
    var batteryLevel: String {
        get {
            // Возвращаем текущий процент заряда в формате строки с добавлением символа "%".
            return "\(batteryPercentage)%"
        }
        
        // Часть `set` позволяет устанавливать уровень заряда батареи, используя строку в формате "N%".
        set(newBatteryLevel) {
            // Удаляем символ "%" из входной строки для получения чистого числового значения.
            let cleanedString = newBatteryLevel.replacingOccurrences(of: "%", with: "")
            
            // Попытка преобразовать очищенную строку в целое число.
            if let newBattery = Int(cleanedString),
                   newBattery >= 0, newBattery <= 100 {
                // Если преобразование строки в целое число успешно,
                // и новое значение заряда находится в допустимом диапазоне:
                self.batteryPercentage = newBattery
            }
        }
    }
    // Свойство с наблюдателями
    public var isPoweredOn: Bool {
        willSet {
            print("Состояние питания изменится на: \(newValue ? "Включено" : "Выключено")")
        }
        didSet {
            if isPoweredOn {
                print("Телефон включен.")
            } else {
                print("Телефон выключен.")
            }
        }
    }
    
    // Инициализаторы
    public init(batteryPercentage: Int, isPoweredOn: Bool) {
        self.batteryPercentage = min(maxBatteryPercentage, max(0, batteryPercentage))
        self.isPoweredOn = isPoweredOn
    }
    
    public init?(description: String) {
        let components = description.split(separator: " ")
        // Проверяем, что у нас есть ровно два компонента (для процента заряда и состояния питания).
        guard components.count == 2,
              // Также пытаемся преобразовать первый компонент (строку процента заряда) в целое число,
              // удаляя символ "%" и убеждаемся,
              let battery = Int(components[0].trimmingCharacters(in: CharacterSet(charactersIn: "%"))),
              // что заряд батареи находится в диапазоне от 0 до 100.
                battery >= 0 && battery <= 100
        else {
            // Если какое-либо из этих условий не выполнено, инициализация завершается неудачей и возвращает nil.
            return nil
        }
        
        // Если все проверки прошли успешно, устанавливаем свойство batteryPercentage
        // равным полученному проценту заряда.
        self.batteryPercentage = battery
        
        // Устанавливаем свойство isPoweredOn в зависимости от второго компонента:
        // если он равен "on", то isPoweredOn = true, в противном случае isPoweredOn = false.
        self.isPoweredOn = components[1] == "on"
    }
    
    
    
    // Мутирующие методы
    public mutating func chargeBattery(by amount: Int) {
        self.batteryPercentage = min(maxBatteryPercentage, batteryPercentage + amount)
    }
    
    public mutating func useBattery(by amount: Int) {
        self.batteryPercentage = max(0, batteryPercentage - amount)
    }
    
    // Деструкторы в структурах Swift не поддерживаются
    
    // Subscript
    public subscript(key: String) -> String? {
        switch key {
        case "battery":
            return batteryLevel
        case "power":
            return isPoweredOn ? "on" : "off"
        default:
            return nil
        }
    }
}

extension Smartphone {
    func batteryStatus() -> String {
        switch batteryPercentage {
        case 0:
            return "Батарея полностью разряжена"
        case 1...20:
            return "Низкий уровень заряда"
        case 21...50:
            return "Средний уровень заряда"
        case 51...80:
            return "Хороший уровень заряда"
        case 81...100:
            return "Отличный уровень заряда"
        default:
            return "Неопределенный статус батареи"
        }
    }
}

extension String {
    var batteryStatus: String {
        // Попытка преобразовать строку (без знака %) в число
        guard let batteryPercentage = Int(self.replacingOccurrences(of: "%", with: "")) else {
            return self + " - Неопределенный статус батареи"
        }
        
        switch batteryPercentage {
        case 0:
            return self + " - Батарея полностью разряжена"
        case 1...20:
            return self + " - Низкий уровень заряда"
        case 21...50:
            return self + " - Средний уровень заряда"
        case 51...80:
            return self + " - Хороший уровень заряда"
        case 81...100:
            return self + " - Отличный уровень заряда"
        default:
            return self + " - Неопределенный статус батареи"
        }
    }
}

func startProgramm() {
    // Пример использования
    guard let newPhone = Smartphone(description: "33% on") else { return }

    print(newPhone.batteryLevel.batteryStatus) // выводит: 70%
    print(newPhone.isPoweredOn)  // выводит: true
    print(newPhone["battery"]!)   // выводит: 70%
    print(newPhone["power"]!)     // выводит: on

    print(newPhone.batteryStatus()) // выводит: Хороший уровень заряда
}

startProgramm()
