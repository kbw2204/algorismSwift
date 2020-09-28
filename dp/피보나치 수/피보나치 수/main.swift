//
//  main.swift
//  피보나치 수
//
//  Created by 강병우 on 2020/09/29.
//

func solution(_ n:Int) -> Int {
    
    var dp = Array(repeating: 0, count: n+1)
    dp[1] = 1
    
    for i in 2 ... n {
        let sum = dp[i-1] + dp[i-2]
        if sum > 1234567 {
            dp[i] = sum % 1234567
        } else {
            dp[i] = sum
        }
    }
    
    return dp[n]
}

let n = 3
let rs = solution(n)
print(rs)
