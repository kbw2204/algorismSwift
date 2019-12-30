//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//
func solution(_ n:Int64) -> Int64 {
    let nn: Int = Int(n)
    for i in 1 ..< nn/2 {
        if i*i == nn {
            return Int64((i+1)*(i+1))
        }
    }
    return -1
}

let testInput: [Int64] = [121,3]
let testOutput: [Int64] = [144,-1]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

// 음.. 이부분은 아직 이해가 안됨.. 어떤식으로 푼걸까..
//extension Int64 {
//    func bitCount() -> Int {
//        let hexString = String(self, radix: 2, uppercase: false)
//        return hexString.count
//    }
//}
//
//func solution(_ n:Int64) -> Int64 {
//    let sqrtBitCount: Int = (n.bitCount() + 1) / 2
//    let min, max: Int64
//    min = 1 << Int(sqrtBitCount - 1)
//    max = 1 << sqrtBitCount
//
//    for i in min..<max {
//        if i * i == n {
//            return (i + 1) * (i + 1)
//        } else if i * i > n {
//            break
//        }
//    }
//
//    return -1
//}
