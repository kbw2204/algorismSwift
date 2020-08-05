//
//  main.swift
//  동전0
//
//  Created by 강병우 on 2020/08/05.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

let ipt = readLine()!.split(separator: " ").map{Int(String($0))!}
var money = ipt.last!
var arr: [Int] = []
var result = 0
for _ in 0 ..< ipt.first! {
    let coin = Int(readLine()!)!
    arr.append(coin)
}
arr.sorted(by: >).forEach {
    result += money / $0
    money %= $0
}
print(result)

