//
//  main.swift
//  test
//
//  Created by 강병우 on 30/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    var result: Int = 0
    let arr: [Int] = [a,b]
    for num in arr.min()! ... arr.max()! {
        result += num
    }
    return Int64(result)
}

let testInput = [3,5]
let testInput2 = [3,3]
let testOutput = [3,12]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

// 더 좋은 풀이
//func solution(_ a:Int, _ b:Int) -> Int64 {
//  return Int64(Array(a > b ? b...a : a...b).reduce(0, +))
//}
