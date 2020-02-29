//
//  main.swift
//  dfdf
//
//  Created by 강병우 on 2020/02/29.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

var testInput: [Int] = []
var result: [Int] = []

for _ in 0 ..< 9 {
    testInput.append(Int(readLine()!)!)
}

let testOutput = [7,8,10,13,19,20,23]

let sum = testInput.reduce(0,{$0+$1})
let resultSum = testOutput.reduce(0, {$0+$1})

for i in 0 ..< 8 {
    for j in i+1 ..< 9 {
        if sum - testInput[i] - testInput[j] == resultSum {
            result = testInput.filter{$0 != testInput[i] && $0 != testInput[j]}.sorted(by: <)
            break
        }
    }
}

result.map{print($0)}
