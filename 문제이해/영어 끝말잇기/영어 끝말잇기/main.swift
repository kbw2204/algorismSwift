//
//  main.swift
//  영어 끝말잇기
//
//  Created by 강병우 on 2020/10/22.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var isSafe = false
    var pos = 2
    var cycle = 1
    var log = [words[0]]
    for i in 1 ..< words.count {
        let bf = words[i-1].last!
        let word = words[i]
        if bf != word.first! || log.contains(word) {
            isSafe = true
            break
        }
        log.append(word)
        pos += 1
        if pos > n {
            pos = 1
            cycle += 1
        }
    }
    
    return isSafe ? [pos, cycle] : [0,0]
}

let rs = solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
print(rs)
