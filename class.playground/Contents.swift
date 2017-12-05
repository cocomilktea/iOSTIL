//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed = 0.0 //stored property - 초기화가 되야함
    var description: String { //computed proterty
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("noiseless")
    }

}

//instance
let someVehicle = Vehicle()
someVehicle.currentSpeed = 1.0
print("Vehicle : \(someVehicle.description)")



//상속
class Bicycle: Vehicle {
    var hasBasket = false
}


//객체? 인스턴스랑 객체의 차이가 뭐임
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle : \(bicycle.description)")


class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
    override var description: String {
        return "traveling at \(currentSpeed) miles per hour, number of passenger : \(currentNumberOfPassengers), basket : \(hasBasket)"
    }
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.5
print("Tandem : \(tandem.description)")


class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()


class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25
car.gear = 3
print("Car : \(car.description)")




class AutomaticCar: Car {
    
    override var currentSpeed: Double { //stored property에 property observers를 붙임
        didSet{
            //값이 설정 됐을때 set해주는 observers
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 100.0
print("AutomaticCar : \(automatic.description)")






/*
 이 블로그의 설명에 따르면 객체(Object)는 소프트웨어 세계에 구현할 대상이고, 이를 구현하기 위한 설계도가 클래스(Class)이며, 이 설계도에 따라 소프트웨어 세계에 구현된 실체가 인스턴스(Instance)이다.
 객체(Object)는 현실의 대상(Object)과 비슷하여, 상태나 행동 등을 가지지만, 소프트웨어 관점에서는 그저 콘셉에 불과하다. 소프트웨어에서 객체를 구현하기 위해서는 콘셉 이상으로 많은 것들을 사고하여 구현해야 하므로, 이를 위한 설계도로 클래스를 작성한다. 설계도를 바탕으로 객체를 소프트웨어에 실체화 하면 그것이 인스턴스(Instance)가 되고, 이 과정을 인스턴스화(instantiation)라고 한다. 실체화된 인스턴스는 메모리에 할당된다.
 코딩을 할 때, 클래스 생성에 따라 메모리에 할당된 객체인 인스턴스를 ‘객체’라고 부르는데, 틀린 말이 아니다.
 인스턴스라고 부르면 더 정확하지만, 개념적으로 인스턴스는 객체에 포함된다고 볼 수 있다. 물론 어디가 소프트웨어 세계에 더 가깝냐를 따지면 당연히 인스턴스이다. 잘 구분해서 쓴다면 프로빼쌰날(?) 하다는 소리를 들을 수 있을지도.
 그러나 객체나 인스턴스를 클래스로, 혹은 클래스를 객체나 인스턴스라고 해선 안 된다. 건물의 설계도를 보고 건물이라고 하지 않고, 반대로 건물을 설계도라고 하지 않으니까~
 
 
 출처: http://cerulean85.tistory.com/149 [무엇이든 촌철살인.]
 */
