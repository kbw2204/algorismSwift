//
//  main.swift
//  theSong
//
//  Created by 강병우 on 2020/02/05.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    return ""
}

let testInput = ["ABCDEFG"]
let testInput2 = [["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]]
let testOutput = ["HELLO"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}
