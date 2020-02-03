//
//  main.swift
//  fail
//
//  Created by 강병우 on 24/01/2020.
//  Copyright © 2020 강병우. All rights reserved.
//
/*
 실패율: 스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수 / 스테이지에 도달한 플레이어 수
 N: 전체 스테이지 개수
 stages: 사용자가 현재 멈춰있는 스테이지의 번호가 담긴 배열

 실패율이 높은 스테이지부터 내림차순으로 스테이지의 번호가 담겨있는 배열을 return 하도록 solution 함수를 완성하라.
 */

import Foundation


func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // 최종 스테이지: N+1
    let max = stages.count
//    var result: [Int:Double] = [:]
//    result[1] = Double(stages.filter{$0 == 1}.count) / Double(max)
//    for i in 2 ..< N+1 {
//        let parent = max - stages.filter{$0 < i}.count
//        result[i] = Double(stages.filter{$0 == i}.count) / Double(parent)
//    }
    var arr1: [Double] = Array<Double>(repeating: 0.0, count: N)
    arr1[0] = Double(stages.filter{$0 == 1}.count) / Double(max)
    for i in 2 ..< N {
        let parent = max - stages.filter{$0 < i }.count
//        print(parent)
//        print(Double(stages.filter{$0 == i }.count))
        arr1[i-1] = Double(stages.filter{$0 == i }.count) / Double(parent)
    }
    let arr2 = arr1
    var result = arr1.sorted(by: >)
    for i in 0 ..< result.count {
        for j in 0 ..< result.count {
            if arr2[i] == result[j] {
                
            }
        }
    }
    print(result)
//    var test = result.sorted(by: {$0.1 > $1.1})

    return []
}

let testInput = [5, 4]
let testInput2 = [[2, 1, 2, 6, 2, 4, 3, 3],[4,4,4,4,4]]
let testOutput = [[3,4,2,1,5], [4,1,2,3]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testOutput[i]) : \(output)")
    }
}

