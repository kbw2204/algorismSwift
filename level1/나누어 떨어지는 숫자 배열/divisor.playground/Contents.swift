//
//  main.swift
//  divisor
//
//  Created by 강병우 on 28/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

    func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
        let result = arr.filter{$0%divisor == 0}.sorted()
        return result == [] ? [-1] : result
    }

let testInput = [[5,9,7,10],[2, 36, 1, 3],[3,2,6]]
let testInput2 = [5,1,10]
let testOutput = [[5,10],[1, 2, 3, 36],[-1]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

