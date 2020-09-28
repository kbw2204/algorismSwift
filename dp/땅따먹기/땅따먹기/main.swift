//
//  main.swift
//  땅따먹기
//
//  Created by 강병우 on 2020/09/28.
//

func solution(_ land:[[Int]]) -> Int{
    
    var dp: [[Int]] = Array(repeating: [0,0,0,0], count: land.count)
    
    dp[0] = land[0]
    
    for i in 1 ..< land.count {
        for j in 0 ..< 4 {
            var maxIdx = 0
            var max = 0
            for k in 0 ..< 4 {
                if k != j {
                    let bf = dp[i-1][k]
                    if max < bf {
                        max = bf
                        maxIdx = k
                    }
                }
            }
            dp[i][j] = dp[i-1][maxIdx] + land[i][j]
        }
    }

    return dp[dp.count-1].max()!
}



print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
