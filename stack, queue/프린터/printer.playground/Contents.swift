//
//  main.swift
//  printer
//
//  Created by 강병우 on 17/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var result: Int = 0
    var priArray = priorities
    var maxArray = priArray.sorted(by: >)
    var indexArray: [Int] = Array(0...priorities.count-1)
    while !priArray.isEmpty {
        let pos = priArray[0]
        guard let max = maxArray.first else {
            return 0
        }
        if max > pos {
            priArray.append(priArray.removeFirst())
            indexArray.append(indexArray.removeFirst())
        } else {
            result += 1
            maxArray.removeFirst()
            priArray.removeFirst()
            if indexArray.removeFirst() == location {
                break
            }
        }
    }
    return result
}

let testInput = [[2, 1, 3, 2], [1, 1, 9, 1, 1, 1]]
let input2 = [2,0]
let testOutput = [1,5]

for i in 0 ..< testInput.count {
    if solution(testInput[i], input2[i]) == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i])")
    }
}
