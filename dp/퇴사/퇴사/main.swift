//
//  main.swift
//  퇴사
//
//  Created by 강병우 on 2020/07/14.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: 17)
var day: [Int] = Array(repeating: 0, count: 17)
var pay: [Int] = Array(repeating: 0, count: 17)
var max = 0
for i in 1 ... n {
    let ipt = readLine()!.split(separator: " ").map{Int(String($0))!}
    day[i] = ipt[0]
    pay[i] = ipt[1]
}

for i in 1 ... n {
    if i+day[i] <= n+1 {
        dp[i+day[i]] = [dp[i+day[i]], dp[i]+pay[i]].max()!
        max = [max, dp[i+day[i]]].max()!
    }
    dp[i+1] = [dp[i+1], dp[i]].max()!
    max = [max, dp[i+1]].max()!
}
print(max)
