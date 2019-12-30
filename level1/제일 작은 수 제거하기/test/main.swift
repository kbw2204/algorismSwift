//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    return arr.count != 1 ? arr.sorted(by: >).dropLast() : [-1]
}

let testInput = [[4,3,2,1],[10]]
let testOutput = [[4,3,2],[-1]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

