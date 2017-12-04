//: Playground - noun: a place where people can play

import UIKit

func greet(person: String) -> String {
    let greeting = "Hello,  " + person + "!"
    return greeting
}
print(greet(person: "Anna"))


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))


func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())



func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: false))
print(greet(person: "Anna", alreadyGreeted: true))


func hiGreet(person: String) {
    print("hi. \(person)")
}
hiGreet(person: "Dave")



func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
//prints "hello, world" and returns a value of 12
printAndCount(string: "hello, world")
//prints "hello, world" but does not retrun a value
//첫번째 함수를 호출하지만 반환된 값은 사용되지 않음
printWithoutCounting(string: "hello, world")

/*
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [1, 10, 5, 7, 15, 6, 13, 9, 17])
print("min is \(bounds.min) and max is \(bounds.max)")
*/

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [1, 10, 5, 7, 15, 6, 13, 9, 17]){
    print("min is \(bounds.min) and max is \(bounds.max)")
}

func arithmeticMenu(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMenu(1, 2, 3, 4, 5)
arithmeticMenu(3, 8.25, 18.75)


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts


func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)

/*
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
//moveNearerToZero now refers to the stepBackward() function

print("Counting to zero")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero")

*/

//중첩함수
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int { return input + 1 }
    func stepBackward(_ input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = 5
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero")



