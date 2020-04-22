//
//  main.swift
//  다리를 지나는 트럭
//
//  Created by 강병우 on 2020/04/22.
//  Copyright © 2020 강병우. All rights reserved.
// 문제 이해안됨 =_= 문제가 잘못된 것 같음

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var result = 0
    var sum = 0
    var count = 0
    var queue = truck_weights
    while !queue.isEmpty {
        while weight > sum {
            guard let temp = queue.first else {
                result += count*(bridge_length-1)
                break
            }
            if sum + temp <= weight {
                sum += queue.removeFirst()
                result += 1
                count += 1
            } else {
                result += count*(bridge_length-1)
                count = 0
                sum = 0
                break
            }
        }
    }
    
    return result
}

let testInput = [2,100,100]
let testInput2 = [10,100,100]
let testInput3 = [[7,4,5,6],[10],[10,10,10,10,10,10,10,10,10,10]]
let testOutput = [8,101,110]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i],testInput3[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testOutput[i]) : \(output)")
    }
}

