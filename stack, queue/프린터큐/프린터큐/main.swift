//
//  main.swift
//  프린터큐
//
//  Created by 강병우 on 2020/07/10.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class Queue {
    var enqueue: [Int]
    var dequeue: [Int] = []
    var result: Int = 0
    
    init(_ queue: [Int]) {
        self.enqueue = queue
    }
    
    var max: Int {
        return [dequeue.max() ?? 0, enqueue.max() ?? 0].max()!
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    var peek: Int? {
        return !dequeue.isEmpty ? dequeue.last : enqueue.first
    }
    
    func pop() -> Int? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
    
    func push(_ n: Int) {
        enqueue.append(n)
    }
}

let n: Int = Int(readLine()!)!
for _ in 0 ..< n {
    let ipt = readLine()!.split(separator: " ").map{Int(String($0))!}
    var pos = ipt.last!
    let ipt2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let queue: Queue = Queue(ipt2)
    while queue.peek! < queue.max || pos != 0 {
        let max = queue.max
        if let front = queue.pop() {
            if front < max {
                queue.push(front)
            } else if front == max && pos != 0{
                queue.result += 1
            } else if pos == 0 {
                break
            }
            if pos != 0 {
                pos -= 1
            } else {
                pos = queue.count-1
            }
        }
    }
    queue.result += 1
    print(queue.result)
}
