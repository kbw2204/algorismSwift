//
//  main.swift
//  수정렬하기2
//
//  Created by 강병우 on 2020/07/11.
//  Copyright © 2020 강병우. All rights reserved.
//

let n  = Int(readLine()!)!
var arr: [Int] = []
for _ in 0 ..< n {
    arr.append(Int(readLine()!)!)
}
let set: Set<Int> = Set(arr)
arr = Array(set).sorted()
for num in arr {
    print(num)
}
