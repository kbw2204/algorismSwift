//
//  main.swift
//  스도쿠
//
//  Created by 강병우 on 2020/10/06.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

var b: [[Int]] = []
var zeroPos: [[Int]] = []
var basket: [[Int]] = []
for _ in 0 ..< 9 {
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var tmp: [Int] = []
    var chck: [Int] = Array(1...9)
    
    b.append(arr)
    // 수정해야함
    for i in 0 ..< 9 {
        let v = arr[i]
        if v == 0 {
            tmp.append(i)
            continue
        }
        chck[v-1] = 0
    }
    zeroPos.append(tmp)
    basket.append(chck.filter{$0 != 0})
}

dfs(0,0)

func dfs(_ r: Int, _ c: Int) {
    if r == 9 {
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
    
    let col = zeroPos[r][c]
    
    let isValid: (Int) -> Bool = {val in
        // 가로 체크
        if b[r].contains(val) { return false } // 수정해야함
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
                    v = b[((r/3)*3)+i/3][((col/3)*3)+i%3]
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
    
    var isEdited = false
    for i in basket[r] {
        if isValid(i) {
            b[r][col] = i
            isEdited = true
            if c == zeroPos[r].count-1 {
                dfs(r+1, 0)
            } else {
                dfs(r, c+1)
            }
        }
    }
    if isEdited { b[r][col] = 0 }
}
