//
//  main.swift
//  test
//
//  Created by 강병우 on 15/01/2020.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ s:String) -> String {
//    return String(s.sorted { $0 > $1 })
    return s.map{String($0)}.sorted(by: >).joined()
}

let testInput = ["Zbcdefg"]
let testOutput = ["gfedcbZ"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

