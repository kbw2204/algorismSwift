//
//  main.swift
//  PandY
//
//  Created by 강병우 on 11/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Bool
{
    if s.count > 50 {
        return false
    }
    var state: Int = 0
    for char in s {
        switch char {
        case "p", "P":
            state += 1
        case "y", "Y":
            state -= 1
        default: break
        }
    }
    return state == 0 ? true : false
}


let testInput = ["pPoooyY", "Pyy"]
let testOutput = [true, false]

for i in 1 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

// lowercased()가 있었군..
//import Foundation
//
//func solution(_ s:String) -> Bool
//{
//    let string = s.lowercased()
//    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
//}
