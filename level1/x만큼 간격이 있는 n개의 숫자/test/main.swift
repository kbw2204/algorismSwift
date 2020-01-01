//
//  main.swift
//  test
//
//  Created by 강병우 on 02/01/2020.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map{Int64($0*x)}
}

let testInput = [2, 4, -4]
let testInput2 = [5,3,2]
let testOutput: [[Int64]] = [[2,4,6,8,10],[4,8,12],[-4, -8]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

