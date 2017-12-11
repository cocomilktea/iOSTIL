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

