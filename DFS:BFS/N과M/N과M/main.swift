//
//  main.swift
//  N과M
//
//  Created by 강병우 on 2020/05/27.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func nCr(arr: [Int], depth: Int, target: Int, line: String, result: inout [String]) {
    if target == depth {
        result.append(line)
        return
    }
    
    for i in 0 ..< arr.count {
        var vArr = arr
        var vLine = line + "\(vArr.remove(at: i)) "
        nCr(arr: vArr, depth: depth + 1, target: target, line: vLine, result: &result)
    }
}

let input: [Int] = readLine()!.components(separatedBy: " ").map{Int($0)!}
var arr: [Int] = []
var result: [String] = []
for i in 1 ... input[0] {
    arr.append(i)
}
nCr(arr: arr, depth: 0, target: input[1], line: "", result: &result)
result = Array(Set(result)).sorted()
for line in result {
    print(line)
}
