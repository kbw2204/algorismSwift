//
//  main.swift
//  test
//
//  Created by 강병우 on 06/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        if let _ = Int(s) {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

let testInput = ["a234", "1234"]
let testOutput = [false,true]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

// 더 좋은 풀이
//func solution(_ s:String) -> Bool {
//    return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
//}
