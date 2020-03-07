//
//  main.swift
//  decompositionSum
//
//  Created by 강병우 on 2020/03/06.
//  Copyright © 2020 강병우. All rights reserved.
//
/*
 N + a+b+c = 분해합 M
 M의 생성자 중 하나가 N(N+a+b+c)
 이런 N값의 최소값을 구하라
 */

import Foundation

guard let input = readLine(), let N = Int(input) else {
    fatalError()
}
var result = 0
for i in 1 ... N {
    var temp = i
    var M = i
    while true {
        M += temp % 10
        temp = temp / 10
        if temp == 0 {
            break
        }
    }
    if M == N || i == N {
        result = i
        break
    }
}
print(result)
