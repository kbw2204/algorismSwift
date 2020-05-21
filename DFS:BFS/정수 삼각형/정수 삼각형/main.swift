//
//  main.swift
//  정수 삼각형
//
//  Created by 강병우 on 2020/05/21.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class BinaryNode {
    var value: Int
    var leftNode: BinaryNode?
    var rightNode: BinaryNode?
    
    init(value: Int, leftNode: BinaryNode? = nil, rightNode: BinaryNode? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

func dfs(tree: [BinaryNode], pos: BinaryNode, sum: Int, max: inout Int, list: [Int]) {
    if pos.leftNode == nil && pos.rightNode == nil {
        if max < sum {
            max = sum
            print(list)
        }
        return
    }
    if let leftPos = pos.leftNode {
        var vList = list
        vList.append(leftPos.value)
        dfs(tree: tree, pos: leftPos, sum: sum + leftPos.value, max: &max, list: vList)
    }
    
    if let rightPos = pos.rightNode {
        var vList = list
        vList.append(rightPos.value)
        dfs(tree: tree, pos: rightPos, sum: sum + rightPos.value, max: &max, list: vList)
    }
}

let count = Int(readLine()!)!
var parentTree: [BinaryNode] = readLine()!.components(separatedBy: " ").map{BinaryNode(value: Int($0)!)}
var tree: [BinaryNode] = []
var max = 0
for _ in 0 ..< count - 1 {
    let childTree = readLine()!.components(separatedBy: " ").map{BinaryNode(value: Int($0)!)}
    for n in 0 ..< parentTree.count {
        parentTree[n].leftNode = childTree[n]
        parentTree[n].rightNode = childTree[n+1]
    }
    tree += parentTree
    parentTree = childTree
}

dfs(tree: tree, pos: tree[0], sum: tree[0].value, max: &max, list: [7])
print(max)
