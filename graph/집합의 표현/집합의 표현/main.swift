//
//  main.swift
//  집합의 표현
//
//  Created by 강병우 on 2020/05/27.
//  Copyright © 2020 강병우. All rights reserved.
//
/*
 // [타입, val1, val2] 이렇게 입력받음
 // 타입 0 ~ v1, v2 합치고
 // 1 ~ v1과 v2가 같은 집합에 들어있나? -> Bool값 yes or no로 리턴
*/


import Foundation

func find(x: Int, parent: [Int]) -> Int {
    if x == parent[x] {
        return x
    } else {
        return find(x: parent[x], parent: parent)
    }
}

func union(x: Int, y: Int, parent: inout [Int], level: inout [Int]) {
    var a = find(x: x, parent: parent)
    var b = find(x: y, parent: parent)
    
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

func findParent(x: Int, y: Int, parent: [Int]) -> String {
    let a = find(x: x, parent: parent)
    let b = find(x: y, parent: parent)
    return a == b ? "YES" : "NO"
}

let input: [Int] = readLine()!.components(separatedBy: " ").map{Int($0)!}
var parent: [Int] = []
var level: [Int] = Array(repeating: 1, count: input[0] + 1)
for i in 0 ... input[0] {
    parent.append(i)
}

for _ in 0 ..< input[1] {
    let line: [Int] = readLine()!.components(separatedBy: " ").map{Int($0)!}
    if line[0] == 0 {
        // 합
        union(x: line[1], y: line[2], parent: &parent, level: &level)
//        print(parent)
    } else if line[0] == 1 {
        // 출력
        print(findParent(x: line[1], y: line[2], parent: parent))
    }
}
