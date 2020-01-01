//
//  main.swift
//  test
//
//  Created by 강병우 on 01/01/2020.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = arr1
    // 2차원 배열 초기화 이게 맞나..?
//    var arr3:[[Int]] = Array(repeating:Array(repeating:0, count:arr1[0].count), count:arr1.count)
    for i in 0 ..< arr1.count {
        for j in 0 ..< arr1[i].count {
            result[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return result
}

let testInput = [[[1,2],[2,3]], [[1],[2]]]
let testInput2 = [[[3,4],[5,6]], [[3],[4]]]
let testOutput = [[[4,6],[7,9]], [[4],[6]]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

