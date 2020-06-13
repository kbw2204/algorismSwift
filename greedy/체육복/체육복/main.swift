//
//  main.swift
//  체육복
//
//  Created by 강병우 on 2020/06/13.
//  Copyright © 2020 강병우. All rights reserved.
//
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var studentStatus: [Int] = Array(repeating: 1, count: n)
    // 잃어버림
    for index in lost {
        studentStatus[index-1] -= 1
    }

    // 여분 있음
    for index in reserve {
        studentStatus[index-1] += 1
    }
    
    for i in 0 ..< n {
        if studentStatus[i] == 2 {
            if i != 0 && studentStatus[i-1] == 0 {
                studentStatus[i-1] += 1
                studentStatus[i] -= 1
            } else if i != n-1 && studentStatus[i+1] == 0 {
                studentStatus[i+1] += 1
                studentStatus[i] -= 1
            }
        }
    }
    
    return studentStatus.filter{$0 >= 1}.count
}

let n = [5,5,3]
let lost = [[2, 4], [2, 4], [3]]
let reserve = [[1, 3, 5], [3], [1]]

let testOutput = [5,4,2]

for i in 0 ..< n.count {
    let output = solution(n[i], lost[i], reserve[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: 정답 -> \(testOutput[i]) : \(output)")
    }
}


