//
//  main.swift
//  kakaoCodingTest1
//
//  Created by 강병우 on 06/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Int {
    var size = s.count / 2
    if size == 0 {
        size = 1
    }
    var max: Int = s.count
    var arr: [String] = []
    
    for i in 1 ... size {
        arr = split(s, i)
        var count = arr.count
        var pos: Int = 0
        var combo: Int = 1
        while pos + 1 != count {
            if arr[pos] == arr[pos+1] {
                combo += 1
                arr.remove(at: pos)
            } else {
                if combo != 1 {
                    arr.insert(String(combo), at: pos)
                    pos += 2
                    combo = 1
                } else {
                    pos += 1
                }
            }
            count = arr.count
        }
        if combo != 1 {
            arr.insert(String(combo), at: pos)
        }
        let result: Int = arr.joined(separator: "").count
        if max > result {
            max = result
        }
    }
    return max
}

func split(_ string: String, _ times: Int) -> [String] {
    var str = string
    var addValue: Int = 0
    for i in 1 ... str.count / times {
        let range = str.index(str.startIndex, offsetBy: i * times + addValue)
        str.insert(",", at: range)
        addValue += 1
    }
    return str.split(separator: ",").map{String($0)}
}


print(solution("aabbaccc"))
