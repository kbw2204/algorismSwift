//
//  main.swift
//  toInt
//
//  Created by 강병우 on 30/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Int {
    
    if s.first == "-" {
        guard let result = Int(s.components(separatedBy: "-").joined()) else {
            return 0
        }
        return result * (-1)
    } else {
        guard let result = Int(s) else {
            return 0
        }
        return result
    }
}



let testInput = ["11", "1", "-21", "-1234"]
let testOutput = [11, 1, -21, -1234]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

