//
//  main.swift
//  타일 채우기
//
//  Created by 강병우 on 2020/06/22.
//  Copyright © 2020 강병우. All rights reserved.
//
/*
꽉 채워야함 홀수 == 0
 2개씩 늘어날때마다 계산하는 과정에서 idx가 0일때도 계산함으로 0도 초기값을 줘야함
 2-3
 3-6
 4-9
*/

import Foundation

let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: n+1)

if n < 4 {
    if n == 2 { dp[2] = 3 }
} else {
    if n % 2 == 0 {
        dp[0] = 1
        dp[2] = 3
        for i in stride(from: 4, through: n, by: 2) {
            dp[i] = dp[i-2] * 3
            var j = 4
            while i-j >= 0 {
                dp[i] += dp[i-j] * 2
                j += 2
            }
        }
    }
}

print(dp[n])
