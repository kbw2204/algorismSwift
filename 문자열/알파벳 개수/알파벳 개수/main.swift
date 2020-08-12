//
//  main.swift
//  알파벳 개수
//
//  Created by 강병우 on 2020/08/12.
//  Copyright © 2020 강병우. All rights reserved.
//

var arr = Array(repeating: 0, count: 26)
readLine()!.forEach {
    let idx = Int(UnicodeScalar(String($0))!.value - 97)
    arr[idx] += 1
}

arr.forEach {
    print($0, terminator: " ")
}
