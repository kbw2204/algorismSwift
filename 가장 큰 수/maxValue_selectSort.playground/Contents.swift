import Foundation

func solution(_ numbers:[Int]) -> String {
    var result: String = ""
    let arr = numbers.map {String($0)}
    result = selectSort(array: arr).reduce(result, +)
    while result.first! == "0" && result.count > 1 {
        result.removeFirst()
    }
    return result
}

func selectSort(array: [String]) -> [String] {
    var arr = array
    for i in 0 ..< arr.count {
        var temp = i
        for j in i+1 ..< arr.count {
            if check(temp: arr[temp], pos: arr[j]) {
                temp = j
            }
        }
        arr.swapAt(i, temp)
    }
    return arr
}

func check(temp: String, pos: String) -> Bool {
    let val1 = Int(temp + pos)!
    let val2 = Int(pos + temp)!
    if  val1 < val2 {
        return true
    }
    return false
}

let testInput = [[111,111], [3, 30, 34, 5, 9],[21, 212],[12, 121],[0,0,0,0],[0, 0, 0, 1000],[70, 0, 0, 0]]
let testOutput = ["111111","9534330","21221","12121","0","1000000","70000"]

for i in 0 ..< testInput.count {
    if solution(testInput[i]) == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i])")
    }
}
