//
//  main.swift
//  2016
//
//  Created by 강병우 on 28/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let monthData = [31,29,31,30,31,30,31,31,30,31,30]
    let dayData = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    var totalDay = 0
    
    for i in 1 ..< a {
        totalDay += monthData[i-1]
    }
    totalDay += b + 4
    return dayData[totalDay % 7]
}

let testInput = [5, 3, 3, 1]
let testInput2 = [24, 14, 22,3]
let testOutput = ["TUE", "MON", "TUE", "SUN"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

