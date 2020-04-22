//
//  main.swift
//  기능개발
//
//  Created by 강병우 on 2020/04/22.
//  Copyright © 2020 강병우. All rights reserved.
//
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let lastProgress = 100 - progresses[0]
    let count = progresses.count
    var max = Int(ceil(Double(lastProgress / speeds[0])))
    var lastArr: [Int] = [max]
    var result: [Int] = [1]
    
    for i in 1 ..< count {
        let lastProgress = 100 - progresses[i]
        let day = Int(ceil(Double(lastProgress / speeds[i])))
        lastArr.append(day)
    }
    
    for i in 1 ..< count {
        let day = lastArr[i]
        if max < day {
            max = day
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
