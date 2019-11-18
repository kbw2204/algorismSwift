//
//  main.swift
//  origami
//
//  Created by 강병우 on 18/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

func solution(_ n:Int) -> [Int] {
    var left: String = ""
    var right: String = ""
    var pos: Int = 1
    
    while pos != n {
        let leftTemp = left
        left = left + "0" + right
        right = leftTemp + "1" + right
        pos += 1
    }
    
    return (left + "0" + right).map{Int(String($0))!}
}

let testInput = [1,2,3]
let testOutput = [[0],[0,0,1],[0,0,1,0,0,1,1]]

for i in 0 ..< testInput.count {
    if solution(testInput[i]) == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i])")
    }
}
