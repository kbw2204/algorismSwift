//
//  main.swift
//  신입사원
//
//  Created by 강병우 on 2020/11/03.
//

//import Foundation

for _ in 0 ..< Int(readLine()!)! {
    var 합격자수 = 1
    var list: [[String]] = []
    let n = Int(readLine()!)!
    for _ in 0 ..< n { list.append(readLine()!.split(separator: " ").map{String($0)}) }
    list.sort(by: {$0[0]<$1[0]})
    var min = list[0][1]
    for i in 1 ..< n {
        if min > list[i][1] {
            합격자수 += 1
            min = list[i][1]
        }
    }
    print(합격자수)
}
