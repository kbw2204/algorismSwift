//
//  main.swift
//  괄호사칙연산
//
//  Created by 강병우 on 2020/10/22.
//

import Foundation

func solution(_ str: String) -> Int {
    let cmd: [Character:Int] = ["+":1, "-":1, "*":2, "/": 2]
    
    let convertedStack: [String] = convert(str, cmd)
    let rst = cal(convertedStack, cmd)
    
    return rst
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
    var stack: [String] = []
    var result: [String] = []
    var tmp: [Character] = []
    
    for c in str {
        // 연산자인지 확인
        if c.isNumber {
            tmp.append(c)
        } else {
            // 피연산자는 그냥 출력
            if !tmp.isEmpty {
                result.append(String(tmp))
                tmp.removeAll()
            }
        
            // 연산자면
            if let outside = cmd[c] {
                // 비어있으면 넣어줌
                if stack.isEmpty {
                    stack.append(String(c))
                } else {
                    while let peek = stack.last, let inside = cmd[Character(peek)], inside >= outside {
                        result.append(stack.removeLast())
                    }
                    stack.append(String(c))
                }
            } else if c == "(" { stack.append(String(c))} // (확인
            else if c == ")" {
                while let peek = stack.last, peek != "(" {
                    result.append(stack.removeLast())
                }
                stack.removeLast()
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

let a = "100-(200-30)*300-500+20" // -51380
let rs = solution(a)
print(rs)

