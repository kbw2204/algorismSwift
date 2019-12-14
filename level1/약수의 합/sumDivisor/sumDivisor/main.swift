//
//  main.swift
//  sumDivisor
//
//  Created by 강병우 on 14/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

/*
 절만만큼 포문을 돌리고, 나눠지는 값과 몫을 넣어주면 됨
 */

import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    var setList: Set = Set<Int>()
    for num in 1 ... Int(sqrt(Double(n))) {
        if n % num == 0 {
            setList.insert(num)
            setList.insert(n/num)
        }
    }
    return setList.reduce(0, {$0 + $1})
}

let testInput = [12,5]
let testOutput = [28,6]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

