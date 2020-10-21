//
//  main.swift
//  후위연산
//
//  Created by 강병우 on 2020/10/20.
//

import Foundation

func solution(_ str: String) -> Int {
    let cmds: [[Character:Int]] = [
        ["+":1, "-":2, "*":3],
        ["+":1, "-":3, "*":2],
        ["+":2, "-":1, "*":3],
        ["+":2, "-":3, "*":1],
        ["+":3, "-":2, "*":1],
        ["+":3, "-":1, "*":2]
    ]
    var max = 0
    for cmd in cmds {
        let convertedStack: [String] = convert(str, cmd)
        max = [max, abs(cal(convertedStack, cmd))].max()!
    }
    
    return max
}

func cal(_ convertedStack: [String], _ cmd: [Character: Int]) -> Int {
    var stack: [Int] = []
    for b in convertedStack {
        if let num = Int(b) {
            stack.append(num)
        } else {
            // 연산
            if let v2 = stack.popLast(), let v1 = stack.popLast() {
                var tmp = 0
                switch b {
                case "+":
                    tmp = v1 + v2
                case "-":
                    tmp = v1 - v2
                case "*":
                    tmp = v1 * v2
                default:
                    print("err")
                }
                stack.append(tmp)
            }
        }
    }
    return stack[0]
}

func convert(_ str: String, _ cmd: [Character: Int]) -> [String] {
    var stack: [Character] = []
    var result: [String] = []
    var tmp: [Character] = []
    
    for c in str {
        // 연산자인지 확인
        if c.isNumber {
            tmp.append(c)
        } else {
            result.append(String(tmp))
            tmp.removeAll()
            // 연산자 우선순위 확인
            if stack.isEmpty {
                stack.append(c) // 비어있을때만 넣어줌
            }
            else {
                let ipt = cmd[Character(extendedGraphemeClusterLiteral: c)]!
                while let last = stack.last, let inside = cmd[last], inside >= ipt {
                    result.append(String(stack.removeLast()))
                }
                stack.append(c)
            }
        }
    }
    if !tmp.isEmpty {
        result.append(String(tmp))
        tmp.removeAll()
    }
    
    result += stack.reversed().map{String($0)}
    return result
}

let a = "100-200*300-500+20"
let rs = solution(a)
print(rs)
