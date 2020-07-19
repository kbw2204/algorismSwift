//
//  main.swift
//  rgb거리
//
//  Created by 강병우 on 2020/05/29.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

extension Substring {
    func toInt() -> Int {
        return Int(String(self))!
    }
}

let n: Int = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: [0,0,0], count: n + 1)
var input: [[Int]] = [[0,0,0]]
for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map{$0.toInt()}
    input.append(line)
}

for i in 1 ... n {
    dp[i][0] = [dp[i-1][1] , dp[i-1].last!].min()! + input[i][0]
    dp[i][1] = [dp[i-1][0] , dp[i-1].last!].min()! + input[i][1]
    dp[i][2] = [dp[i-1][0] , dp[i-1][1]].min()! + input[i].last!
}

print([dp[n][0], dp[n][1], dp[n].last!].min()!)



