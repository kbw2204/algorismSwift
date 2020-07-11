//
//  main.swift
//  최대힙
//
//  Created by 강병우 on 2020/07/11.
//  Copyright © 2020 강병우. All rights reserved.
//
import Foundation

//MARK: var
var heapArray: [Int] = []

//MARK: - func
func makeHeap(count: Int) {
    for i in 0 ..< count {
        var child = i
        while child > 0 {
            let root: Int = (child - 1) / 2
            if heapArray[root] < heapArray[child] {
                heapArray.swapAt(root, child)
            }
            child = root
        }
    }
}

func heap(count: Int) -> Int {
    makeHeap(count: count)
    for i in (0 ..< count - 1).reversed() {
        heapArray.swapAt(0, i)
        makeHeap(count: i)
    }
    for i in 0 ..< count - 1 {
        if heapArray[i] > heapArray[i+1] {
            heapArray.swapAt(i, i+1)
        }
    }
    return heapArray.removeLast()
}

//MARK: - run
let n = Int(readLine()!)!
for _ in 0 ..< n {
    let num = Int(readLine()!)!
    if num != 0 {
        heapArray.append(num)
        makeHeap(count: heapArray.count)
    } else {
        if heapArray.count != 0 {
            print(heap(count: heapArray.count))
        } else {
            print("0")
        }
    }
}
