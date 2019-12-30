//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    let arr: [Int] = [n, m].sorted(by: >)
    return [gcd(arr), lcm(arr)]
}

func gcd(_ arr: [Int]) -> Int {
    var other = arr[0]
    var max = arr[1]
    var temp = 0
    while other != 0 {
        temp = other
        other = max % other
        max = temp
    }
    return max
}

func lcm(_ arr: [Int]) -> Int {
    return arr[0]*arr[1]/gcd(arr)
}

let testInput = [3,2]
let testInput2 = [12,5]
let testOutput = [[3, 12],[1, 10]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

// 와우;; 꼭 메소드 안만들어도 재귀가 되는구나

//func gcd(_ a: Int, _ b: Int) -> Int {
//    let mod: Int = a % b
//    return 0 == mod ? min(a, b) : gcd(b, mod)
//}
//
//func lcm(_ a: Int, _ b: Int) -> Int {
//    return a * b / gcd(a, b)
//}
//
//func solution(_ n:Int, _ m:Int) -> [Int] {
//    return [gcd(n, m), lcm(n, m)]
//}

