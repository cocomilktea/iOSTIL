//: Playground - noun: a place where people can play

import Cocoa


var age = 0;

while age < 5 {
    age += 1
    //print(age)
}

for _ in 1...5{
    //print(5)
}

for num in 1...5{
    //print(num)
}

let names = ["Anna","Alex","Brian","Jack"]

for name in names{
    print("hi \(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for(animalName, legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount) legs")
}


for index in 1...5{
    print("\(index) times 5 is \(index * 5)")
}


let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


let minutes = 60
for tickMark in 0..<minutes {
    //render the tick mark each minute (60 times)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    //render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval){
    //render the tick mark every 3 hours (3, 6, 9, 12)
}

//array sum
let n = 6
let arr = [1, 2, 3, 4, 10, 11]
var result = 0

for idx in 0 ..< n {
    result += arr[idx]
}
print(result)


let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    //roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    //move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}

print("Game Over")

/*
//repeat while
repeat {
    //move up or down for a snake or ladder
    square += board[square]
    //roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    //move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game Over")
*/



