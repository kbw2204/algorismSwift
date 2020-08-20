//
//  main.swift
//  세로읽기
//
//  Created by 강병우 on 2020/08/20.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

var iptArr: [[String]] = []
var iptCount: [Int] = []
var max = 0
for _ in 0 ..< 5 {
    let line = readLine()!.map{String($0)}
    iptArr.append(line)
    iptCount.append(line.count-1)
    max = [line.count, max].max()!
}

for i in 0 ..< max {
    for j in 0 ..< 5 {
        let lineLength = iptCount[j]
        if i <= lineLength {
            print(iptArr[j][i], terminator: "")
        }
    }
}
