//
//  main.swift
//  압축풀이
//
//  Created by 강병우 on 2020/06/22.
//  Copyright © 2020 강병우. All rights reserved.
//
// char별로 팝푸쉬를 하는게 아니라.. 길이만 계산해주면 되네..

import Foundation

let input: [String.Element] = Array(readLine()!)
var idx = 0
var strArray = [[Character]](repeating: [Character](), count: 101)
var lengthArray = Array(repeating: 0, count: 101)

for i in input.indices {
    let str = input[i]
    if str == "(" { idx += 1 }
    else if str == ")" {
        idx -= 1
        lengthArray[idx] += Int(strArray[idx].last!.asciiValue! - 48) * lengthArray[idx+1]-1
        lengthArray[idx+1] = 0
        strArray[idx+1] = []
    } else {
        lengthArray[idx] += 1
        strArray[idx].append(str)
    }
}

print(lengthArray.first!)
