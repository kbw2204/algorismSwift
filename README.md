# algorismSwift
알고리즘 Swift 모음

## Array
### 범위 출력

~~~
let a = Array<Int>(1...10)
let b: : ArraySlice<Int> = a[3..<6] // [4, 5, 6]
~~~

### 정렬

~~~
var arr: [Int] = [1, 5, 2, 6, 3, 7, 4]
arr.sorted()
//[1, 2, 3, 4, 5, 6, 7]
~~~

## [String](https://developer.apple.com/documentation/swift/string)

### String 추가

~~~
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"
~~~

### String 삭제
~~~
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
~~~

### String 자른 후 String.Element?
~~~
var str = "Hello, playground"
var a = str.first // var a: String.Element?
~~~

### SubString
~~~
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
~~~

### String for 문
~~~
let str: String = "abcdf"
for c in str {
    print(c)
}
//a
//b
//c
//d
//f
~~~

### String을 Character 값에 따라 나누기

~~~
let name = "Marie Curie"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
let firstName = name[..<firstSpace]
// firstName == "Marie"
~~~

### String 기준점 나누기

~~~
let str: String = "1234567"

let dividePoint: String.Index = str.index(str.startIndex, offsetBy: 3)
let before: String = String(str[..<dividePoint]) // String으로 변환 안하면 SubString상태
let after: String = String(str[dividePoint...])
print("before: \(before) / after: \(after)")
//before: 123 / after: 4567
~~~

