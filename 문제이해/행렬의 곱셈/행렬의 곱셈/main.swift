//
//  main.swift
//  행렬의 곱셈
//
//  Created by 강병우 on 2020/09/29.
//

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    let arr1Row = arr1.count
    let arr1Col = arr1[0].count
    let arr2Col = arr2[0].count
    
    for i in 0 ..< arr1Row {
        var line: [Int] = []
        for j in 0 ..< arr2Col {
            var sum = 0
            for k in 0 ..< arr1Col {
                sum += arr1[i][k] * arr2[k][j]
            }
            line.append(sum)
        }
        result.append(line)
    }
    
    return result
}

let a = [[2, 3, 2], [4, 2, 4], [3, 1, 4]]
let b = [[5, 4, 3], [2, 4, 1], [3, 1, 1]]
let rs = solution(a, b)
rs == [[22, 22, 11], [36, 28, 18], [29, 20, 14]] ? print("성공") : print("땡")

// 더 좋은 풀이
//func solution(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
//
//    var returnArr = [[Int]](repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count)
//
//    for i in 0..<arr1.count {
//        for j in 0..<arr2[0].count {
//            for k in 0..<arr1[i].count {
//                returnArr[i][j] = returnArr[i][j] + arr1[i][k] * arr2[k][j]
//            }
//        }
//    }
//
//
//    return returnArr
//}
