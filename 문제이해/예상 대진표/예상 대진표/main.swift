//
//  main.swift
//  예상 대진표
//
//  Created by 강병우 on 2020/10/23.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var count = 0
    var a = a
    var b = b
    
    while a/2 != b/2 || a != b {
        a = a/2 + a%2
        b = b/2 + b%2
        count += 1
    }
    return count
}


let rs = solution(8, 2, 3)
print(rs) // 2

