//
//  main.swift
//  더하기 사이클
//
//  Created by 강병우 on 2020/05/21.
//  Copyright © 2020 강병우. All rights reserved.
//
/*
 a = 각 자릿수 합
 b= 가장 오른쪽 수
 새로운 수 = b + a의 가장 오른쪽 수
 */


import Foundation

var input: Int = Int(readLine()!)!
if input < 10 {
    input *= 10
}
var target: Int = input
var count = 0

while input != target || count == 0 {
    let str = String(target)
    let a = String(str.map{Int(String($0))!}.reduce(0, {$0 + $1}))
    let b = String(str.last!)
    target = Int(b + String(a.last!))!
    count += 1
}

print(count)
