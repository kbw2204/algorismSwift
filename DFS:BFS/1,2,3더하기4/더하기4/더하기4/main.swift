//
//  main.swift
//  더하기4
//
//  Created by 강병우 on 2020/05/19.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func dfs(result: inout Set<[Int]>, sum: Int, target: Int, list: [Int]) {
    if sum == target {
        result.insert(list)
        return
    }
    
    for i in 1 ... 3 {
        if sum + i > target {
            break
        }
        var vList = list
        vList[i-1] += 1
        dfs(result: &result, sum: sum + i, target: target, list: vList)
    }
}
let count: Int = Int(readLine()!)!
for _ in 0 ..< count {
    let input: Int = Int(readLine()!)!
    var result: Set<[Int]> = []
    dfs(result: &result, sum: 0, target: input, list: [0,0,0])
    print(result.count)
}


