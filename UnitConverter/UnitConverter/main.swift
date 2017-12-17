//
//  main.swift
//  UnitConverter
//
//  Created by 김수현 on 2017. 12. 5..
//  Copyright © 2017년 김수현. All rights reserved.
//

import Foundation


typealias UnitsDic = [String: Double]

struct Units {
    static let lengthDic: UnitsDic = ["cm": 1, "m": 100, "inch": 2.54]
    static let err: UnitsDic = ["err": 0]
}


func divideByBlank(_ inputStr: String) -> Array<String> {
    let inputArr = inputStr.components(separatedBy: " ")
        return inputArr
}


func checkUnit(_ inputStr: String) -> (unit: String?, category: UnitsDic) {
    for key in Units.lengthDic.keys {
        if inputStr.hasSuffix(key) { return (key, Units.lengthDic)}
    }
    return(nil, Units.err)
}


func divideOfDigit(_ inputStr: String, fromUnit: String) -> Double {
    let digit = inputStr.components(separatedBy: "\(fromUnit)")
    return Double(digit[0]) ?? 0
}


func confirmNameOfUnit(_ unit: String?) -> Bool {
    if unit == nil {
        print("지원하지 않는 단위입니다.")
        return false
    }
    return true
}


func printMessage() {
    print("*** 단위변환기 ***")
    print("길이단위와 변환할단위입력 ex)180cm inch")
}


func convertUnit(_ inputStr: String) {
    let divideStr = divideByBlank(inputStr)
    let fromUnitStr = checkUnit(divideStr[0])
    
    if confirmNameOfUnit(fromUnitStr.unit) == false {
        return
    }
    let inputDigit = divideOfDigit(divideStr[0], fromUnit: fromUnitStr.unit!)
    if divideStr.count == 1 {
        let unit = fromUnitStr.unit!
        switch unit {
        case "cm":
            convertCmToM(int: Double(inputDigit))
        case "m":
            convertMToCm(int: Double(inputDigit))
        default:
            print("다시 입력해 주세요")
        }
    }
    if divideStr.count == 2 {
        let toUnitStr = checkUnit(divideStr[1])
        let compare = (fromUnitStr.unit!, toUnitStr.unit!)
        switch compare {
        case ("cm", "inch"):
            convertCmToInch(int: Double(inputDigit))
        case ("inch", "cm"):
            convertInchToCm(int: Double(inputDigit))
        case ("m", "inch"):
            let mTocm = convertMToCm(int: Double(inputDigit))
            convertCmToInch(int: mTocm)
        case ("inch", "m"):
            let inchToCm = convertInchToCm(int: Double(inputDigit))
            convertCmToM(int: inchToCm)
        default:
            print("다시 입력해 주세요")
        }
    }
}


func convertCmToM(int: Double) -> Double {
    let meter = int / Double(100)
    print("\(int)cm : \(meter)m")
    return meter
}


func convertMToCm(int: Double) -> Double {
    let centi = int * Double(100)
    print("\(int)m : \(Int(centi))cm")
    return centi
}


func convertCmToInch(int: Double) -> Double {
    let Inch: Double = 0.393701
    let result = Inch * int
    print("\(int)cm : \(result)inch")
    return result
}


func convertInchToCm(int: Double) -> Double {
    let cm: Double = 2.54
    let result = cm * int
    print("\(int)inch : \(result)cm")
    return result
}


var run = true
mainLoop: while run {
    printMessage()
    let input = readLine()
    if input == "q" { break }
    guard let inputValue = input else { break }
    convertUnit(inputValue)
    
    print("\n> 프로그램 종료: q \n")
    
}




