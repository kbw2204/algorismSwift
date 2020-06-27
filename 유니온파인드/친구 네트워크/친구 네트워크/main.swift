//
//  main.swift
//  친구 네트워크
//
//  Created by 강병우 on 2020/06/26.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

// MARK: - Func
func find(_ x: Int, _ parent: [Int]) -> Int {
    if x == parent[x] { return x }
    else { return find(parent[x], parent) }
}

func union(_ x: Int, _ y: Int, _ parent: inout [Int], level: inout [Int]) {
    var a = find(x, parent)
    var b = find(y, parent)
    
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

func checkParent(x: Int, y: Int, parent: [Int]) -> Bool {
    let a = find(x, parent)
    let b = find(y, parent)
    return a == b ? true : false
}


let count = Int(readLine()!)!

for _ in 0 ..< count {
    var stack: [String] = []
    var idxInfo: [String: Int] = [:]
    var idx = 1
    var parent: [Int] = [0]
    var level: [Int] = [1]
    let F: Int = Int(readLine()!)!
    
    for _ in 0 ..< F {
        let ipt = readLine()!.split(separator: " ").map{String($0)}
        
        for i in 0 ..< 2 {
            let str = ipt[i]
            if idxInfo[str] == nil {
                stack.append(str)
                idxInfo[str] = idx
                parent.append(idx)
                level.append(1)
                idx += 1
            }
        }
        
        union(idxInfo[ipt.first!]!, idxInfo[ipt.last!]!, &parent, level: &level)
        print(parent.filter{$0 == find(idxInfo[ipt.first!]!, parent)}.count)
        print(parent)
    }
    print("---")
}



