//
//  main.swift
//  점프와 순간이동
//
//  Created by 강병우 on 2020/10/22.
//

//import Foundation
//
//func solution(_ n:Int) -> Int {
//    var n = n
//    while n%2 == 0 {
//        n /= 2
//    }
//    var min = n
//    dfs(n, 1, 1, &min)
//    return min
//}
//
//func dfs(_ n: Int, _ pos: Int, _ e: Int, _ min: inout Int) {
//    if e >= min { return }
//    if pos > n { return }
//    else if pos == n {
//        if e < min { min = e }
//        return
//    }
//
//    dfs(n, pos+2, e+2, &min)
//    dfs(n, pos+1, e+1, &min)
//    if pos*2 <= n {
//        dfs(n, pos*2, e, &min)
//    }
//}

func solution(_ n:Int) -> Int {
    var n = n
    var m = 0
    while n>0 {
        m += n%2
        n /= 2
    }
    return m
}

let n = 5
let rs = solution(n)
print(rs)
