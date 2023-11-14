//
//  main.swift
//  ErrorNilSchool
//
//Lesson-9

import Foundation

class Fighter {
    var name: String
    var typeFighter: String {
        return "какой то боец"
    }
    var weapon: Weapon
    private var _hp: Int = 0
    
    var hp: Int {
        get { return _hp }
        set {
            _hp = newValue
        }
    }
    var strenght: Int {
        return 1
    }
    
    init(name: String, hp: Int, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
        self.hp = hp
    }
    
    func reduseDamage() {
        let damage = strenght * 10
        print("нанес \(damage) урона")
        _hp = max(0, _hp - damage)
    }
    
    func attack() {
        print("\(typeFighter), \(name), ударил и", terminator: " ")
    }
    func balanceHP() {
        print("Осталось жизней \(_hp)")
    }
    func isDead() -> Bool {
        _hp <= 0 ? true : false
    }
    deinit {
        print("\(typeFighter) класс уничтожился")
    }
}

class Warrior: Fighter {
    override var typeFighter: String {
        return "Warrior"
    }

    override var strenght: Int {
        3
    }
    override func attack() {
        if isDead() {
            print("\(name) мертв")
        } else {
            super.attack()
            super.reduseDamage()
        }
    }
    
    init?(name: String, weapon: Weapon) {
        super.init(name: name, hp: 100, weapon: weapon)
        if name.isEmpty || hp <= 0 {
            return nil
        }
    }
}

class Mag: Fighter {
    override var typeFighter: String {
        return "Mag"
    }

    override var strenght: Int {
        2
    }
    override func attack() {
        if isDead() {
            print("\(name) мертв")
        } else {
            super.attack()
            super.reduseDamage()
        }
    }
    
    init?(name: String, weapon: Weapon) {
        super.init(name: name, hp: 100, weapon: weapon)
        if name.isEmpty || hp <= 0 {
            return nil
        }
    }
}

class Weapon {
    let nameWeapon: String
    var owner: Fighter?
    
    init(nameWeapon: String) {
        self.nameWeapon = nameWeapon
    }
}


func startFighter() {
    
    let weapon = Weapon(nameWeapon: "Меч")
    let fighter = Warrior(name: "Alex", weapon: weapon)
    
    weapon.owner = fighter
}

startFighter()

print("end")

struct Person: Hashable {
    let name: String
    let age: Int
}
var dictionary = [Person : String]()
let person = Person(name: "Alex", age: 30)
let person2 = Person(name: "Max", age: 30)
dictionary[person] = "Программист"
dictionary[person2] = "Сисадмин"

extension Person: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.age == rhs.age
    }
}

if person == person2 {
    print("объекты равны")
} else {
    print("Объекты не равны")
}


extension Person: CustomStringConvertible {
    var description: String {
        "\(name), \(age) лет"
    }
}
print(person)

protocol PeopleProtocol {
    var name: String { get set }
    var _strength: Int? { get }
}

extension PeopleProtocol {
    func startTrainingFight() {
        print("\(name) начал тренировку")
    }
}

protocol FighterProtocol {
    var typeFighter: TypeFighter  { get }
}

protocol AttackProtocol: PeopleProtocol  {
}
extension AttackProtocol {
    func attacking() -> Int {
        (_strength ?? 0) * 2
    }
}

enum TypeFighter: CustomStringConvertible {
    case warrior
    case mag
    
    var description: String {
        switch self {
        case .warrior:
            return "Воин"
        case .mag:
            return "Маг"
        }
    }
}

struct People: PeopleProtocol {
    
    var name: String
    var _strength: Int?
    
}

struct Warrior: FighterProtocol, AttackProtocol {
    
    var name: String
    
    var typeFighter: TypeFighter {
        .warrior
    }
    var _strength: Int?
    
    func attacking() -> Int {
        (_strength ?? 0) * 3
    }
}

struct Mag: FighterProtocol, AttackProtocol {
    
    var name: String
    
    var typeFighter: TypeFighter {
        .mag
    }
    var _strength: Int?
}

let people = People(name: "Alex")

let warrior = Warrior(name: "Max",_strength: 50)
let mag = Mag(name: "Alex",_strength: 50)

print(people)

print("\(warrior.typeFighter) \(warrior.attacking())")
print("\(mag.typeFighter) \(mag.attacking())")