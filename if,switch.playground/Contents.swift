//: Playground - noun: a place where people can play

import UIKit

//if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else if temperatureInFahrenheit >= 86{
    print("It's really warm. Don't forget to wear sunscreen")
} else {
    print("It's not that cold. Wear a t-shirt")
}

//switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

/*
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a": //Invalid, the case has an empty body
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
//this will report a compile-time error
*/

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a","A":
    print("The letter A")
default:
    print("Not the letter A")
}


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount)\(countedThings)")

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is at the x-axis")
case (0, _):
    print("\(somePoint) is at the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}


let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let(x, y):
    print("somewhere else at (\(x),\(y))")
}


let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x),\(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x),\(y)) is on the line x == -y")
case let (x, y):
    print("(\(x),\(y)) is just some arbitrary point")
}


let someChar: Character = "e"
switch someChar {
case "a", "e", "i", "o", "u":
    print("\(someChar) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l","m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someChar) is a consonant")
default:
    print("\(someChar) is not vowel or a consonant")
}


let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}




