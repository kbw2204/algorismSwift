
//  main.swift
//  크로아티아알파벳
//
//  Created by 강병우 on 2020/07/12.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let list = ["c=", "c-","d-","lj","nj","s=","z="].map{abs($0.hashValue)%10000}
var arr: [Int] = Array(repeating: 0, count: 10001)
var result = 0
list.forEach{
    arr[$0] = 1
}
arr[abs("dz".hashValue%10000)] = 2

let ipt = readLine()!.map{String($0)}
let count = ipt.count
var pos = 0
while pos < count-1 {
    let hash = abs((ipt[pos]+ipt[pos+1]).hashValue)%10000
    let t = arr[hash]
    if t == 1 {
        pos += 2
    } else if t == 2 && pos+3 <= count && ipt[pos+2] == "="{
        pos += 3
    } else {
        pos += 1
    }
    result += 1
}
if pos != count {
    result += 1
}
print(result)
