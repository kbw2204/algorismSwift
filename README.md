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

### String 자른 후 String.Element?
~~~
var str = "Hello, playground"
var a = str.first // var a: String.Element?

~~~