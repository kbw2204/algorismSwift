//
//  main.swift
//  명령프롬프트
//
//  Created by 강병우 on 2020/08/12.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation
func checkValue(_ arr: [String]) -> [Bool] {
    let str = arr.first!
    var result = Array(repeating: true, count: str.count)
    
    for i in 1 ..< arr.count {
        for j in 0 ..< str.count {
            if arr[i][arr[i].index(arr[i].startIndex, offsetBy: j)] != str[str.index(str.startIndex, offsetBy: j)] {
                result[j] = false
            }
        }
    }
    return result
}

let n = Int(readLine()!)!
var arr: [String] = []
for _ in 0 ..< n {
    arr.append(readLine()!)
}

let str = arr.first!
let result = checkValue(arr)
for i in 0 ..< str.count {
    let idx = str.index(str.startIndex, offsetBy: i)
    if result[i] {
        print(str[idx], terminator: "")
    } else {
        print("?", terminator: "")
    }
}
