//
//  main.swift
//  ErrorNilSchool
//
//  5th Stream
//Lesson-7

import Foundation

//------------Еще разница между struct и class-----------------------

/*
 1_Ссылочный тип vs Значимый тип:
 *_ Классы являются ссылочными типами. Это означает, что когда вы присваиваете экземпляр
    класса переменной или константе, вы фактически присваиваете ссылку на этот объект.
 *_ Структуры являются значимыми типами. Когда вы присваиваете экземпляр структуры
    переменной или константе, создается копия этой структуры.
 2_Наследование:
 *_ Классы могут наследовать свойства и методы от других классов.
 *_ Структуры не поддерживают наследование.
 3_Деинициализаторы:
 *_ Классы могут иметь деинициализаторы, которые выполняют определенный код перед тем,
    как экземпляр удаляется из памяти.
 *_ Структуры не имеют деинициализаторов.
 4_Идентичность и равенство:
 *_ У классов есть понятие "идентичности".
    Вы можете проверить, указывают ли две переменные на один и тот же объект с помощью операторов "===" и "!==".
 *_ Структуры не имеют понятия идентичности. Они сравниваются только на равенство.
 5_Возможность изменения свойств:
 *_ Для классов, если свойство объявлено как var, то оно может быть изменено из любого экземпляра,
    даже если этот экземпляр объявлен как let.
 *_ Для структур, если экземпляр объявлен как let, то все его свойства становятся неизменяемыми,
    независимо от того, были ли свойства объявлены как var или let.
 6_ARC (Automatic Reference Counting):
 *_ Классы поддерживают автоматическое подсчета ссылок (ARC), которое управляет жизненным циклом экземпляра.
    Это может привести к утечкам памяти, если не управлять сильными циклическими ссылками (например, с использованием weak или unowned).
 *_ Структуры не участвуют в ARC, так как они копируются при передаче и не используют ссылочный подсчет.
 7_Синтаксис инициализации:
 *_ Структуры автоматически получают инициализатор "по членам", который позволяет инициализировать каждое свойство структуры.
 *_ Классам такой инициализатор предоставляется автоматически только в отсутствие пользовательских инициализаторов.
 8_Мутация Методов:
 *_ В структурах, методы, которые изменяют свойства структуры, должны быть помечены ключевым словом mutating.
   Это делает очевидным, что метод изменяет структуру.
 *_ В классах такой необходимости нет, так как любой метод может изменить свойства класса.
 9_Type Casting:
 *_ Классы поддерживают приведение типов (type casting) с использованием as?, as! и is.
 *_ Структуры не поддерживают приведение типов в иерархии наследования, так как у них нет наследования.
 8_Extensions:
 И классы, и структуры могут быть расширены с помощью extension, но если вы добавите
 новый инициализатор в расширении структуры, он не сможет изменять свойства,
 объявленные как let, если у них уже есть значения по умолчанию.
 9_Ключевое слово self:
 В Swift ключевое слово self используется для обозначения текущего экземпляра объекта, структуры или перечисления.
 Однако его использование и поведение слегка различаются в контексте классов и структур.
 *_ В классах: self обычно используется для различия свойств и методов класса от
    параметров функций или для ссылки на текущий экземпляр класса. Поскольку классы являются
    ссылочными типами, self в методе класса ссылается на тот же экземпляр, что и другие ссылки на этот экземпляр.
 *_ В структурах: Как и в классах, self указывает на текущий экземпляр структуры.
    Однако при работе с методами, которые модифицируют структуру (отмечены как mutating),
    self представляет измененный экземпляр, который заменяет исходный экземпляр после завершения метода.
 */

//-----------------------------------------------------------------------------------------------------------

struct Point {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

var point1 = Point(x: 1, y: 2)


func updatePoint(_ point: Point) {
    var tempPoint = point

    tempPoint.x = 10
    tempPoint.y = 5

    point.x = 10
    point.y = 5

    point1 = point
}

updatePoint(point1)

print(point1.x)
print(point1.y)

class Point2 {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func updatePoint(_ point: Point2) {

    point.x = 10
    point.y = 5
}

var point2 = Point2(x: 1, y: 2)

updatePoint(point2)

print(point2.x)
print(point2.y)

//-----------------------------------
Инкапсуляция

class BankAccount {
    // private свойство: недоступно извне класса
    private var balance: Double = 0.0

    // метод для добавления средств на счет
    func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("Внесено \(amount)$. Баланс: \(balance)$.")
        } else {
            print("Недопустимая сумма для внесения.")
        }
    }

    // метод для снятия средств со счета
    func withdraw(amount: Double) {
        if amount > 0 && amount <= balance {
            balance -= amount
            print("Снято \(amount)$. Баланс: \(balance)$.")
        } else {
            print("Недопустимая сумма для снятия или недостаточно средств.")
        }
    }

    // метод для получения текущего баланса
    func getBalance() -> Double {
        return balance
    }
}

let account = BankAccount()
account.deposit(amount: 500)
account.withdraw(amount: 100)
print("Текущий баланс: \(account.getBalance())$")
// account.balance будет недоступен из-за модификатора private

//-----------------------------------
наследование

class Arena {
    let boxer = Boxer()
    let wrestler = Wrestler()
    let karateka = Karateka()
    let judoka = Judoka()
    let muayThaiFighter = MuayThaiFighter()
}

class Fighter {
    func superAttack() {
        print("Боец атакует!")
    }
}

class Boxer: Fighter {
    override func superAttack() {
        print("Мощный прямой удар от боксёра!")
    }
}

class Wrestler: Fighter {
    override func superAttack() {
        print("Разрушительное бросание от рестлера!")
    }
}

class Karateka: Fighter {
    override func superAttack() {
        print("Высокий удар ногой от каратиста!")
    }
}

class Judoka: Fighter {
    override func superAttack() {
        print("Быстрое и ловкое бросание от дзюдоиста!")
    }
}

class MuayThaiFighter: Fighter {
    override func superAttack() {
        print("Опасный удар локтем от бойца Муай Тай!")
    }
}

let arena = Arena()
arena.boxer.superAttack()
arena.wrestler.superAttack()
arena.karateka.superAttack()
arena.judoka.superAttack()
arena.muayThaiFighter.superAttack()

//-----------------------------------
Полиморфизм

class Arena {
    let boxer = Boxer()
    let wrestler = Wrestler()
    let karateka = Karateka()
    let judoka = Judoka()
    let muayThaiFighter = MuayThaiFighter()
}

class Boxer {
    func superPunch() {
        print("Мощный прямой удар от боксёра!")
    }
}

class Wrestler {
    func superSlam() {
        print("Разрушительное бросание от рестлера!")
    }
}

class Karateka {
    func superKick() {
        print("Высокий удар ногой от каратиста!")
    }
}

class Judoka {
    func superThrow() {
        print("Быстрое и ловкое бросание от дзюдоиста!")
    }
}

class MuayThaiFighter {
    func superElbow() {
        print("Опасный удар локтем от бойца Муай Тай!")
    }
}

let arena = Arena()
arena.boxer.superPunch()
arena.wrestler.superSlam()
arena.karateka.superKick()
arena.judoka.superThrow()
arena.muayThaiFighter.superElbow()

//-----------------------------------
