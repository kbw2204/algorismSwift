//
//  main.swift
//  retirement
//
//  Created by 강병우 on 2020/03/05.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation


let count: Int = Int(readLine()!)!
var inputArray: [String] = []
for _ in 0 ..< count {
    inputArray.append(readLine()!)
}
var max: Int = 0
var pos = 0
var arr = inputArray.map{$0.components(separatedBy: " ")}.map{Double($0[1])! / Double($0[0])!}

for i in 0 ..< count {
    var sum = 0
    pos = i
    while pos < count {
        let subArray = arr[pos...]
        if let addPos = subArray.firstIndex(of: subArray.max()!) {
            pos = addPos
        }
        let dayArray = inputArray[pos].components(separatedBy: " ")
        if let addPos = Int(dayArray[0]) {
            if addPos + pos >= count {
                break
            }
            pos += addPos - 1
        }
        if let price = Int(dayArray[1]) {
            sum += price
        }
    }
    if sum > max {
        max = sum
    }
}
print(max)

