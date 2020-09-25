//
//  main.swift
//  두개뽑아서더하기
//
//  Created by 강병우 on 2020/09/25.
//  Copyright © 2020 강병우. All rights reserved.
//

func solution(_ numbers:[Int]) -> [Int] {
    let sort = numbers.sorted()
    var result: [Int] = []
    for i in 0 ..< sort.count-1 {
        for j in i+1 ..< sort.count {
            let sum = sort[i] + sort[j]
            if !result.contains(sum) {
                result.append(sum)
            }
        }
    }
    return result.sorted()
}

print(solution([2,0,0,0]))
// [2,3,4,5,6,7]
