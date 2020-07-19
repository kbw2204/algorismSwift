//
//  main.swift
//  01타일
//
//  Created by 강병우 on 2020/06/23.
//  Copyright © 2020 강병우. All rights reserved.
//

/*
n = 1
 1
 n=2
 00 11
 n=3
 001 100 111
 n=4
 0011 1001 1100 1111 0000
 n=5
 00001 00100 10000 11100 11001 10011 00111 11111
 n=6
 000000 000011 100001 110000 001111 100111 110011 111001 111100 111111
*/

import Foundation

let n = Int(readLine()!)!
var dp: [Int] = []

if n < 3 {
    dp = [0,1,2]
} else {
    dp = Array(repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    for i in 3 ... n {
        dp[i] = (dp[i-1] + dp[i-2]) % 15746
    }
}

print(dp[n])

