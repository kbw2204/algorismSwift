//
//  main.swift
//  수정렬하기
//
//  Created by 강병우 on 2020/07/11.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let n  = Int(readLine()!)!
var arr: [Int] = []
for _ in 0 ..< n {
    let ipt = Int(readLine()!)!
    if !arr.contains(ipt) {
        arr.append(ipt)
    }
}
arr.sort()
for num in arr {
    print(num)
}
