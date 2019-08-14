import UIKit


//Strictly speaking, initializers do not return a value. Rather, their role is to ensure that self is fully and correctly initialized by the time that initialization ends. Although you write return nil to trigger an initialization failure, you do not use the return keyword to indicate initialization success


//what is protocol:  A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

//1. How to declare protocol as optional in swift
//We can use that protocol method in extension, so that It will become optional type

protocol PersonalDetail {
    func getAddressDetail()
    func getEducationDetail()
}

//IF write any protocol Method is in extension that method become optional
extension PersonalDetail {
    func getEducationDetail() {
        print("Higher Education is B.E")
    }
}

class Person: PersonalDetail {
    func getAddressDetail() {
        print("Hsr layout")
    }
}
var person = Person()
person.getAddressDetail()
person.getEducationDetail()

//2.How to check that only particular class only confirm particular protocol
class Person1: PersonalDetail {
    func getAddressDetail() {
        print("bangalore")
    }
}


//Here AddressDetail any one can confirm , How to restrict that
//diff b/w self(this will bahave like same type of instance) & Self(this will use for protocol)
protocol AddressDetail where Self: Apartment {
    func getHomeAddress()
}

class Apartment: AddressDetail {
    func getHomeAddress() {
        print("House no: 895")
    }
}


//class Building: AddressDetail {
//    func getHomeAddress() {
//
//    }
//}


/**
 - Static dispatch
 - when we access extension method by creating type of protocol, that will be static dispatch
 */

protocol CollegeCurriculum {
    func getCollegeStream()
    func getSemester()
}


extension CollegeCurriculum {
    func getSemester() {
         print("extension of 7th sem")
    }
}

struct College: CollegeCurriculum {
    func getCollegeStream() {
        print("CSE")
    }
}

var college = College()
college.getCollegeStream()
//static dispatch
var college1: CollegeCurriculum = College()
college1.getSemester()

//Retrun type
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"

//Initializer Requirements

//Preventing Overrides: final
protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    //Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:
    required init(someParameter: Int) {
        
    }
}

//3. Adding Protocol Conformance with an Extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let hamster = Hamster(name: "Bandish")
let textRep: TextRepresentable = hamster
print(textRep.textualDescription)

//Collections of Protocol Types
//Protocol Inheritance


//4. Class-Only Protocols
//Any - value or reference types
//AnyObject - olny reference types
protocol SomeClassOnlyProtocol: AnyObject {
    // class-only protocol definition goes here
    func getName()
}

class ABC: SomeClassOnlyProtocol {
    func getName() {
        
    }
}
//Error: Non-class type 'PQR' cannot conform to class protocol 'SomeClassOnlyProtocol'
//struct PQR: SomeClassOnlyProtocol {
//
//}

//Checking for Protocol Conformance
// as or is - typecasting
