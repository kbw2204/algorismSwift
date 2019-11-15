import Foundation

// 더 나은 풀이........
func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    
    let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
    return sortedNumbers.first == 0 ? "0" : answer
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
