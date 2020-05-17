//
//  main.swift
//  위장
//
//  Created by 강병우 on 2020/05/10.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String: Int] = [:]
    
    clothes.forEach { cloth in
        if dic[cloth[1]] == nil {
            dic[cloth[1]] = 2 // 안입을경우까지
        } else {
            dic[cloth[1]]! += 1
        }
    }
    return dic.reduce(1, {$0*$1.value}) - 1 // 둘다 안입을 경우가 있을 수 있음으로 1을 빼줘야함
}

let testInput = [[["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]]
let testOutput = [5]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}




