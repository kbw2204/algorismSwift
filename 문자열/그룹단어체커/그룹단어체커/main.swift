//
//  main.swift
//  그룹단어체커
//
//  Created by 강병우 on 2020/07/14.
//  Copyright © 2020 강병우. All rights reserved.
//
// a  97
//import Foundation

let n = Int(readLine()!)!
var result = n
for _ in 0 ..< n {
    var check: [Bool] = Array(repeating: false, count: 26)
    let ipt = readLine()!.map{Int(UnicodeScalar(String($0))!.value-97)}
    var status = ipt.first!
    check[status] = true
    for i in 0 ..< ipt.count {
        let pos = ipt[i]
        if status != pos && check[pos] {
            result -= 1
            break
        }
        if status != pos && !check[pos] {
            status = pos
            check[pos] = true
        }
    }
}
print(result)
