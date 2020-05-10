import Foundation

let count = readLine()!
let numbers = readLine()!
let calList = readLine()!

var array: [Int] = numbers.components(separatedBy: " ").map{Int($0)!}
let firstNumber: Int = array.removeFirst()
var max = -1000000000
var min = 1000000000
let calArray = calList.components(separatedBy: " ").map{Int($0)!}
dfs(arr: array, calArray: calArray, n: Int(count)!, depth: 1, sum: firstNumber, max: &max, min: &min)
print(max)
print(min)


func dfs(arr: [Int], calArray: [Int], n: Int, depth: Int, sum: Int, max: inout Int, min: inout Int) {
    if n == depth {
        // 목적지
        if max < sum {
            max = sum
        }
        if min > sum {
            min = sum
        }
        return
    }
    
    var vArr = arr
    let number = vArr.removeFirst()
    
    for i in 0 ..< calArray.count {
        var tmp = sum
        switch i {
        case 0:
            if calArray[i] != 0 {
                var vCalArray = calArray
                tmp += number
                vCalArray[i] -= 1
                dfs(arr: vArr, calArray: vCalArray, n: n, depth: depth + 1, sum: tmp, max: &max, min: &min)
            }
        case 1:
            if calArray[i] != 0 {
                var vCalArray = calArray
                tmp -= number
                vCalArray[i] -= 1
                dfs(arr: vArr, calArray: vCalArray, n: n, depth: depth + 1, sum: tmp, max: &max, min: &min)
            }
        case 2:
            if calArray[i] != 0 {
                var vCalArray = calArray
                tmp *= number
                vCalArray[i] -= 1
                dfs(arr: vArr, calArray: vCalArray, n: n, depth: depth + 1, sum: tmp, max: &max, min: &min)
            }
        case 3:
            if calArray[i] != 0 {
                var vCalArray = calArray
                tmp /= number
                vCalArray[i] -= 1
                dfs(arr: vArr, calArray: vCalArray, n: n, depth: depth + 1, sum: tmp, max: &max, min: &min)
            }
        default: break
        }
    }
}
