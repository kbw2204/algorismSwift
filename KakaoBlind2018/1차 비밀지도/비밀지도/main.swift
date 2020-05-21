import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var max = arr1.max()!
    let tmp = arr2.max()!
    if max < tmp {
        max = tmp
    }
    max = String(max, radix: 2).count
    
    var binaryArr1: [String] = arr1.map{String($0, radix: 2)}.map{
        var result: String = $0
        let count = $0.count
        if count < max {
            result = addZero(max - count) + result
        }
        return result
    }
    var binaryArr2: [String] = arr2.map{String($0, radix: 2)}.map {
        var result: String = $0
        let count = $0.count
        if count < max {
            result = addZero(max - count) + result
        }
        return result
    }
    
    for i in 0 ..< arr1.count {
        var line: String = ""
        for _ in 0 ..< max {
            if String(binaryArr1[i].last!) == "1" ||  String(binaryArr2[i].last!) == "1"{
                line += "#"
            } else {
                line += " "
            }
            binaryArr1[i].removeLast()
            binaryArr2[i].removeLast()
        }
        answer.append(String(line.reversed()))
    }
    return answer
}

func addZero(_ count: Int) -> String {
    var str = ""
    for _ in 0 ..< count {
        str += "0"
    }
    return str
}

let n = 5
let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

var result = ["#####","# # #", "### #", "#  ##", "#####"]
let run = solution(n, arr1, arr2)
if run == result {
    print("정답")
} else {
    print("땡: \(run)")
}


// 더 좋은 풀이

//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//    var answer: [String] = []
//
//    var board = [Int]()
//    for i in 0..<n {
//        board.append(arr1[i] | arr2[i])
//    }
//
//    answer = board.map { row in
//        var str = ""
//        for i in Array(0..<n).reversed() {
//            if row & 1<<i > 0 {
//                str += "#"
//            } else {
//                str += " "
//            }
//        }
//        return str
//    }
//
//    return answer
//}
