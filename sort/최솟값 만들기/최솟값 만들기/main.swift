//
//  main.swift
//  최솟값 만들기
//
//  Created by 강병우 on 2020/09/29.
//

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let a = A.sorted(by: <)
    let b = B.sorted(by: >)
    var sum = 0
    
    for i in 0 ..< a.count {
        sum += a[i]*b[i]
    }
    
    return sum
}

let a = [1, 4, 2]
let b = [5, 4, 4]
let rs = solution(a, b)

print(rs)
