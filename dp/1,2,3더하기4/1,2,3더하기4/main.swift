//
//  main.swift
//  1,2,3더하기4
//
//  Created by 강병우 on 2020/07/14.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let count = Int(readLine()!)!

for _ in 0 ..< count {
    let n = Int(readLine()!)!
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    if n < 5 {
        if n == 1 {
            print(1)
        } else if n == 2 {
            print(2)
        } else if n == 3 {
            print(3)
        } else if n == 4 {
            print(4)}
//        } else if n == 5 { print(5)}
//        else if n == 6 { print(7)}
    } else {
        dp[2] = 1
        dp[3] = 3
        dp[4] = 4
        dp[5] = 5
        for i in 5...n {
            dp[i] = 1 + dp[i-2] + i/3
        }
        print(dp[n])
    }
}

