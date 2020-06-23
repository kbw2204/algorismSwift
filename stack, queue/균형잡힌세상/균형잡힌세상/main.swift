//
//  main.swift
//  균형잡힌세상
//
//  Created by 강병우 on 2020/06/23.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class Stack {
    var stack: [String] = []
    func push(str: String) {
        stack.append(str)
    }
    func pop() -> String {
        return !stack.isEmpty ? stack.removeLast() : "0"
    }
}

func check(str: String) -> Bool {
    let stack: Stack = Stack()
    let string = str.replacingOccurrences(of: " ", with: "")
    let key: [String:String] = [")":"(", "]":"["]
    for i in string.indices {
        let char = String(string[i])
        if char == "(" || char == "[" {
            stack.push(str: char)
        } else if char == ")" || char == "]" {
            if !stack.stack.isEmpty {
                if key[char] != stack.pop() {
                    return false
                }
            } else {
                return false
            }
        }
    }
    return stack.stack.isEmpty ? false : true
}

var iptArray: [String] = []
var resultArray: [Bool] = []

var ipt = readLine()!
while ipt != "." {
    iptArray.append(ipt)
    resultArray.append(check(str: ipt))
    ipt = readLine()!
}

for key in resultArray {
    if key {
        print("yes")
    } else {
        print("no")
    }
}
