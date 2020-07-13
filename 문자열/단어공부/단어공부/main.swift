//
//  main.swift
//  단어공부
//
//  Created by 강병우 on 2020/07/13.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

// a 유니코드 - 97
var arr: [Int] = Array(repeating: 0, count: 26)
var max = 0
var prt = 0
readLine()!.lowercased().map{Int(UnicodeScalar(String($0))!.value)}.forEach{
    arr[$0-97] += 1
    if max <= arr[$0-97] {
        max = arr[$0-97]
        prt = $0
    }
}
arr.filter{$0 == arr.max()!}.count > 1 ? print("?") : print(String(UnicodeScalar(prt)!).uppercased())
