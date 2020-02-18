import UIKit
//OOPS:
//1.Classes
//2.Objects
//3.Properties
//4.Methods
//5.Access Control
//6.Encapsulation
//7.Abstraction
//8.Inheritance
//9.Method Overloading
//10.Method Overriding
//11.Polymorphism

//1.Classes

//Classes can be compared to a real-world group to which certain items or objects or living beings belong and each of these has similar kind of properties as present in the group
class Person {
    //we can declare human property here
    var age: Int?
    func displayAge() {
        print("myage is \(age ?? 0)")
    }
}

//2.Objects
//An object is anything that you see which comes from a particular class

let person = Person()

//3.Properties
//properties of a class are common attributes of that class that can be shared across each object which is derived from it
person.age = 25 //here, age is property

//4.Methods
//Methods or Functions are the behavior of the objects of a class
person.displayAge()

//5.Access Control: public, private, internal, fileprivate, open

//6.Encapsulation : Encapsulation is a concept by which we hide data and methods from outside, intervention and usage.
class Maths {
    let a, b: Int!
    private var result: Int?
    init(a: Int,b: Int) {
        self.a = a
        self.b = b
    }
    func add() {
        result = a + b
    }
    func displayResult() {
        print("Result is \(result ?? 0)")
    }
}
let calculation = Maths(a: 2, b: 3)
calculation.add()
calculation.displayResult()
//print(calculation.result) : 'result' is inaccessible due to 'private' protection level
/*
We declared two variables required for inputting values.
Initialise the variables.
We declare a method to add the two variables
And then another method to display the result.
In the above example, we encapsulated the variable “result” by using the access specifier “private”. We hide the data of variable “result” from any outside intervention and usage.
*/

//7.Abstraction
protocol PersonalDetails {
    func getAddress()
}
extension PersonalDetails {
    func getAddress() {
        print("17th main, 26th cross")
    }
}
/*
 Abstraction is an OOP concept by which we expose relevant data and methods of an object hiding their internal implementation.
 Eg. When we go to a shop to buy a product, we just get the product that we want. The shopkeeper doesn’t tell us about how the product was bought. We can think this as an example of abstraction.
 In our example in encapsulation, we are exposing displayTotal() and add() method to the user to perform the calculations, but hiding the internal calculations.
 */


//8.Inheritance
//Inheritance is a process by which a child class inherits the properties of its parent class.

class Women: Person {
    func display(name: String) {
        print("name is \(name)")
    }
    func display(age: Int) {
        print("age is \(age)")
    }
    override func displayAge() {
        print("Child class women age")
    }
}
let women = Women()
women.age = 30
print("women age is \(women.age ?? 50)")

//9.Method Overloading
//Method overloading is the process by which a class has two or more methods with same name but different parameters.
women.display(age: 10)
women.display(name: "xyzzz")

//10.Method Overriding
//Overriding is the process by which two methods have the same method name and parameters. One of the methods is in the parent class and the other is in the child class
women.displayAge()

//11.Polymorphism
//Objects of the same class can behave independently within the same interface.

class Canvas {
    let width = 320
    let height = 240
    let value = 100
    func draw() {
        print("width: \(width), height: \(height)")
    }
}

class DisplayCanvas: Canvas {
    override func draw() {
        print("width: \(width), height: \(height), color space: \(value)")
    }
}

let canvas: Canvas = DisplayCanvas()
canvas.draw()


class Shape {
    var area: Double?
    func calculateArea(valueA: Double, valueB: Double) {
    }
}
class Triangle: Shape {
    override func calculateArea(valueA: Double, valueB: Double) {
        area = (valueA * valueB) / 2
    }
}
/*
 We now have created a subclass called Triangle and have overridden the function to calculate the area.
 We’re calling the same function, but the code inside is relevant to a triangle only.
 This is polymorphism in action. The class Shape has a contract that all subclasses must follow which is to use the function
 */
