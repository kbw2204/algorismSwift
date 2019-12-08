//
//  main.swift
//  수박
//
//  Created by 강병우 on 08/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> String {
    var result: String = ""
    for i in 0 ..< n {
        if i % 2 == 1 {
            result += "박"
        } else {
            result += "수"
        }
    }
    return result
}

let testInput = [3, 4]
let testOutput = ["수박수", "수박수박"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

//func solution(_ n:Int) -> String {
//    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
//}

//struct SB: Sequence, IteratorProtocol {
//    var c = 0
//    mutating func next() -> String? {
//        c = (c + 1) % 2
//        return c == 1 ? "수" : "박"
//    }
//}
//
//func solution(_ n:Int) -> String {
//    return SB().lazy.prefix(n).joined(separator:"")
//}
