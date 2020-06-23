//
//  main.swift
//  피보나치수2
//
//  Created by 강병우 on 2020/06/23.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: n+1)
if n < 3 {
    dp = [0,1,1]
} else {
    dp[1] = 1
    dp[2] = 1
    
    for i in 3 ... n {
        dp[i] = dp[i-1] + dp[i-2]
    }
}

print(dp[n])
