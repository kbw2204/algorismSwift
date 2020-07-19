//
//  main.swift
//  2*n타일링2
//
//  Created by 강병우 on 2020/06/01.
//  Copyright © 2020 강병우. All rights reserved.
//

/*
1 - 1
 2 - 3
 3 - 2번째(사각형) + 1번째
 4 - 3번째 + 2번째
*/

import Foundation

let n: Int = Int(readLine()!)!
if n < 3 {
    if n == 0 {
        print(0)
    } else if n == 1 {
        print(1)
    } else if n == 2 {
        print(3)
    }
} else {
    var dp: [Int] = Array(repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 3
    for i in 3 ... n {
        dp[i] = ( dp[i-1] + dp[i-2]*2 )%10007
    }
    print(dp[n])
}


