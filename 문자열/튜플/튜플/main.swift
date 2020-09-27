//
//  main.swift
//  튜플
//
//  Created by 강병우 on 2020/09/27.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    let tmp1 = s[s.index(s.startIndex, offsetBy: 1)...s.index(s.endIndex, offsetBy: -2)]
    var 바구니: [Int] = []
    var tmpValue: [Character] = []
    var key = false
    var dt: [[Int]] = []
    tmp1.forEach {
        if $0 == "{" {
            key = true
        } else if $0 != "}" && key {
            if $0 == "," {
                바구니.append(Int(String(tmpValue))!)
                tmpValue.removeAll()
            } else {
                tmpValue.append($0)
            }
            
        } else if $0 == "}" {
            key = false
            if 바구니.isEmpty {
                dt.append([Int(String(tmpValue))!])
                tmpValue.removeAll()
            } else {
                if !tmpValue.isEmpty {
                    바구니.append(Int(String(tmpValue))!)
                    tmpValue.removeAll()
                }
                dt.append(바구니)
                바구니.removeAll()
            }
        }
    }
    
    dt.sort {$0.count < $1.count}

    result.append(dt[0][0])
    for i in 1 ..< dt.count {
        let st1 = Set(dt[i])
        let st2 = Set(dt[i-1])
        let val = st1.subtracting(st2)
        result.append(val.first!)
    }
    
    return result
}

let dt = "{{2,1,3,4},{2},{2,1},{2,1,3}}"
let rs = solution(dt)
print(rs)
if rs == [2, 1, 3, 4] {
    print("성공")
} else { print("땡")}
