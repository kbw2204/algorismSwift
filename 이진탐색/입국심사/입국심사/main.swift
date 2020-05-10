//
//  main.swift
//  입국심사
//
//  Created by 강병우 on 2020/05/10.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let sortTimes = times.sorted(by: <)
    var tmpArr: Set<Int> = []
    for i in 1 ... n {
        for j in 0 ..< times.count {
            if tmpArr.contains(times[j] * i) {
                tmpArr.insert(times[j] * i)
            }
            if tmpArr.count == n {
                break
            }
        }
        if tmpArr.count == n {
            break
        }
    }
    var low = tmpArr.reduce(0, {$0 + $1})
    var max = n * sortTimes.last!
    var estimate = 0
    
    while low <= max {
        let mid: Int = (max + low) / 2
        estimate = times.map{mid / $0}.reduce(0, {$0 + $1})
        print(estimate)
        if estimate > n {
            max = mid
        } else if estimate < n {
            low = mid + 1
        } else {
            return Int64(low)
        }
    }
    
    return -1
}



let testInput = [6]
let testInput2 = [[7,10]]
let testOutput = [28]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}




