//
//  main.swift
//  압축2
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

let input = readLine()! // 9(99(9))
var stack = Stack()
var str = ""
for i in 0 ..< input.count {
    let index = input.index(input.startIndex, offsetBy: i)
    let char = input[index]
    if char == Character("(") {
        stack.push(str: str)
        stack.push(str: "(")
        str = ""
    } else if char == Character(")") {
        stack.push(str: str)
        stack.push(str: "(")
        str = ""
    } else {
        str += String(char)
    }
}
if str != "" {
    stack.push(str: str)
}

var peek = 
    if stack.stack[i] == "(" {
        
    } else if stack.stack[i] == "(" {
        
    } else {
        
    }


//var inputArray = Array(input.components(separatedBy: ["(", ")"]).reversed())

//
//for i in 0 ..< input.count {
//    let index = input.index(input.startIndex, offsetBy: i)
//    let char = input[index]
//    if char == Character("(") {
//        stack.push(str: inputArray.removeLast())
//    } else if char == Character(")") {
//        stack.push(str: inputArray.removeLast())
//        var tmp = stack.pop()
//        var next = stack.pop()
//        let count = Int(String(next.removeLast())) ?? 0
//        if count > 0 && tmp != ""{
//            let tmp2 = tmp
//            if count != 1 {
//                for _ in 0 ..< count-1 {
//                    tmp += tmp2
//                }
//            }
//
//            stack.push(str: next + tmp)
//        } else if next != "" {
//            stack.push(str: next)
//        }
//    } else {
//
//    }
//}
//print(stack.stack.first!.count)
