//
//  main.swift
//  종이의 개수
//
//  Created by 강병우 on 2020/10/03.
//  Copyright © 2020 강병우. All rights reserved.
//


let n = Int(readLine()!)!
var ipt: [[Int]] = []
var result: [Int] = [0,0,0]
for _ in 0 ..< n {
    ipt.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

dfs(ipt, result: &result)

result.forEach {
    print($0)
}

func isSame(_ ipt: [[Int]]) -> Bool {
    let fst = ipt[0][0]
    for i in 0 ..< ipt.count {
        for j in 0 ..< ipt[0].count {
            if ipt[i][j] != fst {
                return false
            }
        }
    }
    return true
}

func runSize_3(_ ipt: [[Int]], result: inout [Int]) {
    for line in ipt {
        for block in line {
            result[block+1] += 1
        }
    }
}

func dfs(_ ipt: [[Int]], result: inout [Int]) {
    // 모두 같거나 크기가 1인 경우는 어차피 아래에서 걸림
    let fst = ipt[0][0]
    
    if isSame(ipt) {
        result[fst+1] += 1
        return
    }
    
    if ipt[0].count == 3 {
        runSize_3(ipt, result: &result)
        return
    }
    
    // 나눠야함
    let row = ipt.count
    let col = ipt[0].count
    for r in 0 ..< 3 {
        for c in 0 ..< 3 {
            var arr: [[Int]] = []
            let sttIdx_r = ipt.index(ipt.startIndex, offsetBy: r*(row/3))
            let endIdx_r = ipt.index(ipt.startIndex, offsetBy: (r+1)*(row/3))
            
            for lineIdx in c*(col/3) ..< (c+1)*(col/3) {
                arr.append(ipt[lineIdx][sttIdx_r ..< endIdx_r].map{$0})
            }
            dfs(arr, result: &result)
        }
    }
}
