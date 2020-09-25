//
//  main.swift
//  atm
//
//  Created by 강병우 on 2020/09/25.
//  Copyright © 2020 강병우. All rights reserved.
//

let n = Int(readLine()!)!

let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var tmpArray: [Int] = Array(repeating: 0, count: n)
tmpArray[0] = input[0]

for i in 1 ..< n {
    tmpArray[i] = tmpArray[i-1] + input[i]
}

print(tmpArray.reduce(0, +))
