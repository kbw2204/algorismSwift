//
//  main.swift
//  top
//
//  Created by 강병우 on 2020/04/22.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ heights:[Int]) -> [Int] {
    var result: [Int] = []
    var stack = heights
    
    while !stack.isEmpty {
        guard let temp = stack.popLast() else {
            break
        }
        
        for i in (0 ..< stack.count).reversed() {
            if stack[i] > temp {
                result.append(i+1)
                break
            } else if i == 0 {
                result.append(0)
            }
        }
    }
    result.append(0)
    return result.reversed()
}

let testInput = [[6,9,5,7,4],[3,9,9,3,5,7,2],[1,5,3,6,7,6,5]]
let testOutput = [[0,0,2,2,4],[0,0,0,3,3,3,6],[0,0,2,0,0,5,6]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

