//
//  main.swift
//  DigitsPlus
//
//  Created by 강병우 on 09/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int{
    return String(n).map{Int(String($0))!}.reduce(0,{$0 + $1})
}

let testInput = [123,987]
let testOutput = [6,24]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

// map 안쓰고 reduce만 써도 됬었구나..
//func solution(_ n:Int) -> Int
//{
//    return String(n).reduce(0, {$0+Int(String($1))!});
//}
