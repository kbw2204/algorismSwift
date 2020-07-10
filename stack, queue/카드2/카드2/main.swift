//
//  main.swift
//  카드2
//
//  Created by 강병우 on 2020/07/10.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class Queue {
    var enqueue: [Int]
    var dequeue: [Int] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [Int]) {
        self.enqueue = queue
    }
    
    func push(_ n: Int) {
        enqueue.append(n)
    }
    
    func pop() -> Int? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

let ipt = Int(readLine()!)!
var queue: Queue = Queue(Array<Int>(1...ipt))

while !queue.isEmpty {
    if let drop = queue.pop() {
        if let next = queue.pop() {
            queue.push(next)
        } else {
            print(drop)
            break
        }
    }
}
