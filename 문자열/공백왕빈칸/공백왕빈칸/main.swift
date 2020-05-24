//
//  main.swift
//  공백왕빈칸
//
//  Created by 강병우 on 2020/05/23.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(input: String) {
    var arr: [String] = input.components(separatedBy: "\n")
    var doubleArr: [[String]] = []
    var countArr: [Int] = []
    for i in 0 ..< arr.count {
        while arr[i].contains("  ") {
            arr[i] = arr[i].replacingOccurrences(of: "  ", with: " ")
        }
        // 뒤 빈칸 삭제
        while arr[i].last == Character(" ") {
            arr[i].removeLast()
        }
        //앞 빈칸
        arr[i] = String(arr[i].reversed())
        while arr[i].last == Character(" ") {
            arr[i].removeLast()
        }
        arr[i] = String(arr[i].reversed())
        let line: [String] = arr[i].components(separatedBy: " ")
        doubleArr.append(line)
        for c in 0 ..< line.count {
            if countArr.count < c + 1 {
                countArr.append(line[c].count)
            } else {
                let count = line[c].count
                if count > countArr[c] {
                    countArr[c] = count
                }
            }
        }
        
    }
    
    for i in 0 ..< doubleArr.count {
        var line: String = ""
        for j in 0 ..< doubleArr[i].count {
            line += adjust(str: doubleArr[i][j], size: countArr[j])
            if j != doubleArr[i].count - 1 {
                line += " "
            }
        }
        while line.last == Character(" ") {
            line.removeLast()
        }
        print(line)
    }
}

func adjust(str: String, size: Int) -> String {
    let count = size - str.count
    var vStr = str
    for _ in 0 ..< count {
        vStr = vStr + " "
    }
    return vStr
}

let input = "  start:  integer;    // begins here\nstop: integer; //  ends here\n s:  string;\nc:   char; // temp "
//let input = "a bc z\nde f zz"
//let input: String = readLine()!

solution(input: input)
