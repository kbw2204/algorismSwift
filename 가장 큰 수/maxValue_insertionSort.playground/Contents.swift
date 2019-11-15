import Foundation

func solution(_ numbers:[Int]) -> String {
    var result: String = ""
    let arr = numbers.map {String($0)}
    result = insertionSort(array: arr).reduce(result, +)
    while result.first! == "0" && result.count > 1 {
        result.removeFirst()
    }
    return result
}

func insertionSort(array: [String]) -> [String] {
    var arr = array
    for i in 1 ..< arr.count {
        let key = arr[i]
        var j = i - 1
        while j>=0 && check(key: key, pos: arr[j]) {
            arr.swapAt(j, j+1)
            j = j - 1
        }
        arr[j+1] = key
    }
    return arr
}

func check(key: String, pos: String) -> Bool {
    let val1 = Int(key + pos)!
    let val2 = Int(pos + key)!
    if  val1 > val2 {
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
        print("실패: \(solution(testInput[i]))답: \(testOutput[i])")
    }
}
