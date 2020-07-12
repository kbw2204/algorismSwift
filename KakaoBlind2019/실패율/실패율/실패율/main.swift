//
//  main.swift
//  실패율
//
//  Created by 강병우 on 2020/05/24.
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
    var varStages = stages
    var dicArr: [Int:Double] = [:]
    var result: [Int] = []

    for stage in 1 ... N {
        var fail = 0
        var success = 0
        var resetList: [Int] = []
        for i in 0 ..< varStages.count {
            let pos = varStages[i]
            if  pos != stage {
                resetList.append(pos)
            } else {
                fail += 1
            }
            if pos >= stage {
            success += 1
            }
        }
        varStages = resetList
        if success != 0 {
            dicArr[stage] = Double(fail) / Double(success)
        } else { dicArr[stage] = 0.0}
    }
    while !dicArr.isEmpty {
        let max = dicArr.values.max()!
        let list = dicArr.filter{$0.value == max}.keys.map{Int(String($0))!}
        if list.count == 1 {
            result.append(list[0])
            dicArr.removeValue(forKey: list[0])
        } else {
            let sort = list.sorted()
            result += sort
            for i in sort {
                dicArr.removeValue(forKey: i)
            }
        }
    }
    return result
}

let testInput = [5,4]
let testInput2 = [[2, 1, 2, 6, 2, 4, 3, 3], [4,4,4,4,4]]
let testOutput = [[3,4,2,1,5], [4,1,2,3]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(output) : \(testOutput[i])")
    }
}


// 더 좋은 풀이...
//func solution(_ N:Int, _ stages:[Int]) -> [Int] {
//    var stageNonClears = [0]
//    var failRate: [Int: Double] = [:]
//    (1...N+1).forEach { i in
//        stageNonClears.append(stages.lazy.filter{$0==i}.count)
//    }
//
//    for stageNum in 1...N {
//        let n = stageNonClears[stageNum..<stageNonClears.endIndex].reduce(0, +)
//        if n == 0 {
//            failRate[stageNum] = -1
//        } else {
//            failRate[stageNum] = Double(stageNonClears[stageNum])/Double(stageNonClears[stageNum..<stageNonClears.endIndex].reduce(0, +))
//        }
////        print(stageNum, ":", stageNonClears[stageNum],"/",stageNonClears[stageNum..<stageNonClears.endIndex].reduce(0, +))
//    }
////    print(failRate.values)
//    return failRate.keys.lazy.sorted { (a, b) -> Bool in
//        if failRate[a]! > failRate[b]! {
//            return true
//        } else if failRate[a]! == failRate[b]! {
//            return a < b
//        } else {
//            return false
//        }
//    }
//}
