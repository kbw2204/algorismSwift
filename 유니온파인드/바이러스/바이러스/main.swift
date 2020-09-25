//
//  main.swift
//  바이러스
//
//  Created by 강병우 on 2020/05/27.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func find(x: Int, parent: [Int]) -> Int {
    if parent[x] == x {
        return x
    } else {
        return find(x: parent[x], parent: parent)
    }
}

func union(x: Int, y: Int, parent: inout [Int]) {
    let a = find(x: x, parent: parent)
    let b = find(x: y, parent: parent)
    if a != b {
        parent[b] = a
    }
}

func findParent(x: Int, y: Int, parent: [Int]) -> Bool {
    let a = find(x: x, parent: parent)
    let b = find(x: y, parent: parent)
    return a == b ? true : false
}

let count: Int = Int(readLine()!)!
var parent: [Int] = Array(repeating: 0, count: count + 1)
var connectionCount: Int = Int(readLine()!)!

for i in 1 ..< count + 1 {
    parent[i] = i
}

while connectionCount != 0 {
    let edge: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    union(x: edge[0], y: edge[1], parent: &parent)
    connectionCount -= 1
}

print(parent.filter{findParent(x: $0, y: 1, parent: parent)}.count - 1) // 자신 제외
