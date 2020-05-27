//
//  main.swift
//  test3
//
//  Created by 강병우 on 2020/05/27.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func find(x: Int, parent: inout [[Int]]) -> Int {
    parent[x][1] += 1
    if x == parent[x][0] {
        return x
    } else {
        return find(x: parent[x][0], parent: &parent)
    }
}

func findParent(x: Int, y: Int, parent: inout [[Int]]) -> Bool {
    let a = find(x: x, parent: &parent)
    let b = find(x: y, parent: &parent)
    return a == b ? true : false
}

func union(x: Int, y: Int, parent: inout [[Int]]) {
    let a = find(x: x, parent: &parent)
    let b = find(x: y, parent: &parent)
    if a != b {
        parent[b][0] = a
    }
}


var arr: [[Int]] = [[9,2], [9,3], [3,4],[3,7], [3,5] ]
var nodeSet: Set<Int> = []

for i in 0 ..< arr.count {
    for j in 0 ..< arr[i].count {
        nodeSet.insert(arr[i][j])
    }
}
let nodeList = Array(nodeSet).sorted()
var parent: [[Int]] = Array(repeating: [0,0], count: 1 + nodeList.max()!)
//var rank: [Int] = Array(repeating: 1, count: 1 + nodeList.max()!)

for node in nodeList {
    parent[node][0] = node
}

for node in arr {
    union(x: node[0], y: node[1], parent: &parent)
}

print(parent)

print(findParent(x: 9, y: 7, parent: &parent))


