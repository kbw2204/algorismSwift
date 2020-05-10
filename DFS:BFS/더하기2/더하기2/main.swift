//
//  main.swift
//  더하기2
//
//  Created by 강병우 on 2020/05/10.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let input = readLine()!
let inputArray = input.components(separatedBy: " ").map{Int($0)!}
var result: [String] = []

let target = inputArray[0]
let k = inputArray[1]

for i in 1 ... 3 {
    if i <= target {
        dfs(target: target, sum: i, history: "\(i)", result: &result)
    }
}

result.sort()
if result.count + 1 > k {
    print(result[k-1])
} else {
    print("-1")
}


func dfs(target: Int, sum: Int, history: String, result: inout [String]) {
    if sum == target {
        result.append(history)
    }
    
    for i in 1 ... 3 {
        if sum + i <= target {
            dfs(target: target, sum: sum + i, history: history + "+\(i)", result: &result)
        }
    }
}

