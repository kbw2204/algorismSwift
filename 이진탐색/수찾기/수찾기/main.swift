//
//  main.swift
//  수찾기
//
//  Created by 강병우 on 2020/07/19.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

func binarySearch(_ arr: [Int], _ val: Int) -> Bool {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = (low+high)/2
        let guess = arr[mid]
        if guess == val {
            return true
        } else if guess > val {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return false
}

let _ = readLine()!
let arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let _ = readLine()!
readLine()!.split(separator: " ").map{Int(String($0))!}.forEach {
    if binarySearch(arr, $0) { print(1) }
    else { print(0)}
}

