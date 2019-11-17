import Foundation

func solution(_ numbers:[Int]) -> String {
    var result: String = ""
    let arr = numbers.map {String($0)}
    result = mergeSort(tmplist: arr).reduce(result, +)
    while result.first! == "0" && result.count > 1 {
        result.removeFirst()
    }
    return result
}

func merge(tmpLeft: [String], tmpRight: [String]) -> [String] {
    var result: [String] = []
    var left = tmpLeft
    var right = tmpRight
    while !left.isEmpty && !right.isEmpty {
        let value = check(left: left[0], right: right[0]) ? left.removeFirst() : right.removeFirst()
        result += [value]
    }
    if !left.isEmpty {
        result += left
    }
    if !right.isEmpty {
        result += right
    }
    return result
}

func mergeSort(tmplist: [String]) -> [String] {
    var list = tmplist
    if list.count <= 1 {
        return list
    }
    
    var lList: [String] = []
    var rList: [String] = []
    
    let mid = list.count / 2
    lList += list[0..<mid]
    rList += list[mid..<list.count]
    
    let left = mergeSort(tmplist: lList)
    let right = mergeSort(tmplist: rList)
    
    return merge(tmpLeft: left, tmpRight: right)
}

func check(left: String, right: String) -> Bool {
    let val1 = Int(left + right)!
    let val2 = Int(right + left)!
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
