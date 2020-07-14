//
//  main.swift
//  다이얼
//
//  Created by 강병우 on 2020/07/14.
//  Copyright © 2020 강병우. All rights reserved.
//
// A = 65
//import Foundation

let ipt = readLine()!.map{Int(UnicodeScalar(String($0))!.value)-65}
var result = 0
ipt.forEach{
    switch $0 {
    case 0...2:
        result += 3
    case 3...5:
        result += 4
    case 6...8:
        result += 5
    case 9...11:
        result += 6
    case 12...14:
        result += 7
    case 15...18:
        result += 8
    case 19...21:
        result += 9
    case 22...25:
        result += 10
    default:
        result += 0
    }
}
print(result)
