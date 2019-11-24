//
//  main.swift
//  convertPostfix
//
//  Created by 강병우 on 23/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//
import Foundation

class Stack {
    var stack: [String] = []
    
    func push(_ val: String) {
        stack.append(val)
    }

    func pop() -> String {
        return stack.isEmpty ? "-1" : stack.removeLast()
    }

    func size() -> Int {
        return stack.count
    }

    func empty() -> Bool {
        return stack.isEmpty ? true : false
    }

    func top() -> String {
        guard let val: String = stack.last else {
            return "-1"
        }
        return val
    }
}

func convertPostfix(_ arr: [String]) -> String {
    let stack: Stack = Stack()
    var postfix: [String] = []
    for i in 0 ..< arr.count {
        let ch = String(arr[i])
        if ch == "(" {
            continue
        } else if ch == "+" || ch == "-" || ch == "*" || ch == "/" {
            stack.push(ch)
        } else if ch == ")" {
            postfix.append(stack.pop())
        } else {
            postfix.append(ch)
        }
    }
    while !stack.empty() {
        postfix.append(stack.pop())
    }
    return postfix.reduce("",+)
}

let arr = "a+(b*c)*e+((f-g)/h)".map{String($0)}
print(convertPostfix(arr))
