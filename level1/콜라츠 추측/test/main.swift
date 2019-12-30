//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ num:Int) -> Int {
    var temp = num
    var count = 0
    while temp != 1 {
        temp = run(temp)
        count += 1
        if count == 500 {
            return -1
        }
    }
    return count
}

func run(_ val: Int) -> Int {
    return val % 2 == 0 ? val / 2 : (val * 3) + 1
}

let testInput = [6]
let testOutput = [8]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

