//
//  main.swift
//  기능개발
//
//  Created by 강병우 on 2020/04/22.
//  Copyright © 2020 강병우. All rights reserved.
//
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = [1]
    let date: [Int] = zip(progresses, speeds).map{Int(ceil(Double(100-$0)/Double($1)))}
    var max = 0
    
    max = date.first!
    
    for j in 1 ..< date.count {
        if max < date[j] {
            max = date[j]
            result.append(1)
        } else {
            result[result.count-1] += 1
        }
    }
    
    return result
}

let testInput = [[93,30,55]]
let testInput2 = [[1,30,5]]
let testOutput = [[2,1]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}


// 참고풀이
//func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
//    return zip(progresses, speeds)
//        .map { (100 - $0) / $1 }
//        .reduce(([], 0)) { (tuple, day) -> ([Int], Int) in
//            let (list, lastMax) = tuple
//            guard let lastCount = list.last else {
//                return ([1], day)
//            }
//            if lastMax >= day {
//                return (list.dropLast() + [lastCount + 1], lastMax)
//            }
//            return (list + [1], day)
//        }.0
//}
