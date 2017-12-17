# 단위변환기 step3

### 학습 목표

- 사용자가 입력한 문자열을 변환하거나 일부를 비교하는 여러 방법을 경험한다.
- 복합적인 비교문 결과에 따라 다양한 동작을 하도록 개선한다.
- 지원하지 않는 경우에 대한 예외처리를 경험한다.

### 요구사항

- 5단계까지 요구사항을 그대로 유지하면서, 동일하게 야드(yard) 단위도 동작하도록 함수를 구현하고 프로그램을 개선한다.
  - 예를 들어, "1yard m"라고 입력하면 야드를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
  - "1m yard"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터를 야드로 바꾸는 함수를 호출한다.
- "2.54yard"처럼 숫자 다음에 yard만 붙어있으면 미터 단위 값으로 변환하고 출력한다.
- 변환한 값을 출력하고 난 이후에 다시 입력을 반복하도록 개선한다.
- 만약 "quit" 혹은 "q" 라고 입력하면 프로그램을 종료한다.

```swift
import Foundation


typealias UnitsDic = [String: Double]

struct Units {
    static let lengthDic: UnitsDic = ["cm": 1, "m": 100, "inch": 2.54, "yard": 91.44]
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

