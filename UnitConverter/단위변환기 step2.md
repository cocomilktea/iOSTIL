# 단위변환기 step2

### 학습목표

- 사용자가 입력한 문자열을 변환하거나 일부를 비교하는 여러 방법을 경험한다.
- 복합적인 비교문 결과에 따라 다양한 동작을 하도록 개선한다.
- 지원하지 않는 경우에 대한 예외처리를 경험한다.

### 요구사항

사용자가 길이 값과 단위를 입력하고 변환할 단위까지도 입력하도록 확장한다.

센티미터를 인치로 바꾸는 함수와 인치를 센티미터로 바꾸는 함수를 추가로 구현한다.

- 예를 들어 "18cm inch"라고 입력하면 센티미터를 인치로 바꾸는 함수를 호출한다.
- "25.4inch m"라고 입력하면 인치를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
- "0.5m inch"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 인치로 바꾸는 함수를 호출한다.
- "183cm"처럼 숫자 다음에 cm만 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
- "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.

만약 지원하지 않는 길이 단위(feet)가 붙어 있을 경우, "지원하지 않는 단위입니다."를 출력하고 다시 입력받도록 한다.



> 튜플 예제

```swift
var statusCode: Int = 418
var errorString: String = "The request failed with the error"

switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)"
case 204:
    errorString += " Successful but no content, 204"
case 300...307:
    errorString += " Redirection, \(statusCode)"
case 400...417:
    errorString += " Client error, \(statusCode)"
case 500...505:
    errorString += " Server error, \(statusCode)"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString = " \(unknownCode) is not a known error code"
default:
    errorString = " Unexpected error encountered."
}

//let error = (statusCode, errorString)
//error.0
//error.1

let error = (code: statusCode, error: errorString)
error.code
error.error

let firstErrorCode =  404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)
switch errorCodes {
case (404, 404):
    print("No items found")
case(404, _):
    print("First item not found")
case(_, 404):
    print("Second item not found")
default:
    print("All items found")
}
```



> 함수 복수 리턴값

 ```swift
func sortedEvenOddNumbers(_ numbers:[Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are : \(theSortedNumbers.evens); the odd numbers are : \(theSortedNumbers.odds)")
 ```

> Dictionary

Dictionary는 데이터를 키(key)와 값(value)의 쌍으로 담아 두는 컬렉션 타입이다.

키와 값은 서로 짝을 맞춰 딕셔너리에 저장된다.

Dictionary 타입의 인스턴스에 키를 제공하면 이 키와 연결된 값을 리턴받는다.

인스턴스의 키는 중복되지 않아야 한다. 

변경할 수 없는 딕셔너리를 만들 때는 let키워드를 사용한다.

```swift
var movie = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
print("I have rated \(movie.count) movies")
let aa = movie["a"]
movie["e"] = 6
movie
let old: Int? = movie.updateValue(10, forKey: "b")
if let last = old, let current = movie["b"] {
    print("old \(last); current \(current)")
}
movie["f"] = 7
//movie.removeValue(forKey: "a") //제거된 키의 값을 리턴
movie["a"] = nil //제거된 키의 값을 리턴하지 못한다

//딕셔너리에 루프 적용하기
for(key, value) in movie {
    print("The movie \(key) was rated \(value)")
}
//키에만 엑세스하기
for m in movie.keys {
    print("User has rated \(m)")
}
//키를 배열로 보내기
let arrMovie = Array(movie.keys)
print(arrMovie)
```

> 구조체

구조체(struct)는 서로 연관된 데이터들을 한데 묶은 타입이다. 

구조체는 데이터를 어떤 하나의 타입에 두고 싶을 때 사용한다.

구조체에 변수(프로퍼티)를 추가하면 도시의 특징을 구현하는 데 필요한 데이터 등을 

담을 수 있다.

구조체의 인스턴스 메서드가 구조체의 프로퍼티를 변경하려면 mutating라는 키워드가

필요하다. 구조체와 열거형은 값 타입이라서 인스턴스의 프로퍼티 값을 변경할 메서드에는

mutating 키워드가 붙어야 한다.

```swift
struct Town {
    var population = 5_422
    var numberOfstoplights = 4
    
    func printDescription() {
        print("population: \(population), number of stoplights: \(numberOfstoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}

//인스턴스
var myTown = Town()
//print("population: \(myTown.population), number of stoplights: \(myTown.numberOfstoplights)")
myTown.printDescription()
myTown.changePopulation(by: 500)
myTown.printDescription()
```

 

> 완성 코드

```swift
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


```

