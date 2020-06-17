//
//  main.swift
//  압축1
//
//  Created by 강병우 on 2020/06/17.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class Stack {
    var stack: [String] = []
    func peek() -> String {
        return !stack.isEmpty ? stack.last! : ""
    }
    func pop() -> String {
        return !stack.isEmpty ? stack.removeLast() : ""
    }
    
    func push(str: String) {
        stack.append(str)
    }
    func insert(str: String) {
        stack[stack.count-1] = stack.last! + str
    }
}

let input = readLine()!
var inputArray = Array(input.components(separatedBy: ["(", ")"]).filter{$0 != ""}.reversed())
var stack = Stack()

for i in 0 ..< input.count {
    let index = input.index(input.startIndex, offsetBy: i)
    let char = input[index]
    if char == Character("(") {
        stack.push(str: inputArray.removeLast())
        stack.push(str: "(")
    } else if char == Character(")") {
        if !inputArray.isEmpty {
            stack.push(str: inputArray.removeLast())
        }
        var peek = stack.peek()
        var tmp = ""
        var count = 0
        while peek != "(" {
            tmp += stack.pop()
            peek = stack.peek()
        }
        stack.pop() // (
        var next = stack.pop()
        count = Int(String(next.removeLast())) ?? 0
        
        if count > 1 && tmp != "" {
            let tmp2 = tmp
            for _ in 0 ..< count-1 {
                tmp += tmp2
            }
            stack.push(str: next + tmp)
        } else {
            stack.pop()
        }
    } else {
        continue
    }
}

print(stack.stack.first!.count)
