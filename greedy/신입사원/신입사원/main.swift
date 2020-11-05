//
//  main.swift
//  신입사원
//
//  Created by 강병우 on 2020/11/03.
//

//import Foundation

//for _ in 0 ..< Int(readLine()!)! {
//    var 합격자수 = 1
//    var list: [[String]] = []
//    let n = Int(readLine()!)!
//    for _ in 0 ..< n { list.append(readLine()!.split(separator: " ").map{String($0)}) }
//    list.sort(by: {$0[0]<$1[0]})
//    var min = list[0][1]
//    for i in 1 ..< n {
//        if min > list[i][1] {
//            합격자수 += 1
//            min = list[i][1]
//        }
//    }
//    print(합격자수)
//}

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

let testCase = file.readInt()

for _ in 0 ..< testCase {
    var 합격자수 = 1
    let n = file.readInt()
    var list: [[Int]] = Array(repeating: [], count: n)
    for i in 0 ..< n {
        list[i].append(file.readInt())
        list[i].append(file.readInt())
    }
    list.sort(by: {$0[0]<$1[0]})
    var min = list[0][1]
    for i in 1 ..< n {
        if min > list[i][1] {
            합격자수 += 1
            min = list[i][1]
        }
    }
    print(합격자수)
}
