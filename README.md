# algorismSwift
알고리즘 Swift 모음

## Array

<details><summary>범위 출력</summary>

~~~
let a = Array<Int>(1...10)
let b: : ArraySlice<Int> = a[3..<6] // [4, 5, 6]
~~~

</details>

<details><summary>정렬</summary>

~~~
var arr: [Int] = [1, 5, 2, 6, 3, 7, 4]
arr.sorted()
//[1, 2, 3, 4, 5, 6, 7]
~~~

</details>

## [String](https://developer.apple.com/documentation/swift/string)

<details><summary>String 추가</summary>

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

</details>

<details><summary>String 삭제</summary>

~~~
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
~~~

</details>

<details><summary>String 특정 문자 삭제</summary>

~~~
var str = "Hello~!Test"
str.components(separatedBy: ["~","!"]).joined() // "HelloTest"
~~~

</details>

<details><summary>String 자른 후 String.Element?</summary>

~~~
var str = "Hello, playground"
var a = str.first // var a: String.Element?
~~~

</details>

<details><summary>SubString</summary>

~~~
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
~~~

</details>

<details><summary>String for 문</summary>

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

</details>

<details><summary>String을 Character 값에 따라 나누기</summary>

~~~
let name = "Marie Curie"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
let firstName = name[..<firstSpace]
// firstName == "Marie"
~~~

</details>

<details><summary>String 기준점 나누기</summary>

~~~
let str: String = "1234567"

let dividePoint: String.Index = str.index(str.startIndex, offsetBy: 3)
let before: String = String(str[..<dividePoint]) // String으로 변환 안하면 SubString상태
let after: String = String(str[dividePoint...])
print("before: \(before) / after: \(after)")
//before: 123 / after: 4567
~~~

</details>