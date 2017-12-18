# 단위변환기 step6

###학습 목표

- 지금까지 학습한 내용을 활용해 한 단계 더 난이도가 있는 문제를 구현하는 경험을 한다.
- 프로그램을 개선하면서 호출관계, 함수이름, 변수이름을 개선하는 경험을 한다.

###최종 요구사항 1

- 프로그램을 시작하면 사용자가 입력해서 변환이 가능한 단위들을 메뉴처럼 표시한다.
- 사용자가 입력할 때 실수를 덜하도록 유도하는 방법을 고민해본다.
- 단위가 추가될 때마다 개선하기 편한 코드와 메뉴 구성은 어떤 방식인가 고민해본다.

###최종 요구사항 2

- 사용자가 입력한 값 하나로 여러 단위로 변환해서 출력한다.
- 예를 들어 "1.83m"라고 입력하면 1.83 미터 값을 각각 센티미터, 인치, 야드 단위로 모두 바꿔서 한꺼번에 출력한다.
- "1.83m inch,yard"라고 입력하면 1.83 미터 값을 각각 인치, 야드 단위로만 바꿔서 출력한다.

###학습 마무리 조언

- 지금까지 과정에서 자신 없는 부분, 이해가 되지 않는 부분을 정리하고 해당 부분을 집중 연습한다.
- 전체 과정을 반복 연습한다. 단, 반복 연습할 때 힌트를 조금씩 줄여가면서 연습한다.
- 각 단계 내용 중 자신이 이해한 부분과 이해하지 못한 부분을 정리한다. 이해하지 못한 부분은 다른 미션을 구현하면서 이해하기 위해 노력한다.
- 새롭게 등장하는 용어들에 대해 자신이 이해한 수준으로 정리하는 연습을 한다. 반드시 100% 이해하지 못해도 괜찮다.

```swift
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


```

