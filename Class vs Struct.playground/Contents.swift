import UIKit
//Bandish Kumar
//iOS Developer
//+91- 8904196212


//Concern :
//If class has more than one reference - if one refernce becomes nil - Q: then second reference will be nil or what happen If it will access the properties of class



class Person {
    
    var age: Int?
    func displayAge() {
        print("age is \(age ?? 10)")
    }
    deinit {
        print("Person is not in memory")
    }
}

var person1: Person?
person1 = Person()
person1?.age = 20
person1?.displayAge()
var person2 = person1
person2?.age = 40
person1?.displayAge() //age is 40: reference type , then both will have same value
person2?.displayAge() //age is 40

//person1 = nil //one instance make nil, but second instance will be there : Answer
//person2 = nil //if all instances are no longer present, then ARC will be zero//

var person3 = person1 //now person 3 also be nil
person3?.displayAge()


struct Person1 {
    
    var age: Int?
    func displayAge() {
        print("struct of age is \(age ?? 10)")
    }
    
}

var sPerson1: Person1?
sPerson1 = Person1()
sPerson1?.age = 20
sPerson1?.displayAge() //struct of age is 20
var sPerson2 = sPerson1
sPerson2?.age = 40
sPerson1?.displayAge() //struct of age is 20 : value types
sPerson2?.displayAge() //struct of age is 40

sPerson1 = nil
print(sPerson1?.age ?? 11)

print(sPerson2?.age ?? 11)


/*w
 
 Diff b/w class & struct : ---
 1. class - reference type
    struct - value types
 2. class - inheritence
    struct - nope
 
 3. class - deinit {}
  struct - nope
 
 4. class : Allow reference counting for multiple references (ARC : works becoz it is reference type)
    struct : nope
 
 5. class: thread safe - store in stack
    struct: not thread safe - store in heap
 
 6. class : Type casting
 struct: nope
 
 
 //Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.
 
 //Type casting in Swift is implemented with the is and as operators
 */

//Type casting

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}


class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Bharat", director: "Abbas"),
    Song(name: "dil hai muskil", artist: "Arjit singh"),
    Movie(name: "Mangalyan", director: "Akshay kumar"),
    Song(name: "jan gan man", artist: "ravindra nath"),
    Song(name: "chale aana ", artist: "bandish kumar")
]


//Checking Type:  is

var movieCount = 0
var songCount = 0

for mediaItem in library {
    if mediaItem is Song {
        songCount += 1
    } else {
        movieCount += 1
    }
}

print("number of song is \(songCount) & movie is \(movieCount)")



//Downcasting
//A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (as? or as!).

//Because downcasting can fail, the type cast operator comes in 2 different forms : 1. The conditional form, as?, returns an optional value of the type you are trying to downcast to. 2. The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.


for mediaItem in library {
    if let item = mediaItem as? Movie {
        print("movie name is \(item.name) & director is \(item.director)")
    } else  if let item = mediaItem as? Song {
        print("movie name is \(item.name) & director is \(item.artist)")
    }
}
