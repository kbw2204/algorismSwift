//
//  main.swift
//  요세푸스 문제0
//
//  Created by 강병우 on 2020/07/04.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

let ipt = readLine()!.split(separator: " ").map{Int($0)!}
var arr: [Int] = []
var queue: [Int] = []
let idx = ipt.last!

for i in 1 ... ipt.first! {
    arr.append(i)
}

while !arr.isEmpty {
    if arr.count >= idx {
        var front = Array(arr[..<idx])
        let end = Array(arr[idx...])
        queue.append(front.removeLast())
        arr = end + front
    } else {
        let restIdx = idx%arr.count
        for _ in 0 ..< restIdx {
            arr.append(arr.removeFirst())
        }
        queue.append(arr.removeLast())
    }
}

print("<", terminator: "")
for i in 0 ..< queue.count - 1 {
    print(queue[i], terminator: ", ")
}
print(queue.last!, terminator: "")
print(">")
