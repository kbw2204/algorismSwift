//
//  main.swift
//  스도쿠
//
//  Created by 강병우 on 2020/10/06.
//  Copyright © 2020 강병우. All rights reserved.
//

var b: [[Int]] = []
var endKey = false

for _ in 0 ..< 9 {
    b.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
dfs(b, 0, endKey: &endKey)

func printB(_ b: [[Int]]) {
    // 출력
    for line in b {
        var result: String = ""
        for c in line {
            result += "\(c) "
        }
        result.removeLast()
        print(result)
    }
}

func dfs(_ b: [[Int]], _ idx: Int, endKey: inout Bool) {
    if idx == 81 {
        print()
        printB(b)
        endKey = true
        return
    } else if endKey { return }
    
    let row = idx / 9
    let col = idx % 9
    if b[row][col] != 0 {
        dfs(b, idx+1, endKey: &endKey)
    } else {
        for i in 1 ... 9 {
            var vb = b
            vb[row][col] = i
            if isValid(&vb, row, col) {
                dfs(vb, idx+1, endKey: &endKey)
            }
        }
    }
}

func checkLine(_ b: inout [[Int]], _ r: Int, _ c: Int, isReversed: Bool) -> Bool {
    var chck: [Bool] = Array(repeating: true, count: 10)
    for i in 0 ..< 9 {
        var val = 0
        if isReversed {
            val = b[i][c]
        } else {
            val = b[r][i]
        }
        
        if val == 0 { continue }
        // 값 중복 체크
        else if chck[val] {
            chck[val] = false
        } else {
            return false
        }
    }
    
    return true
}

func checkBlock( _ b: inout [[Int]], _ row: Int, _ col: Int) -> Bool {
    var chck: [Bool] = Array(repeating: true, count: 10)
    let r = (row/3) * 3
    let c = (col/3) * 3
    
    for i in r ..< r+3 {
        for j in c ..< c+3 {
            let val = b[i][j] // 0 ~ 9 값
            if val == 0 { continue }
                // 중복체크
            else if chck[val] {
                chck[val] = false
            } else {
                return false
            }
        }
    }
    return true
}
    
func isValid(_ b: inout [[Int]], _ row: Int, _ col: Int) -> Bool {
    // 가로 - 라인당 0 ~ 9 가 있을 수 있음
    if !checkLine(&b, row, col, isReversed: false) { return false }
    
    // 세로
    if !checkLine(&b, row, col, isReversed: true) { return false }
    
    // 사각형 체크
    if !checkBlock(&b , row, col) { return false }

    return true
}
