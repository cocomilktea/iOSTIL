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
    static let lengthDic: UnitsDic = ["cm": 1, "m": 100, "inch": 2.54, "yard": 91.44]
    static let weightDic: UnitsDic = ["kg": 1000, "g": 1, "lb": 453.592, "oz": 28.34]
    static let volumeDic: UnitsDic = ["gal": 3.78541, "l": 1, "pt": 0.473176, "qt": 0.946353]
    static let err: UnitsDic = ["err": 0]
}


func divideByBlank(_ inputStr: String) -> Array<String> {
    let inputArr = inputStr.components(separatedBy: " ")
    return inputArr
}


func convertToUint(digit: Double, fromUnit: (unit: String?, category: UnitsDic), toUnit: (unit: String?, category: UnitsDic)) -> String {
    var inputDigit: Double = 0.0
    inputDigit = digit * (fromUnit.category)[fromUnit.unit!]! / (toUnit.category)[toUnit.unit!]!
    return String(inputDigit) + toUnit.unit! + " "
}


func checkUnit(_ inputStr: String) -> (unit: String?, category: UnitsDic) {
    for key in Units.lengthDic.keys {
        if inputStr.hasSuffix(key) { return (key, Units.lengthDic)}
    }
    for key in Units.weightDic.keys {
        if inputStr.hasSuffix(key) { return (key, Units.weightDic)}
    }
    for key in Units.volumeDic.keys {
        if inputStr.hasSuffix(key) { return (key, Units.volumeDic)}
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
    print("*** 지원하는 단위 ***")
    for unit in Units.lengthDic.keys {
        print("\(unit) ", terminator:"")
    }
    print("")
    for unit in Units.weightDic.keys {
        print("\(unit) ", terminator:"")
    }
    print("")
    for unit in Units.volumeDic.keys {
        print("\(unit) ", terminator:"")
    }
    print("")
}


func convertUnit(_ inputStr: String) {
    let divideStr = divideByBlank(inputStr)
    let fromUnitStr = checkUnit(divideStr[0])
    if confirmNameOfUnit(fromUnitStr.unit) == false {
        return
    }
    let inputDigit = divideOfDigit(divideStr[0], fromUnit: fromUnitStr.unit!)
    switch divideStr.count {
    case 0,1:
        var unitArr: [String] = []
        for unit in fromUnitStr.category {
            if unit.key != fromUnitStr.unit {
                unitArr.append(convertToUint(digit: inputDigit, fromUnit: fromUnitStr, toUnit: (unit.key, fromUnitStr.category)))
            }
        }
        print("단위변환 : \(unitArr[0]) \(unitArr[1]) \(unitArr[2])")
    case 2:
        let toUnitArr = checkUnit(divideStr[1])
        let toUnitStr = convertToUint(digit: inputDigit, fromUnit: fromUnitStr, toUnit: toUnitArr)
        print("단위변환 : \(toUnitStr)")
        return
    case 3:
        let firstUnit = checkUnit(divideStr[1])
        let secondUnit = checkUnit(divideStr[2])
        let firstStr = convertToUint(digit: inputDigit, fromUnit: fromUnitStr, toUnit: firstUnit)
        let secondStr = convertToUint(digit: inputDigit, fromUnit: fromUnitStr, toUnit: secondUnit)
        print("단위변환 : \(firstStr), \(secondStr)")
        return
    default:
        print("다시 입력해 주세요")
    }
}


var run = true
mainLoop: while run {
    printMessage()
    let input = readLine()
    if input == "q" || input == "quit" { print("종료"); break }
    guard let inputValue = input else { break }
    convertUnit(inputValue)
    print("\n> 프로그램 종료: q / quit \n")
}




