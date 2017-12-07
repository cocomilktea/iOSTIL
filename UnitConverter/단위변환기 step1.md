#  단위변환기

## step1

### 학습목표

- 사용자가 직접 값을 입력하고 결과를 계산하는 방식을 경험한다.
- 사용자가 입력한 문자열을 변환하거나 일부를 비교하는 방법을 경험한다.
- 비교문 결과에 따라 다른 동작을 하도록 개선한다.
- 옵셔널 데이터 예외처리 방식에 익숙해진다.

### 요구사항

- 사용자가 길이 값을 입력하고 변수에 저장하도록 한다.
- 길이 단위에 따라 센티미터를 미터로 바꾸는 함수와, 미터를 센티미터로 바꾸는 함수로 나눈다.
- 사용자가 입력한 문자열에서 값 뒤에 붙어있는 단위에 따라서, 앞서 나눠놓은 길이 변환 함수를 호출하고 결과를 출력한다.
  - 예를 들어 "183cm"처럼 숫자 다음에 cm가 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
  - "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.



```swift
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

```

