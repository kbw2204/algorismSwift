//
//  main.swift
//  파도반수열
//
//  Created by 강병우 on 2020/06/24.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(n: Int) {
    if n < 6 {
        if n < 4 { print(1) }
        else { print(2) }
    } else {
        var dp: [Int] = Array(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 1
        dp[3] = 1
        dp[4] = 2
        dp[5] = 2
        for i in 6 ... n {
            dp[i] = dp[i-5] + dp[i-1]
        }
        print(dp[n])
    }
}

let count: Int = Int(readLine()!)!

for _ in 0 ..< count {
    solution(n: Int(readLine()!)!)
}
