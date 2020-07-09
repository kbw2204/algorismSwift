//
//  main.swift
//  큐2
//
//  Created by 강병우 on 2020/07/09.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

enum cmd: String {
    case push = "push"
    case pop = "pop"
    case front = "front"
    case back = "back"
    case size = "size"
    case empty = "empty"
}

struct Queue {
    var queue: [Int] = []
    var dequeue: [Int] = []
    
    var isEmpty: Bool {
        return queue.isEmpty && dequeue.isEmpty
    }
    
    var peek: Int {
        return !isEmpty ? dequeue.last ?? queue.first! : -1
    }
    
    var back: Int {
        return !isEmpty ? dequeue.first ?? queue.last! : -1
    }
    
    var size: Int {
        return queue.count + dequeue.count
    }
    
    mutating func pop() -> Int {
        if dequeue.isEmpty {
            dequeue = queue.reversed()
            queue.removeAll()
        }
        return dequeue.popLast() ?? -1
    }
    
    mutating func push(_ val: Int) {
        queue.append(val)
    }
}

let n = Int(readLine()!)!
var queue = Queue()

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map{String($0)}
    let command: cmd = cmd(rawValue: line[0])!
    
    switch command {
    case .push:
        queue.push(Int(line.last!)!)
    case .pop:
        print(queue.pop())
    case .front:
        print(queue.peek)
    case .back:
        print(queue.back)
    case .size:
        print(queue.size)
    case .empty:
        queue.isEmpty ? print(1) : print(0)
    }
}
