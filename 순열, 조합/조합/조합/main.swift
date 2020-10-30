//
//  main.swift
//  조합
//
//  Created by 강병우 on 2020/10/30.
//

import Foundation

// 단순 갯수만 구하고 싶을 경우, nCr = n-1Cr-1 + n-1Cr 공식
//func combination(n: Int, r: Int) -> Int {
//    if n == r || r == 0 { return 1 }
//    else { return combination(n: n-1, r: r-1) + combination(n: n-1, r: r)}
//}


// 실제로 구하기.
func combination(_ arr: [Int], _ idx: Int, _ n: Int, _ r: Int, _ depth: Int, _ idxList: inout [[Int]]){
    if r == 0 {
        var tmp: [Int] = []
        for i in 0 ..< idx {
            tmp.append(arr[i])
        }
        idxList.append(tmp)
    }
    else if depth == n { return }
    else {
        var arr = arr
        arr[idx] = depth
        combination(arr, idx+1, n, r-1, depth+1, &idxList)
        combination(arr, idx, n, r, depth+1, &idxList)
    }
}

let data = [1,2,3,4]
let arr = Array(repeating: 0, count: data.count)
var idxList: [[Int]] = []
combination(arr, 0, 4, 2, 0, &idxList)

idxList.forEach {
    $0.forEach {
        print(data[$0], terminator: "")
    }
    print()
}
