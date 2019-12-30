//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ phone_number:String) -> String {
    if phone_number.count == 4 {
        return phone_number
    }
    var n = phone_number.count - 5
    var star: String = ""
    for _ in 0 ... n {
        star += "*"
    }
    return phone_number.replacingCharacters(in: phone_number.index(phone_number.startIndex, offsetBy: 0) ... phone_number.index(phone_number.startIndex, offsetBy: n), with: star)
//    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}

let testInput = ["01033334444", "4324"]
let testOutput = ["*******4444", "4324"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

