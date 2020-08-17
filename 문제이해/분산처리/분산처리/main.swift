//
//  main.swift
//  분산처리
//
//  Created by 강병우 on 2020/08/17.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

func solution(_ a: Int, b: Int) -> Int {
    if a == 1 {
        return 1
    }
    var result = 1
    for _ in 0 ..< b {
        let tmp = result*a
        result = tmp % 10
    }
    
    return result != 0 ? result : 10
}

let n = Int(readLine()!)!
for _ in 0 ..< n {
    let ipt = readLine()!.split(separator: " ").map{Int(String($0))!}
    print(solution(ipt[0], b: ipt[1]))
}


