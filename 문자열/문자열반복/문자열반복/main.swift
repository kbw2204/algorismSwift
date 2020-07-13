//
//  main.swift
//  문자열반복
//
//  Created by 강병우 on 2020/07/13.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation
let n = Int(readLine()!)!

for _ in 0 ..< n {
    let ipt = readLine()!.split(separator: " ").map{String($0)}
    let num = Int(ipt[0])!
    let double = num/2
    let str = ipt.last!.map{String($0)}
    let doubleStr = ipt.last!.map{String($0)+String($0)}
    let remain = num%2
    var result: String = ""
    for i in 0 ..< str.count {
        for _ in 0 ..< double {
            result += doubleStr[i]
        }
        for _ in 0 ..< remain {
            result += str[i]
        }
    }
    print(result)
}


