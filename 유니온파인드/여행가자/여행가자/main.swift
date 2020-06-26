//
//  main.swift
//  여행가자
//
//  Created by 강병우 on 2020/06/26.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

// MARK: - Func
func find(x: Int) -> Int {
    if x == parent[x] {
        return x
    } else {
        return find(x: parent[x])
    }
}

func union(x: Int, y: Int) {
    var a = find(x: x)
    var b = find(x: y)
    
    if level[a] < level[b] {
        swap(&a, &b)
    }
    
    if a != b {
        parent[b] = a
    }
    
    if level[a] == level[b] {
        level[b] += 1
    }
}

func checkParent(x: Int, y: Int) -> Bool {
    let a = find(x: x)
    let b = find(x: y)
    
    return a == b ? true : false
}

// MARK: - Input & Property
let n = Int(readLine()!)!
var result = Int(readLine()!)!
var nodeArray: [[Int]] = [[0]]
var parent: [Int] = Array(repeating: 0, count: n+1)
var level: [Int] = Array(repeating: 1, count: n+1)
var target: [Int] = []

for i in 1 ... n {
    nodeArray.append(readLine()!.split(separator: " ").map{Int($0)!})
    parent[i] = i
}

target = readLine()!.split(separator: " ").map{Int($0)!}

// MARK: - Run
for i in 1 ... n {
    for j in 0 ..< n {
        if nodeArray[i][j] == 1 {
            union(x: i, y: j+1)
        }
    }
}

for i in 0 ..< target.count-1 {
    if !checkParent(x: target[i], y: target[i+1]) {
        print("NO")
        result = -1
        break
    }
}
if result != -1 { print("YES") }
