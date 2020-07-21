//
//  main.swift
//  셀프넘버
//
//  Created by 강병우 on 2020/07/21.
//  Copyright © 2020 강병우. All rights reserved.
//


var arr: [Bool] = Array(repeating: false, count: 10001)
for i in 1 ... 10000 {
    let tmp = String(i).map{Int(String($0))!}.reduce(i, +)
    if tmp <= 10000 {
        arr[tmp] = true
    }
}
for j in 1 ... 10000 {
    if !arr[j] {
        print(j)
    }
}

