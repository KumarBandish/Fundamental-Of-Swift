import UIKit
//https://www.bobthedeveloper.io/blog/intro-to-error-handling-in-swift
var str = "Hello, playground"

//1. Enum cases - use for try, catch, throw
//2. Error Handling with Init
//3. try! and try?

/*
 As you may know, Tesla cars have the autopilot feature. But, when the car gets confused for whatever reasons, it asks you to hold the handlebar and indicate an “error” message. In this lesson, you are going to learn how to give that message with Error Handling.
 */
//Introducing If-Else Statement
var isControl = true

func selfDrive() {
    if isControl {
        print("car is in control, you can start driving")
    } else {
        print("car is not in control, please dont start driving, stop the car")
    }
}
isControl = false
selfDrive()

//Problem
/*
 The biggest problem is its readability when the else block becomes bloated. First, it doesn’t indicate whether the function itself contains an error message unless you read through the entire function, unless you name the function like, selfDriveCanCauseError which still kinda works.
 
 - If handle not held within 5 seconds, car will shut down
 - Slow down the car
 - More code ...
 - More code ...
 else {
 slowDownTheCar()
 shutDownTheEngine()
 }
 */
//Introducing Error Handling

//Error protocol

enum TeslaError: Error {
    case lostGPS
    case lowBattery
}

//Let’s first send error messages without Error Handling implemented.

var lostGPS: Bool = true
var lowBattery: Bool = false

//func autoDriveTesla() {
//    if lostGPS {
//        print("I'm lost, bruh. Hold me tight")
//        // A lot more code
//    }
//
//    if lowBattery {
//        print("HURRY! 💀")
//        // Loads of code
//    }
//}


/*
 So, where do we insert that error message? Well, we know the function can possibly send two error messages: 1. TeslaError.lowBattery and 2. TeslaError.lostGPS. When the function throws an error, you have to “catch” those error thrown, and once “caught”, you print an error message. You might be a bit confused, so let’s take a look.
 

 */
func autoDriveTesla() throws {
    if lostGPS {
        throw TeslaError.lostGPS
    }
    if lowBattery {
        throw TeslaError.lowBattery
    }
}

do {
    try autoDriveTesla()
} catch TeslaError.lostGPS {
    print("Bruh, I'm lost. Hold me tight")
} catch TeslaError.lowBattery {
    print("HURRY! 💀")
}



//2. Error Handling with Init


//Not only you can apply error handling to functions, but also when you try to initialize an object. Let us say, if you don’t put a name to a course, you will throw an error

//Diff bw throws and throw : "One declares it and the other one actually does it."

enum CourseError: Error {
    case noName
}

class College {
    var courseName: String
    init(name: String) throws {
        if name == "" {
            throw CourseError.noName
        }
        courseName = name
    }
}
// Init & Handle Error
//When to use Try! and Try?

do {
    try College(name: "")
} catch CourseError.noName {
    print("course is not there")
}


//try -use catch block, try! - 101% sure data will be there and try?- unwarp

//Try is only used when you run a function/init within the do-catch block. However, if you don’t care to notify your user what’s happening through printing error messages or deal with the error, you don’t technically need the catch block.

//try? will always return an optional object. So you have to unwrap newCourse like
let newCourse = try? College(name: "Functional Programming")
if let _ = newCourse {
    print("enroll for this course")
}

let newCourse1 = try? College(name: "")
if let _ = newCourse1 {
    print("enroll for this course")
} else {
     print("Dont enroll for this course")
}


//It’s going to crash. Just like force unwrapping with !, never use it unless you have to by default or you are 101% sure what’s going on.

let newCourse2 = try! College(name: "")

