//
//  main.swift
//  알파벳찾기
//
//  Created by 강병우 on 2020/07/13.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

// a 아스키값 97
var arr: [Int] = Array(repeating: -1, count: 26)
let ipt = readLine()!
var pos = ipt.count - 1
ipt.reversed().map{Int(UnicodeScalar(String($0))!.value)-97}.forEach{
    arr[$0]=pos
    pos -= 1
}
arr.forEach{
    print($0, terminator: " ")
}

