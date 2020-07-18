//
//  main.swift
//  팩토리얼
//
//  Created by 강병우 on 2020/07/18.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation
let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 1, count: n+1)
if n != 0 {
    for i in 1 ... n {
        dp[i] = dp[i-1]*i
    }
    print(dp[n])
} else { print(1)}
