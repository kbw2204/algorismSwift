//
//  main.swift
//  쇠막대기
//
//  Created by 강병우 on 2020/04/22.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ arrangement:String) -> Int {
    var stack: [String] = arrangement.map{String($0)}
    while !stack.isEmpty {
        <#code#>
    }
    return 0
}

let testInput = ["()(((()())(())()))(())"]
let testOutput = [17]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}



