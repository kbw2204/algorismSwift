//
//  main.swift
//  n진수 게임
//
//  Created by 강병우 on 2020/11/03.
//

//import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var rst = ""
    var log = ""
    var num = 0
    var pos = p-1
    
    while rst.count != t {
        // 부족하면 추가
        while log.count <= pos {
            log += String(num, radix: n)
            num += 1
        }
        let idx = log.index(log.startIndex, offsetBy: pos)
        rst.append(log[idx].uppercased())
        pos = pos+m-log.count
        log.removeSubrange(...idx)
        pos += log.count
    }
    
    return rst
}

let rst = solution(2, 4, 2, 1)
print(rst)
