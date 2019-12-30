//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ x:Int) -> Bool {
    // map까지 갈 필요가 없구나 String이 컬렉션프로토콜 만족하니깐
    let divide: Int = "\(x)".map{String($0)}.reduce(0, {$0+Int($1)!})
    return x % divide == 0 ? true : false
//    return x % String(x).reduce(0, {$0+Int(String($1))!}) == 0
}

let testInput = [10]
let testOutput = [true]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

