//
//  main.swift
//  searchingKim
//
//  Created by 강병우 on 18/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

//func solution(_ seoul:[String]) -> String {
//    var result: String = "김서방은 "
//    for i in 0 ..< seoul.count {
//        if seoul[i] == "Kim" {
//            result += "\(i)에 있다"
//        }
//    }
//    return result
//}

func solution(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

let testInput = [["Jane", "Kim"]]
let testOutput = ["김서방은 1에 있다"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

    
