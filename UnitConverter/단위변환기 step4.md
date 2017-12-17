# 단위변환기 step4

### 학습 목표

- 사용자가 입력한 문자열을 변환하거나 일부를 비교하는 여러 방법을 경험한다.
- 복합적인 비교문 결과에 따라 다양한 동작을 하도록 개선한다.
- 지원하지 않는 경우에 대한 예외처리를 경험한다.

### 요구사항

- 6단계까지 요구사항을 그대로 유지하면서, 동일하게 무게 단위도 동작하도록 함수를 구현하고 프로그램을 개선한다.
  - 그램(g), 킬로그램(kg), 파운즈(lb), 오운스(oz) 중에서 3 가지 이상을 지원하도록 구현한다.

```swift
import Foundation


typealias UnitsDic = [String: Double]

struct Units {
    static let lengthDic: UnitsDic = ["cm": 1, "m": 100, "inch": 2.54, "yard": 91.44]
    static let weightDic: UnitsDic = ["g": 1, "kg": 1000, "lb": 453.592, "oz": 28.34]
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
    for key in Units.weightDic.keys {
        if inputStr.hasSuffix(key) { return (key, Units.weightDic)}
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
    print("길이단위와 변환할 단위입력 ex)180cm inch")
    print("무게단위와 변환할 단위입력 ex)1g kg")
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
        case "yard":
            convertYardTOM(int: Double(inputDigit))
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
        case ("yard", "m"):
            let yardToCm = convertYardTOCm(int: Double(inputDigit))
            convertCmToM(int: yardToCm)
        case ("m", "yard"):
            let mTocm = convertMToCm(int: Double(inputDigit))
            convertCmTOYard(int: mTocm)
        default:
            if fromUnitStr.unit == "g" || fromUnitStr.unit == "kg" || fromUnitStr.unit == "lb" || fromUnitStr.unit == "oz" {
                let result = inputDigit * (fromUnitStr.category)[fromUnitStr.unit!]! / (toUnitStr.category)[toUnitStr.unit!]!
                print("\(inputDigit)\(fromUnitStr.unit!) : \(result)\(toUnitStr.unit!)")
            }
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

func convertYardTOCm(int: Double) -> Double {
    let yard: Double = 91.44
    let result = yard * int
    print("\(int)yard : \(result)cm")
    return result
}

func convertCmTOYard(int: Double) -> Double {
    let yard: Double = 0.010936
    let result = yard * int
    print("\(int)cm : \(result)yard")
    return result
}

func convertYardTOM(int: Double) -> Double {
    let yard: Double = 0.9144
    let result = yard * int
    print("\(int)yard : \(result)m")
    return result
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

