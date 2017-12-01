//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let name: String = "hyun"
var greeting = "hi"

print("\(name)")
greeting + " " + name

let character = name.characters
let count = character.count

let url = "www.google.com"
let hasProtocol = url.hasPrefix("http://")


let maxSpeed: Int = 200
//maxSpeed += 10 //X
var currentSpeed: Int = 110
currentSpeed += 10
//currentSpeed += 20.5 //X
currentSpeed += Int(20.5)

//UInt minus가 없는 정수값
let intMax = Int.max
let UintMax = UInt.max //Int의 두배
let intMin = Int.min
let UintMin = UInt.min //0이 최소값


let pi = 3.14
let half = pi/2

let devider = 2
//let halfpi = pi/devider //X double에 정수값으로 나눌수 없음 정수는 정수끼리 소수는 소수끼리 연산이된다
let halfpi = pi/Double(devider) //타입 변환 해줘야함


let distance = 69500
let description = "판교에서 파주는 " + String(Double(distance)*0.001) + "km 거리입니다."

print(description)


//Tuple : 괄호'()'로 묶어 표현하며, 콤마 ','로 구분 한 값의 리스트 Int Double Float String 어떤 타입이 섞여도 상관없다는 점이 튜플에 강력한 장점
let time1 = (9,0,48)
time1.0

let time2:(h:Int, m:Int, s:Int) = (11,51,5)
time2.h
time2.m

//튜플안에 튜플이 들어갈수 있다
let duration = (time1, time2)
let (start, end) = duration
let endHour = end.h


typealias Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time)

let today:Duration = ((9, 10, 23),(17, 8, 21))

print("We studied until \(today.end.h) today")



typealias Triathlon = (swim:Int, cycle:Int, running:Int)
let sprint = Triathlon(750, 20000, 5000)
let ironMan = Triathlon(3800, 180000, 42200)

let times = (ironMan.cycle) / (sprint.cycle)


print(times)




/* Array */
var meetingRooms: Array<String> = ["Bansky","Rivera","Kahlo","Picasso","Cezanne","Matisse"]
var group:[Int] = [10, 8, 14, 9]
meetingRooms += ["Renoir"]


var speedHistory:[Int] = []
speedHistory += [currentSpeed]

let gpsSpeed0901 = 114.1

//.append 값추가
speedHistory.append(Int(gpsSpeed0901))
print(speedHistory)
speedHistory[1]
speedHistory.first
speedHistory.last

let historyBackup = speedHistory
speedHistory += [150]
historyBackup



/* Dictionary */
var roomCapacity:[String:Int] = ["Bansky":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30] //[:]초기화

//roomCapacity += ["Renoir":40] //X
roomCapacity["Renoir"] = 40
roomCapacity["Kahlo"]

//튜플로 되있음
//let roomNames = roomCapacity.keys //error??
//let capacities = roomCapacity.values //error??

//array 값을 가져오려면
let roomNames = [String](roomCapacity.keys)
let capacites = [Int](roomCapacity.values)




