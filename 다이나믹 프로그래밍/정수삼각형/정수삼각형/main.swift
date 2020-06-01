//
//  main.swift
//  정수삼각형
//
//  Created by 강병우 on 2020/05/30.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

extension Substring {
    func toInt() -> Int {
        return Int(String(self))!
    }
}

let n: Int = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var input: [[Int]] = [[0]]
for _ in 0 ..< n {
    let line: [Int] = readLine()!.split(separator: " ").map{$0.toInt()}
    input.append(line)
    
}

for i in 1 ... n {
    for j in 0 ..< i {
        let currentNode = input[i][j]
        if j == 0 {
            dp[i][j] = currentNode + dp[i-1][0]
        } else if j == i - 1 {
            dp[i][j] = currentNode + dp[i-1][j-1]
        } else {
            dp[i][j] = currentNode + [dp[i-1][j-1], dp[i-1][j]].max()!
        }
    }
}

print(dp[n].max()!)
