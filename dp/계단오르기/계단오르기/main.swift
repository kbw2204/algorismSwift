//
//  main.swift
//  계단오르기
//
//  Created by 강병우 on 2020/07/04.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let n: Int = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: n+1)
var arr: [Int] = [0]
var i = 0
for _ in 0 ..< n {
    arr.append(Int(readLine()!)!)
}

if n > 2 {
    dp[1] = arr[1]
    dp[2] = [arr[1]+arr[2], arr[2]].max()!

    for i in 3 ... n {
        let step1 = dp[i-3] + arr[i-1] + arr[i]
        let step2 = dp[i-2] + arr[i]
        dp[i] = [step1, step2].max()!
    }
    print(dp[n])
} else {
    n == 1 ? print(arr[1]) : print([arr[1]+arr[2], arr[2]].max()!)
}

