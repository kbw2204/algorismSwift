//
//  main.swift
//  1차 뉴스 클러스터링
//
//  Created by 강병우 on 2020/10/23.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var v1: [String] = []
    var v2: [String] = []
    
    for i in 0 ..< str1.count-1 {
        let sttIdx = str1.index(str1.startIndex, offsetBy: i)
        let endIdx = str1.index(str1.startIndex, offsetBy: i+1)
        if str1[sttIdx].isLetter && str1[endIdx].isLetter {
            v1.append(String(str1[sttIdx...endIdx]).lowercased())
        }
    }
    
    for i in 0 ..< str2.count-1 {
        let sttIdx = str2.index(str2.startIndex, offsetBy: i)
        let endIdx = str2.index(str2.startIndex, offsetBy: i+1)
        if str2[sttIdx].isLetter && str2[endIdx].isLetter {
            v2.append(String(str2[sttIdx...endIdx]).lowercased())
        }
    }
    
    if v1.isEmpty && v2.isEmpty { return 65536 }
    
    let a = intersect(v1, other: v2)
    let b = sumArrayCount(v1, other: v2)
    
    let rst = Int(floor((Double(a) / Double(b)) * 65536))
    
    return rst
}

func sumArrayCount(_ base: [String], other: [String]) -> Int {
    let sameArray = intersect(base, other: other)
    
    return base.count + other.count - sameArray
}

func intersect(_ base: [String], other: [String]) -> Int {
    var result = 0
    var dic: [String:Int] = [:]
    other.forEach {
        if dic[$0] != nil {
            dic[$0]! += 1
        } else { dic[$0] = 1}
    }
    base.forEach {
        if let v = dic[$0], v >= 1 {
            result += 1
            dic[$0]! -= 1
        }
    }
    
    return result
}

let rs = solution("abddd", "ddefghh")
print(rs)
