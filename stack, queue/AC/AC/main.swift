//
//  main.swift
//  AC
//
//  Created by 강병우 on 2020/07/11.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

enum Command: String {
    case R = "R"
    case D = "D"
}

class Queue {
    var enqueue: [Int]
    var dequeue: [Int] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [Int]) {
        self.enqueue = queue
    }
    
    func drop() -> Bool {
        if isEmpty {
            return false
        } else {
            if dequeue.isEmpty {
                dequeue = enqueue.reversed()
                enqueue.removeAll()
            }
            dequeue.removeLast()
            return true
        }
    }
    
    func reverse() {
        swap(&enqueue, &dequeue)
    }
}

let n = Int(readLine()!)!

for _ in 0 ..< n {
    var ipt2 = readLine()!
    while ipt2.contains("RR") {
        ipt2 = ipt2.replacingOccurrences(of: "RR", with: "")
    }
    let ipt: [Command] = ipt2.map{Command(rawValue: String($0))!}
    let count = Int(readLine()!)!
    var arr: [Int] = []
    if count > 1 {
        var iptArr = readLine()!.split(separator: ",").map{String($0)}
        iptArr[iptArr.count-1].removeLast()
        iptArr[0].removeFirst()
        arr = iptArr.map{Int($0)!}
    } else if count == 1 {
        var iptArr = readLine()!
        iptArr.removeLast()
        iptArr.removeFirst()
        arr = [Int(iptArr)!]
    } else {
        let _ = readLine()!
    }
    let queue = Queue(arr)
    var key: Bool = true
    
    for cmd in ipt {
        switch cmd {
        case .D:
            if !queue.drop() {
                key = false
                print("error")
                break
            }
        case .R:
            queue.reverse()
        }
    }
    if key {
        print(queue.dequeue.reversed() + queue.enqueue)
    }
}

