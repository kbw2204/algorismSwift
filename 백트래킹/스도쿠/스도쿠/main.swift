//
//  main.swift
//  스도쿠
//
//  Created by 강병우 on 2020/10/06.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

var b: [[Int]] = []
for _ in 0 ..< 9 {
    b.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
dfs(0)

func dfs(_ idx: Int) {
    if idx == 81 {
        for line in b {
            var result: String = ""
            for c in line {
                result += "\(c) "
            }
            result.removeLast()
            print(result)
        }
        exit(0)
    }
    
    let row = idx / 9
    let col = idx % 9
    
    let isValid: (Int) -> Bool = {val in
        // 가로 체크
        if b[row].contains(val) { return false }
        
        for k in 0 ... 1 {
            var chck: [Bool] = Array(repeating: true, count: 9)
            chck[val-1] = false
            for i in 0 ..< 9 {
                var v = 0
                if k == 0 {
                    // 세로
                    v = b[i][col]
                } else {
                    // 블록
                    v = b[((row/3)*3)+i/3][((col/3)*3)+i%3]
                }
                if v != 0 {
                    if chck[v-1] {
                        chck[v-1] = false
                    } else {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    if b[row][col] != 0 {
        dfs(idx+1)
    } else {
        var isEdited = false
        for i in 1 ... 9 {
            if isValid(i) {
                b[row][col] = i
                isEdited = true
                dfs(idx+1)
            }
        }
        if isEdited { b[row][col] = 0 }
    }
}
