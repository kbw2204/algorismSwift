//
//  main.swift
//  피보나치수5
//
//  Created by 강병우 on 2020/07/19.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)
if n > 1 {
    dp[1] = 1
    for i in 2 ... n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    print(dp[n])
} else { n == 0 ? print(0) : print(1)}
