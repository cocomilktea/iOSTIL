//
//  main.swift
//  UnitConverter
//
//  Created by 김수현 on 2017. 12. 5..
//  Copyright © 2017년 김수현. All rights reserved.
//

import Foundation

let unitArr = ["cm","m"]
let value = 100

func checkHasSuffix(_ arr: String, _ inputStr: String) -> Bool {
    if inputStr.hasSuffix(arr) {
        if arr == "cm" {
            sliceArr(input: inputStr, s: "c")
        } else if arr == "m" {
            sliceArr(input: inputStr, s: "m")
        }
        return true
    } else {
        return false
    }
}


func sliceArr(input: String, s: Character) {
    let index = input.index(of: s) ?? input.endIndex
    let begin = String(input[..<index])
    let end = String(input[index...])
    if end == "cm" {
        convertCmToM(int: Double(begin) ?? 0, str: end)
    } else if end == "m" {
        convertMToCm(int: Double(begin) ?? 0, str: end)
    }
}

func convertCmToM(int: Double, str: String) {
    let meter = Double(int) / Double(value)
    print("\(int)cm : \(meter)m")
}

func convertMToCm(int: Double, str: String) {
    let centi = Double(int) * Double(value)
    print("\(int)m : \(Int(centi))cm")
}


while true {
    print("*** 단위변환기 ***")
    print("숫자단위로 입력해주세요 ex)180cm")
    
    let input = readLine()
    if input == "q"{
        break
    }
    if var inputValue = input {
        for idx in 0..<unitArr.count {
            if checkHasSuffix(unitArr[idx], inputValue) {
                break
            }
        }
    }
    print("\n> 프로그램 종료: q \n")
}










