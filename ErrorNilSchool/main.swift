//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson-8

import Foundation

class Animal {
    
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
    var type: String {
        switch self {
        case is Cat:
            return "Кошка"
        case is Dog:
            return "Собака"
        default:
            return "Животное"
        }
    }
    
    func sleep() -> String {
        "я \(type) в данный момент нахожусь в спящем состоянии"
    }
    
    func displayInfo() {
        print("Меня зовут \(name) и \(sleep())")
    }
}

class Cat: Animal {
    
    var sound: String
    
    init(name: String, sound: String) {
        self.sound = sound
        super.init(name: name) // вызываем инициализатор родительского класса
    }
    
    required init(name: String) {
        self.sound = "Мяу"
        super.init(name: name)
    }
    
    func play() {
        print("\(super.type) играет")
    }
    
    override func sleep() -> String {
        "\(super.sleep()) и продолжаю спать, еще раз повторюсь я \(super.type)"
    }
}

class Dog: Animal {
    
    var sound: String
    
    init(name: String, sound: String) {
        self.sound = sound
        super.init(name: name) // вызываем инициализатор родительского класса
    }
    
    required init(name: String) {
        self.sound = "Гав"
        super.init(name: name)
    }
   
    func play() {
        print("\(super.type) играет")
    }
    
    override func sleep() -> String {
        "\(super.sleep()) и продолжаю спать, еще раз повторюсь я \(super.type)"
    }
    
}

let myCat = Cat(name: "Мурзик", sound: "Мяу-мяу")
let myDog = Dog(name: "Шарик", sound: "Гав-гав")

let MyCat2 = Cat(name: "Вискас")

print(myCat.type) // Кошка
print(myDog.type) // Собака

// Output: я Кошка в данный момент нахожусь в спящем состоянии и продолжаю спать, еще раз повторюсь я Кошка
print(myCat.sleep())

// Output: я Собака в данный момент нахожусь в спящем состоянии и продолжаю спать, еще раз повторюсь я Собака
print(myDog.sleep())

// Output: Меня зовут Мурзик и я Кошка в данный момент нахожусь в спящем состоянии и продолжаю спать, еще раз повторюсь я Кошка
myCat.displayInfo()

// Output: Меня зовут Шарик и я Собака в данный момент нахожусь в спящем состоянии и продолжаю спать, еще раз повторюсь я Собака
myDog.displayInfo()

//Меня зовут Вискас и я Кошка в данный момент нахожусь в спящем состоянии и продолжаю спать, еще раз повторюсь я Кошка
MyCat2.displayInfo()

print(MyCat2.sound) // Мяу
print(myDog.sound)  // Гав-гав



// Основной класс Fighter, который будет использоваться как базовый для создания бойцов
class Fighter {
    var name: String
    var weapon: Weapon
    private var _hp: Int

    var hp: Int {
        get { return _hp }
        set { _hp = max(0, newValue) } // Защита от отрицательного здоровья
    }

    // Эти свойства и методы предназначены для переопределения в подклассах
    var typeFighter: String { return "Generic Fighter" }
    var strength: Int { return 1 }

    init(name: String, hp: Int, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
        self._hp = hp
    }

    func reduceDamage() {
        let damage = strength * 10
        print("dealt \(damage) damage")
        hp -= damage // использование hp обеспечивает, что _hp не будет отрицательным
    }

    func attack() {
        guard !isDead() else {
            print("\(name) is dead")
            return
        }
        print("\(typeFighter), \(name), attacked and", terminator: " ")
        reduceDamage()
    }

    func balanceHP() {
        print("Remaining health: \(hp)")
    }

    func isDead() -> Bool {
        return hp <= 0
    }

    deinit {
        print("\(typeFighter) class destroyed")
    }
}

// Класс Weapon, представляющий оружие или способность
class Weapon {
    let nameAbility: String
    weak var owner: Fighter?

    init(nameAbility: String) {
        self.nameAbility = nameAbility
    }
}

// Класс Warrior, который наследуется от Fighter и специализируется
class Warrior: Fighter {
    override var typeFighter: String { return "Warrior" }
    override var strength: Int { return 3 }

    init?(name: String, weapon: Weapon) {
        super.init(name: name, hp: 100, weapon: weapon)
        if name.isEmpty {
            return nil
        }
    }
}

// Класс Mag, который также наследуется от Fighter и специализируется
class Mag: Fighter {
    override var typeFighter: String { return "Mag" }
    override var strength: Int { return 2 }

    init?(name: String, weapon: Weapon) {
        super.init(name: name, hp: 100, weapon: weapon)
        if name.isEmpty {
            return nil
        }
    }
}

// Функции для тестирования созданных классов и их методов
func startFighter1() {
    let sword = Weapon(nameAbility: "Sword")
    let warrior = Warrior(name: "Alex", weapon: sword)

    sword.owner = warrior
    warrior?.attack()
    warrior?.balanceHP()
}

func startFighter2() {
    let fireball = Weapon(nameAbility: "Fireball")
    let mag = Mag(name: "Max", weapon: fireball)

    fireball.owner = mag
    print("\(fireball.nameAbility) is held by \(fireball.owner?.name ?? "nobody")")

    mag?.attack()
    mag?.balanceHP()
}

// Запуск функций для демонстрации работы классов и методов
startFighter1()
startFighter2()
print("end")



