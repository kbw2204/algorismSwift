//  main.swift
//
//  숫자카드2
//
//  Created by 강병우 on 2020/07/19.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

func binarySearch(_ arr: [Int], _ val: Int) -> Bool {
    var low = 0
    var high = arr.count-1
    
    while low <= high {
        let mid = (low+high)/2
        let guess = arr[mid]
        if guess == val {
            return true
        } else if guess > val {
            high = mid-1
        } else {
            low = mid+1
        }
    }
    return false
}

let _ = readLine()!
let arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var dic: [Int:Int] = [:]
arr.forEach {
    if dic[$0] != nil {
        dic[$0]! += 1
    } else {
        dic[$0] = 1
    }
}
let _ = readLine()!
var data = readLine()!.split(separator: " ").map{Int(String($0))!}
let last = data.removeLast()
data.forEach {
    if binarySearch(arr, $0) {
        print(dic[$0]!, terminator: " ")
    } else { print(0, terminator: " ")}
}

binarySearch(arr, last) ? print(dic[last]!) : print(0)
