//
//  main.swift
//  타겟넘버
//
//  Created by 강병우 on 2020/09/26.
//  Copyright © 2020 강병우. All rights reserved.
//

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    dfs(numbers, target, 0, 0, &count)
    return count
}

func dfs(_ nb: [Int], _ tg: Int, _ sum: Int, _ depth: Int, _ count: inout Int) {
    if depth == nb.count {
        if sum == tg {
            count += 1
        }
        return
    }
    
    dfs(nb, tg, sum+nb[depth], depth+1, &count)
    dfs(nb, tg, sum-nb[depth], depth+1, &count)
}
