//
//  main.swift
//  스도쿠2
//
//  Created by 강병우 on 2020/10/06.
//  Copyright © 2020 강병우. All rights reserved.
//
import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()

//let startDate = Date()
var b: [[Int]] = []
for _ in 0 ..< 9 {
    let ipt = file.readString()
    b.append(ipt.split(separator: " ").map{Int(String($0))!})
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
