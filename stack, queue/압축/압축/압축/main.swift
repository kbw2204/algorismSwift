//
//  main.swift
//  압축
//
//  Created by 강병우 on 2020/06/16.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class Stack {
    var stack: [String] = []
    
    func push(_ str: String) {
        stack.append(str)
    }
    
    func pop() -> String {
        return !stack.isEmpty ? stack.removeLast() : ""
    }
    
    func peek() -> Int {
        return !stack.isEmpty ? Int(stack.last!)! : 0
    }
}

let input = readLine()!
//var input = "33(562(71(9)))"
var stack: Stack = Stack()
var inside = ""


for i in 0 ..< input.count {
    let index = input.index(input.startIndex, offsetBy: i)
    let char = String(input[index])
    if char != ")" {
        stack.push(char)
    } else {
        if inside == "" {
            var tmp = ""
            var character = stack.pop()
            while character != "(" {
                tmp += character
                character = stack.pop()
            }
            tmp = String(tmp.reversed())
            let count = Int(stack.pop()) ?? 0
            
            var tmp2 = ""
            character = stack.pop()
            while character != "(" && character != "" {
                tmp2 += character
                character = stack.pop()
            }
            inside += String(tmp2.reversed())
            for _ in 0 ..< count {
                inside += tmp
            }
            if count == 0 {
                inside = ""
            }
        } else {
            let count = Int(stack.pop()) ?? 0
            var tmp = ""
            var character = stack.pop()
            while character != "(" && character != ""{
                tmp += character
                character = stack.pop()
            }
            if count > 0 {
                for _ in 0 ..< count - 1 {
                    inside += inside
                }
            }
            inside = String(tmp.reversed()) + inside
            if count == 0 {
                inside = ""
            }
        }
    }
}
