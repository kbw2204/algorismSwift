//
//  main.swift
//  kakaoCodingTest2
//
//  Created by 강병우 on 07/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

// 참고 : https://github.com/SwiftAlgorithmClub
import Foundation

var stack: [String] = []
var zeroToGo: Int = 0


func solution(_ p:String) -> String {
    if p.isEmpty {
        return ""
    }
    var result: String = ""
    let divide: String.Index = p.index(p.startIndex, offsetBy: dividePos(str: p))
    let w: String = String(p[..<divide])
    let v: String = String(p[divide...])
    if checkComplete(str: w) {
        return w + solution(v)
    } else {
        // w를 뒤집어 주고 result에 넣어줘야함
        result += "("
        result += solution(v)
        result += ")"
        result += reverseString(str: w)
        return result
    }
}


func reverseString(str: String) -> String {
    var result: String = ""
    let start = str.index(after: str.startIndex)
    let end = str.index(before: str.endIndex)
    for c in str[start..<end] {
        if c == "(" {
            result += ")"
        } else {
            result += "("
        }
    }
    return result
}

func checkComplete(str: String) -> Bool {
    var stack: [Character] = []
    for c in str {
        if c == "(" {
            stack.append(contentsOf: "(")
        } else {
            if stack.isEmpty {
                return false
            }
            _ = stack.popLast()
        }
    }
    if stack.isEmpty {
        return true
    } else {
        return false
    }
}

func dividePos(str: String) -> Int {
    var open: Int = 0
    var close: Int = 0
    var pos: Int = 0
    for c in str {
        if c == "(" {
            open += 1
        } else {
            close += 1
        }
        pos += 1
        if open == close {
            break
        }
    }
    return pos
}
print(solution(")()()()("))

