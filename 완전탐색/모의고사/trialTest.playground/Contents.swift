//
//  main.swift
//  trialTest
//
//  Created by 강병우 on 29/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var result: [Int] = []
    let user1: [Int] = [1,2,3,4,5]
    let user2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5] // 7
    let user3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // 10
    var score: [Int] = [0,0,0]
    
    for i in 0 ..< answers.count {
        if user1[i%user1.count] == answers[i] {
            score[0] += 1
        }
        if user2[i%user2.count] == answers[i] {
            score[1] += 1
        }
        if user3[i%user3.count] == answers[i] {
            score[2] += 1
        }
    }
    let maxValue = score.max()
    for i in 0 ..< 3 {
        if maxValue == score[i] {
            result.append(i+1)
        }
    }
    return result
}


let testInput = [[1,2,3,4,5], [1,3,2,4,2]]
let testOutput = [[1],[1,2,3]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

