/*
1 -> 1
 2-> 10
 3-> 100 101
 4 -> 1000 1010 1001
 5 -> 10000 10100 10010 10101 10001
*/


import Foundation

let n = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: [0,0], count: n + 1)
if n < 4 {
    if n < 3 {
        dp[n] = [1,0]
    } else {
        dp[n] = [2,0]
    }
} else {
    dp[1] = [0,1]
    dp[2] = [1,0]
    dp[3] = [1,1]
    for i in 4 ... n {
        dp[i][0] = dp[i-1][0] + dp[i-1][1]
        dp[i][1] = dp[i-1][0]
    }
}
print(dp[n].reduce(0, +))
