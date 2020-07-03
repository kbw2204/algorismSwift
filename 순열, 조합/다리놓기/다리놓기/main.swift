//
//  main.swift
//  다리놓기
//
//  Created by 강병우 on 2020/07/02.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func factorial(_ n: Int, _ target: Int,_ max: Int) -> Int {
    if n == 0 { return target }
    var result = 1
    var count = 1
    for i in 1 ... n {
        result *= i
        if count <= max {
            result /= count
            count += 1
        }
    }
    return result
}

let count = Int(readLine()!)!
for _ in 0 ..< count {
    let ipt = readLine()!.split(separator: " ").map{Int($0)!}
    let n = ipt.last!
    let r = ipt.first!
    let max = [n-r, r].max()!
    let min = [n-r, r].min()!
    let child = factorial(n,n, max)
    let parent = factorial(min,n,1)
    let result = Int(round(Double(child) / Double(parent)))
    if result != 0 { print(result) }
    else {print(1)}
}

