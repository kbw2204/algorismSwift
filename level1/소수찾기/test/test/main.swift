//
//  main.swift
//  test
//
//  Created by 강병우 on 16/01/2020.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int {
    var i = 3 // 2는 포함
    var count = 1
    while i <= n {
        check(input: i)
        i += 2
    }
    return count
}

func check(input: Int) -> Bool {
    var arr: [Bool] = Array(repeatElement(false, count: input))
    for i in 2 ..< input {
        if arr[i] == false {
            for j in stride(from: i, to: input, by: <#T##Comparable & SignedNumeric#>)
        }
        if input % i == 0 {
            return false
        }
    }
    return true
}

let testInput = [10]
let testOutput = [4]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

