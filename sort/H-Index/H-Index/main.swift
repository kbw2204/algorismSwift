//
//  main.swift
//  H-Index
//
//  Created by 강병우 on 2020/09/26.
//  Copyright © 2020 강병우. All rights reserved.
//

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    var result = 0
    
    for i in (0 ... sorted.max()!).reversed() {
        let s = sorted.filter({$0>=i})
        let f = sorted.filter({$0<i})
        if s.count >= i && f.count <= i {
            result = i
            break
        }
    }
    
    return result
}

let t = [12, 11, 10, 9, 8, 1]
print(solution(t))

// 더 좋은 풀이
//func solution(_ citations:[Int]) -> Int {
//    for (index, cit) in citations.sorted(by: >).enumerated() {
//        if index >= cit {
//            return index
//        }
//    }
//    return citations.count
//}
