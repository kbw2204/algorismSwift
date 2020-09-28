//
//  main.swift
//  올바른 괄호
//
//  Created by 강병우 on 2020/09/28.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = true
    var stack: [Bool] = []
    
    s.forEach {
        if $0 == "(" {
            stack.append(true)
        } else if $0 == ")" {
            if !stack.isEmpty {
                if !stack.removeLast() {
                    ans = false
                    return
                }
            } else {
                ans = false
                return
            }
        }
    }
    if !stack.isEmpty { return false}

    return ans
}

let s1 = "(())()"
let s2 = "(()("
let rs = solution(s1)

if rs {
    print("성공")
} else { print("실패: \(rs)")}
